import 'dart:convert';

class RuStoreToken {
  final String accessToken;
  final int? expiresAt;
  RuStoreToken({
    required this.accessToken,
    this.expiresAt,
  });

  RuStoreToken copyWith({
    String? accessToken,
    int? expiresAt,
    int? expiresIn,
  }) {
    return RuStoreToken(
      accessToken: accessToken ?? this.accessToken,
      expiresAt: expiresAt ?? this.expiresAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accessToken': accessToken,
      'expiresAt': expiresAt,
    };
  }

  factory RuStoreToken.fromMap(Map<String, dynamic> map) {
    return RuStoreToken(
      accessToken: map['accessToken'] as String,
      expiresAt: map['expiresAt'] != null ? map['expiresAt'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RuStoreToken.fromJson(String source) =>
      RuStoreToken.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'RuStoreToken(accessToken: $accessToken, expiresAt: $expiresAt)';

  @override
  bool operator ==(covariant RuStoreToken other) {
    if (identical(this, other)) return true;

    return other.accessToken == accessToken &&
        other.expiresAt == expiresAt;
  }

  @override
  int get hashCode =>
      accessToken.hashCode ^ expiresAt.hashCode;
}
