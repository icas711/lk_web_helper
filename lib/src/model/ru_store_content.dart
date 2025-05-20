import 'ru_store_application.dart';


class RuStoreContent {
  final List<RuStoreApplication> content;
  final int pageNumber;
   final int pageSize;
    final int totalElements;
     final int totalPages;
  RuStoreContent({
    required this.content,
    required this.pageNumber,
    required this.pageSize,
    required this.totalElements,
    required this.totalPages,
  });

factory RuStoreContent.fromJson(Map<String, dynamic> json) {
    return RuStoreContent(
      content: (json['content'] as List)
          .map((item) => RuStoreApplication.fromJson(item))
          .toList(),
      pageNumber: json['pageNumber'],
      pageSize: json['pageSize'],
      totalElements: json['totalElements'],
      totalPages: json['totalPages'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'content': content.map((app) => app.toJson()).toList(),
      'pageNumber': pageNumber,
      'pageSize': pageSize,
      'totalElements': totalElements,
      'totalPages': totalPages,
    };
  }
}
