// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

@freezed
class StatusEvents {
  final List<StatusEvent> statusEvents;

  StatusEvents({required this.statusEvents});

  factory StatusEvents.fromJson(Map<String, dynamic> json) {
    return StatusEvents(
      statusEvents:
          (json['items'] as List<dynamic>)
              .map((e) => StatusEvent.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  factory StatusEvents.fromList(List list) {
    return StatusEvents(
      statusEvents: list.map((e) => StatusEvent.fromJson(e)).toList(),
    );
  }
  Map<String, dynamic> toJson() {
    return {'items': statusEvents.map((e) => e.toJson()).toList()};
  }
}

class StatusEvent {
  final String? organizationId;
  final String? parentId;
  final DateTime? date;
  final String? status;
  final Map<String, dynamic>? comment;

  StatusEvent({
    this.organizationId,
    this.parentId,
    this.date,
    this.status,
    this.comment,
  });

  factory StatusEvent.fromJson(Map<String, dynamic> json) {
    return StatusEvent(
      organizationId: json['organizationId'] as String?,
      parentId: json['parentId'] as String?,
      date: json['date'] != null ? DateTime.parse(json['date']) : null,
      status: json['status'] as String?,
      comment:
          json['comment'] != null
              ? Map<String, dynamic>.from(
                json['comment'] as Map<String, dynamic>,
              )
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'organizationId': organizationId,
      'parentId': parentId,
      'date': date?.toIso8601String(), // serialize as ISO
      'status': status,
      'comment': comment,
    };
  }

  StatusEvent copyWith({
    String? organizationId,
    String? parentId,
    DateTime? date,
    String? status,
    Map<String, dynamic>? comment,
  }) {
    return StatusEvent(
      organizationId: organizationId ?? this.organizationId,
      parentId: parentId ?? this.parentId,
      date: date ?? this.date,
      status: status ?? this.status,
      comment: comment ?? this.comment,
    );
  }
}

enum StatusIdEnum {
  created('created', 'Создан'),
  sent('sent', 'Отправлен'),
  in_processing('in_processing ', 'В обработке'),
  sent_for_approval('sent_for_approval', 'На согласовании'),
  rejected('rejected', 'Отклонена'),
  approved('approved', 'Согласована'),
  approved_with_comments('approved_with_comments', 'Согласована с замечаниями'),
  completed('completed', 'Завершена'),
  needRegister('needRegister', 'Регистрируем'),
  unknown('', '');

  final String value;
  final String title;
  const StatusIdEnum(this.value, this.title);

  static StatusIdEnum fromValue(String value) =>
      StatusIdEnum.values.firstWhere(
        (e) => e.value.trim() == value.trim(),
        orElse: () => StatusIdEnum.unknown,
      );
}
