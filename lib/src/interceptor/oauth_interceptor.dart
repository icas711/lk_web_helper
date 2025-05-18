import 'dart:async';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OAuth2Interceptor extends Interceptor {
  final Dio _authDio = Dio();
  final String _tokenUrl;
  final String _clientId;
  final String _clientSecret;
  final List<String> _scopes;
  
  static const String _accessTokenKey = 'oauth2_access_token';
  static const String _refreshTokenKey = 'oauth2_refresh_token';
  static const String _expiresAtKey = 'oauth2_expires_at';

  OAuth2Interceptor({
    required String tokenUrl,
    required String clientId,
    required String clientSecret,
    required List<String> scopes,
  })  : _tokenUrl = tokenUrl,
        _clientId = clientId,
        _clientSecret = clientSecret,
        _scopes = scopes;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Получаем текущий токен
    final accessToken = await _getValidAccessToken();
    
    // Добавляем токен в заголовок Authorization
    options.headers['Authorization'] = 'Bearer $accessToken';
    
    return handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // Если ошибка 401 (Unauthorized), пробуем обновить токен
    if (err.response?.statusCode == 401) {
      try {
        // Получаем новый токен
        final newAccessToken = await _refreshToken();
        
        // Повторяем оригинальный запрос с новым токеном
        final options = err.requestOptions;
        options.headers['Authorization'] = 'Bearer $newAccessToken';
        
        final response = await _authDio.fetch(options);
        return handler.resolve(response);
      } catch (e) {
        // Если не удалось обновить токен, пробрасываем ошибку дальше
        return handler.next(err);
      }
    }
    
    return handler.next(err);
  }

  Future<String> _getValidAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString(_accessTokenKey);
    final expiresAt = prefs.getInt(_expiresAtKey);
    
    // Если токена нет или срок его действия истек, запрашиваем новый
    if (accessToken == null || 
        expiresAt == null || 
        DateTime.now().millisecondsSinceEpoch >= expiresAt) {
      return await _refreshToken();
    }
    
    return accessToken;
  }

  Future<String> _refreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    final refreshToken = prefs.getString(_refreshTokenKey);
    
    // Если есть refresh token, используем его для получения нового access token
    if (refreshToken != null) {
      return _requestToken(
        grantType: 'refresh_token',
        refreshToken: refreshToken,
      );
    }
    
    // Иначе запрашиваем новый токен с помощью client credentials
    return _requestToken(grantType: 'client_credentials');
  }

  Future<String> _requestToken({
    required String grantType,
    String? refreshToken,
  }) async {
    final response = await _authDio.post(
      _tokenUrl,
      data: {
        'grant_type': grantType,
        'client_id': _clientId,
        'client_secret': _clientSecret,
        if (grantType == 'refresh_token') 'refresh_token': refreshToken,
        if (_scopes.isNotEmpty) 'scope': _scopes.join(' '),
      },
    );
    
    final accessToken = response.data['access_token'] as String;
    final expiresIn = response.data['expires_in'] as int;
    final refreshTokenNew = response.data['refresh_token'] as String?;
    
    // Сохраняем токены в SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_accessTokenKey, accessToken);
    await prefs.setInt(
      _expiresAtKey,
      DateTime.now().millisecondsSinceEpoch + expiresIn * 1000,
    );
    
    if (refreshTokenNew != null) {
      await prefs.setString(_refreshTokenKey, refreshTokenNew);
    }
    
    return accessToken;
  }

  // Метод для первоначальной аутентификации
  Future<void> authenticate() async {
    await _refreshToken();
  }

  // Метод для выхода (очистки токенов)
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_accessTokenKey);
    await prefs.remove(_refreshTokenKey);
    await prefs.remove(_expiresAtKey);
  }
}