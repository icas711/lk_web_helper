// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ApplicationEntities {
  final List<ApplicationEntity> applications;
  const ApplicationEntities({required this.applications});

  factory ApplicationEntities.fromList(List list) => ApplicationEntities(
    applications: list.map((e) => ApplicationEntity.fromMap(e)).toList(),
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'applications': applications.map((x) => x.toMap()).toList(),
    };
  }

  factory ApplicationEntities.fromMap(Map<String, dynamic> map) {
    return ApplicationEntities(
      applications: List<ApplicationEntity>.from(
        (map['applications'] as List<int>).map<ApplicationEntity>(
          (x) => ApplicationEntity.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ApplicationEntities.fromJson(String source) =>
      ApplicationEntities.fromMap(json.decode(source) as Map<String, dynamic>);
}

class ApplicationEntity {
  final String organizationId;
  final String? parentId;
  final String id;
  final String title;
  final String userId;
  final String? templateId;
  final String? date;
  ApplicationEntity({
    required this.organizationId,
    this.parentId,
    required this.id,
    required this.title,
    required this.userId,
    this.templateId,
    this.date,
  });

  ApplicationEntity copyWith({
    String? organizationId,
    String? parentId,
    String? id,
    String? title,
    String? userId,
    String? templateId,
    String? date,
  }) {
    return ApplicationEntity(
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

  factory ApplicationEntity.fromMap(Map<String, dynamic> map) {
    return ApplicationEntity(
      organizationId: map['organizationId'] as String,
      parentId: map['parentId'] != null ? map['parentId'] as String : null,
      id: map['id'] as String,
      title: map['title'] as String,
      userId: map['userId'] as String,
      templateId: map['templateId'] != null ? map['templateId'] as String : null,
      date: map['date'] != null ? map['date'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ApplicationEntity.fromJson(String source) => ApplicationEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ApplicationEntity(organizationId: $organizationId, parentId: $parentId, id: $id, title: $title, userId: $userId, templateId: $templateId, date: $date)';
  }

  @override
  bool operator ==(covariant ApplicationEntity other) {
    if (identical(this, other)) return true;
  
    return 
      other.organizationId == organizationId &&
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
