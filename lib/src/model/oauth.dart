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
  final _pendingRequests = <Completer<void>>[];
  bool _isRefreshing = false;

  Future<bool> get isSignedIn async {
    final AuthTokenPair? token = await storage.read();
    return token != null;
  }

  Future<AuthTokenPair?> get token async => storage.read();

  Future<TokenData> getData() async {
    final AuthTokenPair? authTokenPair = await storage.read();
    Map<String, dynamic> decodedToken = JwtDecoder.decode(
      authTokenPair?.accessToken ?? '',
    );
    return (TokenData(
      userEmail: decodedToken['email'],
      organizationId: decodedToken['organizationId'],
    ));
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
      now.add(Duration(seconds: 5)); // Добавляем небольшую задержку
      if (refreshExpiresAt.isBefore(now)) {
        // refresh токен истёк, делаем login
        await login(
          PasswordGrant(
            username: authTokenPair?.username ?? '',
            password: authTokenPair?.password ?? '',
          ),
        );
        // Читаем новый токен и повторяем запрос с ним
        final newToken = (await storage.read())?.accessToken;
        if (newToken != null) {
          options.headers['Authorization'] = 'Bearer $newToken';
        }
        return handler.next(options); // повторяем запрос с новым токеном
      } else if (expiresAt.isBefore(now)) {
        // access токен истёк, делаем refresh
        await refresh();
        final newToken = (await storage.read())?.accessToken;
        if (newToken != null) {
          options.headers['Authorization'] = 'Bearer $newToken';
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

  String? username;
  String? password;
  Future<AuthTokenPair> login(OAuthGrantType grant) async {
    if (grant is PasswordGrant) {
      username = grant.username;
      password = grant.password;
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
    final body = response.data!;
    final userid = JwtDecoder.decode(body['access_token'])['userId'];
    final AuthTokenPair authTokenPair = AuthTokenPair(
      accessToken: body['access_token'] ?? '',
      refreshToken: body['refresh_token'] ?? '',
      expiresIn: body['expires_in'] as int,
      refreshExpiresIn: body['refresh_expires_in'] as int,
      userId: userid,
      expiresAt:
          (clock.now().isUtc ? clock.now().toUtc() : clock.now())
              .add((body['expires_in'] as int).seconds)
              .millisecondsSinceEpoch,
      refreshExpiresAt:
          (clock.now().isUtc ? clock.now().toUtc() : clock.now())
              .add((body['refresh_expires_in'] as int).seconds)
              .millisecondsSinceEpoch,
      username: username,
      password: password,
    );
    await _storageLock.synchronized(() async {
      await storage.write(authTokenPair); // Сохраняем под блокировкой
    });
    return authTokenPair;
  }

  Future<void> refresh() async {
    final refreshToken = (await storage.read())?.refreshToken;
    if (refreshToken != null) {
      final grant = RefreshTokenGrant(refreshToken: refreshToken);
      await login(grant);
    }
  }

  Future<void> logout() async {
    await storage.delete();
    _authDio.close();
  }
}

extension NumTimeExtension on num {
  Duration get seconds => Duration(seconds: toInt());
  Duration get milliseconds => Duration(milliseconds: toInt());
  Duration get microseconds => Duration(microseconds: toInt());
}

// Вспомогательный класс для безопасной работы с handler
class _SafeHandler {
  final RequestInterceptorHandler _handler;
  bool _isCompleted = false;

  _SafeHandler(this._handler);

  void next(RequestOptions options) {
    if (!_isCompleted) {
      _isCompleted = true;
      _handler.next(options);
    }
  }

  void reject(DioException error) {
    if (!_isCompleted) {
      _isCompleted = true;
      _handler.reject(error);
    }
  }
}
