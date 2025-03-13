// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RequestType {
final String? id;
final String? title;
  RequestType({
    this.id,
    this.title,
  });

  RequestType copyWith({
    String? id,
    String? title,
  }) {
    return RequestType(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
    };
  }

  factory RequestType.fromMap(Map<String, dynamic> map) {
    return RequestType(
      id: map['id'] != null ? map['id'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestType.fromJson(String source) => RequestType.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'RequestType(id: $id, title: $title)';

  @override
  bool operator ==(covariant RequestType other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.title == title;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode;
}
