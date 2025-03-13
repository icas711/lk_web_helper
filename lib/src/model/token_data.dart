import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_data.g.dart';

@JsonSerializable()
class TokenData{
  final String? userEmail, userRole, organizationId;
  TokenData({this.userEmail, this.userRole, this.organizationId});

  factory TokenData.fromJson(Map<String, dynamic> json) => _$TokenDataFromJson(json);

  Map<String, dynamic> toJson() => _$TokenDataToJson(this);

}