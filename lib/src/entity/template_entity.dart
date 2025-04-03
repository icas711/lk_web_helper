import 'package:freezed_annotation/freezed_annotation.dart';

part 'template_entity.freezed.dart';

part 'template_entity.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class TemplateEntity with _$TemplateEntity {
  const factory TemplateEntity({
    required String id,
    required String title,
    required String screen,
    required String? externalId,
    required String? link,
  }) = _TemplateEntity;

  factory TemplateEntity.fromJson(Map<String, dynamic> json) =>
      _$TemplateEntityFromJson(json);

  factory TemplateEntity.init() {
    return TemplateEntity(
      id: '',
      title: '',
      externalId: '',
      link: '',
      screen: '',
    );
  }
}
