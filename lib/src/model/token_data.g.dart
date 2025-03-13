// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenData _$TokenDataFromJson(Map<String, dynamic> json) => TokenData(
      userEmail: json['userEmail'] as String?,
      userRole: json['userRole'] as String?,
      organizationId: json['organizationId'] as String?,
    );

Map<String, dynamic> _$TokenDataToJson(TokenData instance) => <String, dynamic>{
      'userEmail': instance.userEmail,
      'userRole': instance.userRole,
      'organizationId': instance.organizationId,
    };
