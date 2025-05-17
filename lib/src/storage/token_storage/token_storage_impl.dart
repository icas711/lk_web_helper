import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:synchronized/synchronized.dart';

import 'auth_token_pair.dart';

/// {@template tokens_storage.class}
/// Implementation [TokenStorage]
/// {@endtemplate}
final class TokenStorageImplShared implements TokenStorage<AuthTokenPair> {
  /* final SharedPreferences _secureStorage;

  /// {@macro tokens_storage.class}
  const TokenStorageImplShared(this._secureStorage);*/

  @override
  Future<AuthTokenPair?> read() async {
    final SharedPreferences _secureStorage =
        await SharedPreferences.getInstance();
    final tokenJson = _secureStorage.getString(
      TokensStorageKeys.authToken.keyName,
    );
    if (tokenJson == null) return null;
    return AuthTokenPair.fromJson(tokenJson);
  }

  @override
  Future<void> write(AuthTokenPair token) async {
    final SharedPreferences _secureStorage =
        await SharedPreferences.getInstance();
    await _secureStorage.setString(
      TokensStorageKeys.authToken.keyName,
      token.toJson(),
    );
  }

  @override
  Future<void> delete() async {
    final SharedPreferences _secureStorage =
        await SharedPreferences.getInstance();
    for (final key in TokensStorageKeys.values) {
      await _secureStorage.remove(key.keyName);
    }
  }
}

final class TokenStorageImpl implements TokenStorage<AuthTokenPair> {
  final FlutterSecureStorage _secureStorage;
  final _lock = Lock();
  TokenStorageImpl(this._secureStorage);

  @override
  Future<AuthTokenPair?> read() async {
    return await _lock.synchronized(() async {
      try {
        final tokenJson = await _secureStorage.read(
          key: TokensStorageKeys.authToken.keyName,
        );

        if (tokenJson == null) {
          debugPrint('No token found in secure storage');
          return null;
        }

        final token = AuthTokenPair.fromJson(tokenJson);
        debugPrint('Token retrieved: ${token.accessToken.substring(0, 10)}...');
        return token;
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
    await _lock.synchronized(() async {
      print('login: ${token.username}');
      print('login: ${token.password}');
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
