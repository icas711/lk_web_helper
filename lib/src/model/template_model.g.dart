// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TemplatesImpl _$$TemplatesImplFromJson(Map<String, dynamic> json) =>
    _$TemplatesImpl(
      templates: (json['templates'] as List<dynamic>?)
          ?.map((e) => TemplateModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TemplatesImplToJson(_$TemplatesImpl instance) =>
    <String, dynamic>{
      'templates': instance.templates,
    };

_$TemplateModelImpl _$$TemplateModelImplFromJson(Map<String, dynamic> json) =>
    _$TemplateModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      externalId: json['externalId'] as String?,
      link: json['link'] as String?,
    );

Map<String, dynamic> _$$TemplateModelImplToJson(_$TemplateModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'externalId': instance.externalId,
      'link': instance.link,
    };
