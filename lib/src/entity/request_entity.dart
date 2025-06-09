// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../model/status_event/status_event.dart';
import 'request_type.dart';

class RequestEntity {
  final String? date;
      final StatusEvent? lastStatusEvent;
      final String? number;
      final RequestType? requestType;
      final String? id;
      final String? title;
  RequestEntity({
    this.date,
    this.lastStatusEvent,
    this.number,
    this.requestType,
    this.id,
    this.title,
  });

  RequestEntity copyWith({
    String? date,
    StatusEvent? lastStatusEvent,
    String? number,
    RequestType? requestType,
    String? id,
    String? title,
  }) {
    return RequestEntity(
      date: date ?? this.date,
      lastStatusEvent: lastStatusEvent ?? this.lastStatusEvent,
      number: number ?? this.number,
      requestType: requestType ?? this.requestType,
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'lastStatusEvent': lastStatusEvent?.toJson(),
      'number': number,
      'requestType': requestType?.toMap(),
      'id': id,
      'title': title,
    };
  }

  factory RequestEntity.fromMap(Map<String, dynamic> map) {
    return RequestEntity(
      date: map['date'] != null ? map['date'] as String : null,
      lastStatusEvent: map['lastStatusEvent'] != null ? StatusEvent.fromJson(map['lastStatusEvent'] as Map<String,dynamic>) : null,
      number: map['number'] != null ? map['number'] as String : null,
      requestType: map['requestType'] != null ? RequestType.fromMap(map['requestType'] as Map<String,dynamic>) : null,
      id: map['id'] != null ? map['id'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestEntity.fromJson(String source) => RequestEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RequestEntity(date: $date, lastStatusEvent: $lastStatusEvent, number: $number, requestType: $requestType, id: $id, title: $title)';
  }

  @override
  bool operator ==(covariant RequestEntity other) {
    if (identical(this, other)) return true;
  
    return 
      other.date == date &&
      other.lastStatusEvent == lastStatusEvent &&
      other.number == number &&
      other.requestType == requestType &&
      other.id == id &&
      other.title == title;
  }

  @override
  int get hashCode {
    return date.hashCode ^
      lastStatusEvent.hashCode ^
      number.hashCode ^
      requestType.hashCode ^
      id.hashCode ^
      title.hashCode;
  }
}
