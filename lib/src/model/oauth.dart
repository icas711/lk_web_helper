import 'package:clock/clock.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:synchronized/synchronized.dart';

import '../helpers/jwt_decoder.dart';
import '../storage/token_storage/auth_token_pair.dart';
import '../storage/token_storage/token_storage_impl.dart';
import 'oauth_grant_type.dart';
import 'token_data.dart';

class OAuth extends Interceptor {
  OAuth({
    required this.tokenUrl,
    required this.clientId,
    required this.clientSecret,
    this.dio,
    this.name = 'oauth',
    this.clock = const Clock(),
    required this.storage,
  });

  final String tokenUrl;
  final String clientId;
  final String clientSecret;
  final String name;
  final Dio? dio;
  final Clock clock;
  final TokenStorage<AuthTokenPair> storage;

  final _refreshLock = Lock();
  bool _isRefreshing = false;
  String? username;
  String? password;
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

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Пропустить запросы токенов, чтобы избежать циклов
    if (options.path == tokenUrl) {
      return handler.next(options);
    }
    try {
      final authTokenPair = await storage.read();
      if (authTokenPair == null) {
        return handler.next(options);
      }
      final now = clock.now().add(Duration(minutes: 1));
      final expiresAt = DateTime.fromMillisecondsSinceEpoch(
        authTokenPair.expiresAt ?? 0,
      );
      final refreshExpiresAt = DateTime.fromMillisecondsSinceEpoch(
        authTokenPair.refreshExpiresAt ?? 0,
      );
      //Проверяет, нужно ли обновить токен (с буфером в 1 минуту)
      if (expiresAt.isBefore(now)) {
        await _safeRefresh(authTokenPair);
      }

      // Присваивает текущий токен (уже мог быть обновлен)
      final currentToken = await storage.read();
      if (currentToken != null) {
        options.headers['Authorization'] = 'Bearer ${currentToken.accessToken}';
        debugPrint(
          'Attached token to request: ${currentToken.accessToken.substring(0, 10)}...',
        );
      }
    } catch (e) {
      debugPrint('OAuth interceptor error: $e');
    } finally {
      handler.next(options);
    }
  }

  Future<void> _safeRefresh(AuthTokenPair authTokenPair) async {
    if (_isRefreshing) return;

    await _refreshLock.synchronized(() async {
      if (_isRefreshing) return;
      _isRefreshing = true;

      try {
        debugPrint('Attempting token refresh...');
        await refresh();
        debugPrint('Token refresh successful');
      } catch (e) {
        debugPrint('Token refresh failed: $e');
        // Если обновление не удалось, но есть учетные данные,
        // то пробует выполнить полный вход
        if (authTokenPair.username != null && authTokenPair.password != null) {
          try {
            debugPrint('Attempting full reauthentication...');
            await login(
              PasswordGrant(
                username: authTokenPair.username!,
                password: authTokenPair.password!,
              ),
            );
          } catch (e) {
            debugPrint('Full reauthentication failed: $e');
            await logout();
          }
        } else {
          await logout();
        }
      } finally {
        _isRefreshing = false;
      }
    });
  }

  Future<AuthTokenPair> login(OAuthGrantType grant) async {
    if (grant is PasswordGrant) {
      username = grant.username;
      password = grant.password;
    }

    final dio = this.dio ?? Dio();
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

    final response = await dio.request<Map<String, dynamic>>(
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
          clock
              .now()
              .add((body['expires_in'] as int).seconds)
              .millisecondsSinceEpoch,
      refreshExpiresAt:
          clock
              .now()
              .add((body['refresh_expires_in'] as int).seconds)
              .millisecondsSinceEpoch,
      username: username,
      password: password,
    );
    await storage.write(authTokenPair);
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
  }
}

extension NumTimeExtension<T extends num> on T {
  /// Returns a Duration represented in seconds
  Duration get seconds => milliseconds * Duration.millisecondsPerSecond;

  /// Returns a Duration represented in milliseconds
  Duration get milliseconds => Duration(
    microseconds: (this * Duration.microsecondsPerMillisecond).toInt(),
  );

  /// Returns a Duration represented in microseconds
  Duration get microseconds =>
      milliseconds ~/ Duration.microsecondsPerMillisecond;
}
