import 'package:freezed_annotation/freezed_annotation.dart';

part 'template_model.freezed.dart';
part 'template_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class Templates with _$Templates {
  const factory Templates({
    required List<TemplateModel>? templates,
  }) = _Templates;

  factory Templates.fromList(List list) {
    return Templates(
      templates: list
          .map((e) => TemplateModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  factory Templates.fromJson(Map<String, dynamic> json) => _$TemplatesFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class TemplateModel with _$TemplateModel {
  const factory TemplateModel({
    required String id,
    required String title,
    required String? externalId,
    required String? link,
  }) = _TemplateModel;

  factory TemplateModel.fromJson(Map<String, dynamic> json) => _$TemplateModelFromJson(json);

  factory TemplateModel.init(){
    return const TemplateModel(
      id: '',
      title: '',
      externalId: '',
      link: '',
    );
  }
}