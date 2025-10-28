import 'dart:async';

import 'package:clock/clock.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:synchronized/synchronized.dart';

import '../helpers/jwt_decoder.dart';
import '../helpers/url.dart';
import '../storage/token_storage/auth_token_pair.dart';
import '../storage/token_storage/token_storage_impl.dart';
import 'oauth_grant_type.dart';
import 'token_data.dart';

class OAuth extends Interceptor {
  OAuth({
    required this.tokenUrl,
    required this.clientId,
    required this.clientSecret,
    required this.apiDio,
    this.clock = const Clock(),
    required this.storage,
  }) : _authDio = Dio(BaseOptions(baseUrl: Url.prod.authorization)) // Для OAuth
       {
    // Настраиваем интерцепторы для _authDio (логирование в debug)
    if (kDebugMode) {
      _authDio.interceptors.add(
        LogInterceptor(requestHeader: true, responseBody: true),
      );
    }
  }
  final Dio _authDio; // Для запросов токенов
  final Dio apiDio; // Для API-запросов
  final String tokenUrl;
  final String clientId;
  final String clientSecret;
  final Clock clock;
  final TokenStorage<AuthTokenPair> storage;

  final _refreshLock = Lock();

  Future<bool> get isSignedIn async {
    final AuthTokenPair? token = await storage.read();
    return token != null;
  }

  Future<AuthTokenPair?> get token async => storage.read();

  Future<TokenData?> getData() async {
    final AuthTokenPair? authTokenPair = await storage.read();
    if (authTokenPair?.accessToken == null ||
        authTokenPair!.accessToken.isEmpty) {
      return null; // Возвращаем null вместо исключения
    }

    try {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(
        authTokenPair.accessToken,
      );
      return TokenData(
        userEmail: decodedToken['email'],
        organizationId: decodedToken['organizationId'],
      );
    } catch (e) {
      // Логируем ошибку и возвращаем null вместо исключения
      if (kDebugMode) {
        print('Failed to decode token: $e');
      }
      return null;
    }
  }

