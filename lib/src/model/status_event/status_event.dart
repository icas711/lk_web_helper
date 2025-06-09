import 'package:freezed_annotation/freezed_annotation.dart';


@freezed
class StatusEvents {
  final List<StatusEvent> statusEvents;

  StatusEvents({required this.statusEvents});

  factory StatusEvents.fromJson(Map<String, dynamic> json) {
    return StatusEvents(
      statusEvents: (json['items'] as List<dynamic>)
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
    return {
      'items': statusEvents.map((e) => e.toJson()).toList(),
    };
  }
}

class StatusEvent {
  final String? organizationId;
  final String? parentId;
  final DateTime? date;
  final String? status;

  StatusEvent({this.organizationId, this.parentId, this.date, this.status});

  factory StatusEvent.fromJson(Map<String, dynamic> json) {
    return StatusEvent(
      organizationId: json['organizationId'] as String?,
      parentId: json['parentId'] as String?,
      date: json['date'] != null ? DateTime.parse(json['date']) : null,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'organizationId': organizationId,
      'parentId': parentId,
      'date': date?.toIso8601String(), // serialize as ISO
      'status': status,
    };
  }
}

enum StatusIdEnum {
  created('46ded70e-cde9-42d2-9f51-6f102fd911b0', 'Создан'),
  outgoing('5fa9ed2b-5fab-4b41-b2fd-bbeb738c2f26', 'Отправлен'),
  forSignature('for-signature', 'На подпись'),
  waitingForSignatory('waiting-for-signatory', 'Ждем подписанта'),
  signed('signed', 'Подписан'),
  closed('closed', 'Завершен'),
  incoming('incoming', 'Входящий'),
  unknown('', '');

  final String value;
  final String title;
  const StatusIdEnum(this.value, this.title);
}
