import 'dart:convert';

class EmployeeEntity {
  final String organizationId;
  final String? parentId;
  final String id;
  final String title;
  final String userId;
  final String number;
  EmployeeEntity({
    required this.organizationId,
    this.parentId,
    required this.id,
    required this.title,
    required this.userId,
    required this.number,
  });

factory EmployeeEntity.anonimus()=>EmployeeEntity(organizationId: '', id: '-1', title: 'Аноним', userId: '-1', number: '-1');
  EmployeeEntity copyWith({
    String? organizationId,
    String? parentId,
    String? id,
    String? title,
    String? userId,
    String? number,
  }) {
    return EmployeeEntity(
      organizationId: organizationId ?? this.organizationId,
      parentId: parentId ?? this.parentId,
      id: id ?? this.id,
      title: title ?? this.title,
      userId: userId ?? this.userId,
      number: number ?? this.number,
    );
  }


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'organizationId': organizationId,
      'parentId': parentId,
      'id': id,
      'title': title,
      'userId': userId,
      'number': number,
    };
  }

  factory EmployeeEntity.fromMap(Map<String, dynamic> map) {
    return EmployeeEntity(
      organizationId: map['organizationId'] as String,
      parentId: map['parentId'] != null ? map['parentId'] as String : null,
      id: map['id'] as String,
      title: map['title'] as String,
      userId: map['userId'] as String,
      number: map['number'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory EmployeeEntity.fromJson(String source) =>
      EmployeeEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'EmployeeEntity(organizationId: $organizationId, parentId: $parentId, id: $id, title: $title, userId: $userId, number: $number)';
  }

  @override
  bool operator ==(covariant EmployeeEntity other) {
    if (identical(this, other)) return true;
    return other.id == id;
  }

  @override
  int get hashCode {
    return organizationId.hashCode ^
        parentId.hashCode ^
        id.hashCode ^
        title.hashCode ^
        userId.hashCode ^
        number.hashCode;
  }
}
