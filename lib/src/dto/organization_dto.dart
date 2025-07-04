class OrganizationDto {
  final String id;
  final String organizationId;
  final String? parentId;  
  final String title;
  final String? site;
  const OrganizationDto({
    required this.id,
    required this.organizationId,
    this.parentId,
    required this.title,
    this.site,
  });
  factory OrganizationDto.fromJson(Map<String, dynamic> json) {
    return OrganizationDto(
      id: json['id'] as String,
      organizationId: json['organizationId'] as String,
      parentId: json['parentId'] as String?,
      title: json['title'] as String,
      site: json['site'] as String?,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'organizationId': organizationId,
      'parentId': parentId,
      'title': title,
      'site': site,
    };
  }
}