  final _storageLock = Lock();
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.path == tokenUrl) {
      return handler.next(options);
    }

    final authTokenPair = await storage.read();
    final expiresAtMillis = authTokenPair?.expiresAt;
    final refreshExpiresAtMillis = authTokenPair?.refreshExpiresAt;
    if (expiresAtMillis != null && refreshExpiresAtMillis != null) {
      final expiresAt = DateTime.fromMillisecondsSinceEpoch(expiresAtMillis);
      final refreshExpiresAt = DateTime.fromMillisecondsSinceEpoch(
        refreshExpiresAtMillis,
      );
      var now = DateTime.now().toLocal(); // Учитываем локальное время
      now = now.add(Duration(seconds: 5)); // Добавляем небольшую задержку
      if (refreshExpiresAt.isBefore(now)) {
        // refresh токен истёк, проверяем наличие credentials
        final username = authTokenPair?.username;
        final password = authTokenPair?.password;

        if (username != null &&
            username.isNotEmpty &&
            password != null &&
            password.isNotEmpty) {
          // Делаем login только если есть валидные credentials
          try {
            await login(PasswordGrant(username: username, password: password));
            // Читаем новый токен и повторяем запрос с ним
            final newToken = (await storage.read())?.accessToken;
            if (newToken != null) {
              options.headers['Authorization'] = 'Bearer $newToken';
            }
          } catch (e) {
            // Если login не удался - продолжаем без токена
            // Можно залогировать ошибку в debug режиме
            if (kDebugMode) {
              print('OAuth login failed: $e');
            }
          }
        } else {
          // Нет валидных credentials - очищаем хранилище
          await clearStorage();
        }
        return handler.next(options);
      } else if (expiresAt.isBefore(now)) {
        // access токен истёк, делаем refresh
        final refreshSuccess = await refresh();
        if (refreshSuccess) {
          final newToken = (await storage.read())?.accessToken;
          if (newToken != null) {
            options.headers['Authorization'] = 'Bearer $newToken';
          }
        }
        return handler.next(options);
      }
    }

    // Если токен валиден
    if (authTokenPair != null) {
      options.headers['Authorization'] = 'Bearer ${authTokenPair.accessToken}';
    }
    return super.onRequest(options, handler);
  }

  Future<AuthTokenPair> login(OAuthGrantType grant) async {
    String? username;
    String? password;

    if (grant is PasswordGrant) {
      username = grant.username;
      password = grant.password;

      // Проверяем валидность credentials для PasswordGrant
      if (username.isEmpty || password.isEmpty) {
        throw DioException(
          requestOptions: RequestOptions(path: tokenUrl),
          error: 'Username and password cannot be empty',
          type: DioExceptionType.unknown,
        );
      }
    }

    final options = await grant.handle(
      RequestOptions(
        path: tokenUrl,
        method: 'POST',
        // contentType: 'application/json; charset=UTF-8',
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
        responseType: ResponseType.json,
      ),
    );

    (options.data as Map<String, String>).addAll({
      'client_id': clientId,
      'client_secret': clientSecret,
    });

    final response = await _authDio.request<Map<String, dynamic>>(
      tokenUrl,
      data: options.data,
      options: Options(
        contentType: options.contentType,
        headers: options.headers,
        method: options.method,
      ),
    );

    final body = response.data;
    if (body == null) {
      throw DioException(
        requestOptions: response.requestOptions,
        error: 'Response body is null',
        type: DioExceptionType.badResponse,
      );
    }

    final accessToken = body['access_token'] as String?;
    if (accessToken == null || accessToken.isEmpty) {
      throw DioException(
        requestOptions: response.requestOptions,
        error: 'Access token not found in response',
        type: DioExceptionType.badResponse,
      );
    }

    // Безопасное декодирование JWT
    Map<String, dynamic> decodedToken;
    try {
      decodedToken = JwtDecoder.decode(accessToken);
    } catch (e) {
      throw DioException(
        requestOptions: response.requestOptions,
        error: 'Invalid JWT token: $e',
        type: DioExceptionType.badResponse,
      );
    }

    final userid = decodedToken['userId'];
    final now = clock.now();
    final AuthTokenPair authTokenPair = AuthTokenPair(
      accessToken: accessToken,
      refreshToken: body['refresh_token'] as String? ?? '',
      expiresIn: body['expires_in'] as int? ?? 3600,
      refreshExpiresIn: body['refresh_expires_in'] as int? ?? 86400,
      userId: userid,
      expiresAt:
          now
              .add((body['expires_in'] as int? ?? 3600).seconds)
              .millisecondsSinceEpoch,
      refreshExpiresAt:
          now
              .add((body['refresh_expires_in'] as int? ?? 86400).seconds)
              .millisecondsSinceEpoch,
      username: username,
      password: password,
    );
    await _storageLock.synchronized(() async {
      await storage.write(authTokenPair); // Сохраняем под блокировкой
    });
    return authTokenPair;
  }

  @override
  Future<void> onError(
    DioException error,
    ErrorInterceptorHandler handler,
  ) async {
    // Если это сетевая ошибка (нет интернета, timeout и т.д.)
    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.sendTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.connectionError) {
      // НЕ пытаемся обновить токен при сетевых ошибках
      // Просто пропускаем ошибку дальше
      return handler.next(error);
    }

    // Проверяем, что это не запрос на получение токена (избегаем бесконечный цикл)
    if (error.requestOptions.path == tokenUrl) {
      return handler.next(error);
    }

    // Если это 401 (Unauthorized) - тогда пытаемся обновить токен
    if (error.response?.statusCode == 401) {
      return await _refreshLock.synchronized(() async {
        try {
          // Проверяем, не обновили ли токен уже другой запрос
          final currentToken = await storage.read();
          if (currentToken != null &&
              error.requestOptions.headers['Authorization'] ==
                  'Bearer ${currentToken.accessToken}') {
            // Токен тот же, нужно обновить
            await refresh();
          }

          // Получаем обновленный токен
          final newToken = await storage.read();
          if (newToken?.accessToken != null) {
            // Повторяем оригинальный запрос с новым токеном
            final requestOptions = error.requestOptions;
            requestOptions.headers['Authorization'] =
                'Bearer ${newToken!.accessToken}';

            try {
              final response = await apiDio.fetch(requestOptions);
              return handler.resolve(response);
            } catch (retryError) {
              // Если повторный запрос не удался - пропускаем исходную ошибку
              return handler.next(error);
            }
          } else {
            // Токен не получен - пропускаем ошибку
            return handler.next(error);
          }
        } catch (refreshError) {
          // Если refresh не удался - пропускаем ошибку
          return handler.next(error);
        }
      });
    }

    return handler.next(error);
  }

  Future<bool> refresh() async {
    final refreshToken = (await storage.read())?.refreshToken;
    if (refreshToken != null && refreshToken.isNotEmpty) {
      final grant = RefreshTokenGrant(refreshToken: refreshToken);
      try {
        await login(grant);
        return true;
      } on DioException catch (e) {
        final passwordGrant = PasswordGrant(
          username: (await storage.read())?.username ?? '',
          password: (await storage.read())?.password ?? '',
        );
        await login(passwordGrant);
        return true;
        // Если refresh не удался, очищаем хранилище
        // if (e.response?.statusCode == 400 || e.response?.statusCode == 401) {
        //   await clearStorage();
        // }
      }
    } else {
      // Нет refresh токена - очищаем хранилище
       await storage.delete();
      return false;
    }
  }

  void dispose() {
    _authDio.close();
  }

  Future<void> logout() async {
    await storage.delete();
    _authDio.close();
  }

  Future<void> clearStorage() async {
    final authTokenPair = await storage.read();

    final username = authTokenPair?.username;
    final password = authTokenPair?.password;

    if ((username == null || username.isEmpty) ||
        (password == null || password.isEmpty)) {
      await storage.delete();
    }
  }
}

extension NumTimeExtension on num {
  Duration get seconds => Duration(seconds: toInt());
  Duration get milliseconds => Duration(milliseconds: toInt());
  Duration get microseconds => Duration(microseconds: toInt());
}
