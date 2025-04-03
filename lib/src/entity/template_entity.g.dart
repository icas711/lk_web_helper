// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TemplateEntityImpl _$$TemplateEntityImplFromJson(Map<String, dynamic> json) =>
    _$TemplateEntityImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      screen: json['screen'] as String,
      externalId: json['externalId'] as String?,
      link: json['link'] as String?,
    );

Map<String, dynamic> _$$TemplateEntityImplToJson(
        _$TemplateEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'screen': instance.screen,
      'externalId': instance.externalId,
      'link': instance.link,
    };
