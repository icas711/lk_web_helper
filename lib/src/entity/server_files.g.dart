// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_files.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServerFilesImpl _$$ServerFilesImplFromJson(Map<String, dynamic> json) =>
    _$ServerFilesImpl(
      serverFiles: (json['serverFiles'] as List<dynamic>?)
          ?.map((e) => ServerFile.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ServerFilesImplToJson(_$ServerFilesImpl instance) =>
    <String, dynamic>{
      'serverFiles': instance.serverFiles,
    };

_$ServerFileImpl _$$ServerFileImplFromJson(Map<String, dynamic> json) =>
    _$ServerFileImpl(
      id: json['id'] as String,
      filename: json['filename'] as String?,
      date: const DateTimeConverter().fromJson(json['date']),
      contentType: json['contentType'] as String?,
      size: (json['size'] as num?)?.toInt(),
      checksum: (json['checksum'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ServerFileImplToJson(_$ServerFileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'filename': instance.filename,
      'date': _$JsonConverterToJson<dynamic, DateTime>(
          instance.date, const DateTimeConverter().toJson),
      'contentType': instance.contentType,
      'size': instance.size,
      'checksum': instance.checksum,
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
