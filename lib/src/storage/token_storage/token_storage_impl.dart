import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:synchronized/synchronized.dart';

import 'auth_token_pair.dart';

/// {@template tokens_storage.class}
/// Implementation [TokenStorage]
/// {@endtemplate}
class TokenStorageImplShared implements TokenStorage<AuthTokenPair> {
  final SharedPreferences _prefs;
  AuthTokenPair? _cachedToken;

  TokenStorageImplShared(this._prefs);

  @override
  Future<AuthTokenPair?> read() async {
    if (_cachedToken != null) return _cachedToken;
    
    final json = _prefs.getString('auth_token');
    if (json == null) return null;
    
    try {
      _cachedToken = AuthTokenPair.fromJson(jsonDecode(json));
      return _cachedToken;
    } catch (e) {
      await _prefs.remove('auth_token');
      return null;
    }
  }

  @override
  Future<void> write(AuthTokenPair value) async {
    _cachedToken = value;
    await _prefs.setString('auth_token', jsonEncode(value.toJson()));
  }

  @override
  Future<void> delete() async {
    _cachedToken = null;
    await _prefs.remove('auth_token');
  }
}

final class TokenStorageImpl implements TokenStorage<AuthTokenPair> {
  final FlutterSecureStorage _secureStorage;
  AuthTokenPair? _cachedToken;
  final _lock = Lock();
  TokenStorageImpl(this._secureStorage);

  @override
  Future<AuthTokenPair?> read() async {
     if (_cachedToken != null) return _cachedToken;
    return await _lock.synchronized(() async {
      try {
        final tokenJson = await _secureStorage.read(
          key: TokensStorageKeys.authToken.keyName,
        );

        if (tokenJson == null) {
          debugPrint('No token found in secure storage');
          return null;
        }

        _cachedToken = AuthTokenPair.fromJson(tokenJson);
        debugPrint('Token retrieved: ${_cachedToken?.accessToken.substring(0, 10)}...');
        return _cachedToken;
      } on PlatformException catch (e) {
        debugPrint('Secure storage read error: ${e.toString()}');
        if (e.code == 'BadPaddingException' || e.code.contains('crypto')) {
          await _secureStorage.delete(key: TokensStorageKeys.authToken.keyName);
          debugPrint('Deleted corrupted token due to decryption error');
        }
        return null;
      }
    });
  }

  @override
  Future<void> write(AuthTokenPair token) async {
    _cachedToken = token;
    await _lock.synchronized(() async {
      try {
        // Write to secure storage
        await _secureStorage.write(
          key: TokensStorageKeys.authToken.keyName,
          value: token.toJson(),
        );
        debugPrint(
          'Token written successfully, expires at: ${DateTime.fromMillisecondsSinceEpoch(token.expiresAt ?? 0)}',
        );
      } catch (e) {
        debugPrint('Token write failed: $e');
        rethrow;
      }
    });
  }

  @override
  Future<void> delete() async {
     _cachedToken = null;
    await _lock.synchronized(() async {
      try {
        await _secureStorage.delete(key: TokensStorageKeys.authToken.keyName);
        debugPrint('Token deleted from all storage');
      } catch (e) {
        debugPrint('Token deletion failed: $e');
      }
    });
  }
}

/// Keys for [TokenStorageImpl]
enum TokensStorageKeys {
  authToken('app_auth_token');

  /// Key name
  final String keyName;

  const TokensStorageKeys(this.keyName);
}

abstract class TokenStorage<T> {
  /// Returns the stored token asynchronously.
  Future<T?> read();

  /// Saves the provided [token] asynchronously.
  Future<void> write(T token);

  /// Deletes the stored token asynchronously.
  Future<void> delete();
}
