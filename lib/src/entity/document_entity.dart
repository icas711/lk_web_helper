// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

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
  final String? date;
  DocumentEntity({
    required this.organizationId,
    this.parentId,
    required this.id,
    required this.title,
    required this.userId,
    this.templateId,
    this.date,
  });

  DocumentEntity copyWith({
    String? organizationId,
    String? parentId,
    String? id,
    String? title,
    String? userId,
    String? templateId,
    String? date,
  }) {
    return DocumentEntity(
      organizationId: organizationId ?? this.organizationId,
      parentId: parentId ?? this.parentId,
      id: id ?? this.id,
      title: title ?? this.title,
      userId: userId ?? this.userId,
      templateId: templateId ?? this.templateId,
      date: date ?? this.date,
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
    );
  }

  String toJson() => json.encode(toMap());

  factory DocumentEntity.fromJson(String source) =>
      DocumentEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DocumentEntity(organizationId: $organizationId, parentId: $parentId, id: $id, title: $title, userId: $userId, templateId: $templateId, date: $date)';
  }

  @override
  bool operator ==(covariant DocumentEntity other) {
    if (identical(this, other)) return true;

    return other.organizationId == organizationId &&
        other.parentId == parentId &&
        other.id == id &&
        other.title == title &&
        other.userId == userId &&
        other.templateId == templateId &&
        other.date == date;
  }

  @override
  int get hashCode {
    return organizationId.hashCode ^
        parentId.hashCode ^
        id.hashCode ^
        title.hashCode ^
        userId.hashCode ^
        templateId.hashCode ^
        date.hashCode;
  }
}
