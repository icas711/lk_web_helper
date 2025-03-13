// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'status_event.freezed.dart';
part 'status_event.g.dart';

@freezed
class StatusEvents with _$StatusEvents {
  const factory StatusEvents({List<StatusEvent>? statusEvents}) = _StatusEvents;

  factory StatusEvents.fromList(List list) {
    return StatusEvents(
      statusEvents: list.map((e) => StatusEvent.fromMap(e)).toList(),
    );
  }

  factory StatusEvents.fromJson(Map<String, dynamic> json) =>
      _$StatusEventsFromJson(json);
}

class StatusEvent {
  final String? statusId;
  final String? title;
  final dynamic comment;
  final String? eventDate;
  final String? creatorId;
  final String? creatorTitle;
  StatusEvent({
    this.statusId,
    this.title,
    required this.comment,
    this.eventDate,
    this.creatorId,
    this.creatorTitle,
  });

  StatusEvent copyWith({
    String? statusId,
    String? title,
    dynamic comment,
    String? eventDate,
    String? creatorId,
    String? creatorTitle,
  }) {
    return StatusEvent(
      statusId: statusId ?? this.statusId,
      title: title ?? this.title,
      comment: comment ?? this.comment,
      eventDate: eventDate ?? this.eventDate,
      creatorId: creatorId ?? this.creatorId,
      creatorTitle: creatorTitle ?? this.creatorTitle,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'statusId': statusId,
      'title': title,
      'comment': comment,
      'eventDate': eventDate,
      'creatorId': creatorId,
      'creatorTitle': creatorTitle,
    };
  }

  factory StatusEvent.fromMap(Map<String, dynamic> map) {
    return StatusEvent(
      statusId: map['statusId'] != null ? map['statusId'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      comment: map['comment'] as dynamic,
      eventDate: map['eventDate'] != null ? map['eventDate'] as String : null,
      creatorId: map['creatorId'] != null ? map['creatorId'] as String : null,
      creatorTitle: map['creatorTitle'] != null ? map['creatorTitle'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory StatusEvent.fromJson(String source) => StatusEvent.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StatusEvent(statusId: $statusId, title: $title, comment: $comment, eventDate: $eventDate, creatorId: $creatorId, creatorTitle: $creatorTitle)';
  }

  @override
  bool operator ==(covariant StatusEvent other) {
    if (identical(this, other)) return true;
  
    return 
      other.statusId == statusId &&
      other.title == title &&
      other.comment == comment &&
      other.eventDate == eventDate &&
      other.creatorId == creatorId &&
      other.creatorTitle == creatorTitle;
  }

  @override
  int get hashCode {
    return statusId.hashCode ^
      title.hashCode ^
      comment.hashCode ^
      eventDate.hashCode ^
      creatorId.hashCode ^
      creatorTitle.hashCode;
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
