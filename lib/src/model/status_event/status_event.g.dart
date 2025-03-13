// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StatusEventsImpl _$$StatusEventsImplFromJson(Map<String, dynamic> json) =>
    _$StatusEventsImpl(
      statusEvents: (json['statusEvents'] as List<dynamic>?)
          ?.map((e) => StatusEvent.fromMap(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$StatusEventsImplToJson(_$StatusEventsImpl instance) =>
    <String, dynamic>{
      'statusEvents': instance.statusEvents,
    };
