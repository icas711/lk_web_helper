// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AuthTokenPair {
  /// Access-token for accessing server resources for an authorized user.
  final String accessToken;

  /// Refresh-token for updating the access-token.
  final String refreshToken;

  final int? expiresAt;
  final int? expiresIn;
  final int? refreshExpiresIn;
  final int? refreshExpiresAt;
  final String? userId;
  final String? username;
  final String? password;
  AuthTokenPair({
    required this.accessToken,
    required this.refreshToken,
    this.expiresAt,
    this.expiresIn,
    this.refreshExpiresIn,
    this.refreshExpiresAt,
    this.userId,
    this.username,
    this.password,
  });

  AuthTokenPair copyWith({
    String? accessToken,
    String? refreshToken,
    int? expiresAt,
    int? expiresIn,
    int? refreshExpiresIn,
    int? refreshExpiresAt,
    String? userId,
    String? username,
    String? password,
  }) {
    return AuthTokenPair(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      expiresAt: expiresAt ?? this.expiresAt,
      expiresIn: expiresIn ?? this.expiresIn,
      refreshExpiresIn: refreshExpiresIn ?? this.refreshExpiresIn,
      refreshExpiresAt: refreshExpiresAt ?? this.refreshExpiresAt,
      userId: userId ?? this.userId,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'expiresAt': expiresAt,
      'expiresIn': expiresIn,
      'refreshExpiresIn': refreshExpiresIn,
      'refreshExpiresAt': refreshExpiresAt,
      'userId': userId,
      'username': username,
      'password': password,
    };
  }

  factory AuthTokenPair.fromMap(Map<String, dynamic> map) {
    return AuthTokenPair(
      accessToken: map['accessToken'] as String,
      refreshToken: map['refreshToken'] as String,
      expiresAt: map['expiresAt'] != null ? map['expiresAt'] as int : null,
      expiresIn: map['expiresIn'] != null ? map['expiresIn'] as int : null,
      refreshExpiresIn:
          map['refreshExpiresIn'] != null
              ? map['refreshExpiresIn'] as int
              : null,
      refreshExpiresAt:
          map['refreshExpiresAt'] != null
              ? map['refreshExpiresAt'] as int
              : null,
      userId: map['userId'] != null ? map['userId'] as String : null,
      username: map['username'] != null ? map['username'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthTokenPair.fromJson(String source) =>
      AuthTokenPair.fromMap(json.decode(source) as Map<String, dynamic>);
}
