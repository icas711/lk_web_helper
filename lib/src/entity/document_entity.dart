// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import '../model/status_event/status_event.dart';

class DocumentEntities {
  final List<DocumentEntity> documents;
  const DocumentEntities({required this.documents});

  factory DocumentEntities.fromList(List list) => DocumentEntities(
    documents: list.map((e) => DocumentEntity.fromMap(e)).toList(),
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'documents': documents.map((x) => x.toMap()).toList(),
    };
  }

  factory DocumentEntities.fromMap(Map<String, dynamic> map) {
    return DocumentEntities(
      documents: List<DocumentEntity>.from(
        (map['documents'] as List<int>).map<DocumentEntity>(
          (x) => DocumentEntity.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory DocumentEntities.fromJson(String source) =>
      DocumentEntities.fromMap(json.decode(source) as Map<String, dynamic>);
}

class DocumentEntity {
  final String organizationId;
  final String? parentId;
  final String id;
  final String title;
  final String userId;
  final String? templateId;
  final String? type;
  final String? date;
  final List<StatusEvent> events;
  bool _isRead = false;
  bool get getRead => _isRead;
  void setRead(bool value) {
    _isRead = value;
  }

  /// Возвращает дату создания или изменения документа в формате "dd.MM.yyyy HH:mm"
  /// Если событий нет, возвращает дату из поля date
  /// Если дата не указана, возвращает "неизвестно"
  String get lastEvent {
    try {
      if (events.isEmpty && date == null) return '';
      if (events.isEmpty && date != null) {
        final editDate = DateTime.tryParse(date!);
        if (editDate == null) return '';
        return 'Создано: ${_formatRu.format(editDate)}';
      }

      // Найти последнее событие с нужным статусом, иначе взять последнее событие, иначе null
      final StatusEvent? event =
          events.isNotEmpty
              ? events.lastWhere(
                (event) =>
                    event.status == 'created' || event.status == 'updated',
                orElse: () => events.last,
              )
              : null;

      final status = (event?.status == 'updated') ? 'Изменено: ' : 'Создано: ';
      if (event == null || event.date == null) return '$statusнеизвестно';
      return '$status${_formatRu.format(event.date!)}';
    } catch (e) {
      return '';
    }
  }

  final DateFormat _formatRu = DateFormat('dd.MM.yyyy', 'ru');
  DocumentEntity({
    required this.organizationId,
    this.parentId,
    required this.id,
    required this.title,
    required this.userId,
    this.templateId,
    this.type,
    this.date,
    this.events = const [],
    bool? isRead,
  }) : _isRead = isRead ?? false;

  DocumentEntity copyWith({
    String? organizationId,
    String? parentId,
    String? id,
    String? title,
    String? userId,
    String? templateId,
    String? date,
    List<StatusEvent>? events,
    bool? isRead,
    String? type,
  }) {
    return DocumentEntity(
      organizationId: organizationId ?? this.organizationId,
      parentId: parentId ?? this.parentId,
      id: id ?? this.id,
      title: title ?? this.title,
      userId: userId ?? this.userId,
      templateId: templateId ?? this.templateId,
      date: date ?? this.date,
      events: events ?? this.events,
      isRead: isRead ?? _isRead,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'organizationId': organizationId,
      'parentId': parentId,
      'id': id,
      'title': title,
      'userId': userId,
      'templateId': templateId,
      'date': date,
      'events': events.map((x) => x.toJson()).toList(),
      'isRead': _isRead,
      'type': type,
    };
  }

  factory DocumentEntity.fromMap(Map<String, dynamic> map) {
    return DocumentEntity(
      organizationId: map['organizationId'] as String,
      parentId: map['parentId'] != null ? map['parentId'] as String : null,
      id: map['id'] as String,
      title: map['title'] as String,
      userId: map['userId'] as String,
      templateId:
          map['templateId'] != null ? map['templateId'] as String : null,
      date: map['date'] != null ? map['date'] as String : null,
      // events: StatusEvents.fromList(map['events']).statusEvents ?? [],
      events: [],
      isRead: map['isRead'] as bool? ?? false,
      type: map['type'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory DocumentEntity.fromJson(String source) =>
      DocumentEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DocumentEntity(organizationId: $organizationId, parentId: $parentId, id: $id, title: $title, userId: $userId, templateId: $templateId, date: $date, events: $events)';
  }

  @override
  bool operator ==(covariant DocumentEntity other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        listEquals(other.events, events) &&
        other._isRead == _isRead;
  }

  @override
  int get hashCode {
    return id.hashCode ^ events.hashCode ^ _isRead.hashCode;
  }
}
