// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'template_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Templates _$TemplatesFromJson(Map<String, dynamic> json) {
  return _Templates.fromJson(json);
}

/// @nodoc
mixin _$Templates {
  List<TemplateModel>? get templates => throw _privateConstructorUsedError;

  /// Serializes this Templates to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Templates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TemplatesCopyWith<Templates> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TemplatesCopyWith<$Res> {
  factory $TemplatesCopyWith(Templates value, $Res Function(Templates) then) =
      _$TemplatesCopyWithImpl<$Res, Templates>;
  @useResult
  $Res call({List<TemplateModel>? templates});
}

/// @nodoc
class _$TemplatesCopyWithImpl<$Res, $Val extends Templates>
    implements $TemplatesCopyWith<$Res> {
  _$TemplatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Templates
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? templates = freezed,
  }) {
    return _then(_value.copyWith(
      templates: freezed == templates
          ? _value.templates
          : templates // ignore: cast_nullable_to_non_nullable
              as List<TemplateModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TemplatesImplCopyWith<$Res>
    implements $TemplatesCopyWith<$Res> {
  factory _$$TemplatesImplCopyWith(
          _$TemplatesImpl value, $Res Function(_$TemplatesImpl) then) =
      __$$TemplatesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TemplateModel>? templates});
}

/// @nodoc
class __$$TemplatesImplCopyWithImpl<$Res>
    extends _$TemplatesCopyWithImpl<$Res, _$TemplatesImpl>
    implements _$$TemplatesImplCopyWith<$Res> {
  __$$TemplatesImplCopyWithImpl(
      _$TemplatesImpl _value, $Res Function(_$TemplatesImpl) _then)
      : super(_value, _then);

  /// Create a copy of Templates
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? templates = freezed,
  }) {
    return _then(_$TemplatesImpl(
      templates: freezed == templates
          ? _value.templates
          : templates // ignore: cast_nullable_to_non_nullable
              as List<TemplateModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TemplatesImpl implements _Templates {
  const _$TemplatesImpl({required this.templates});

  factory _$TemplatesImpl.fromJson(Map<String, dynamic> json) =>
      _$$TemplatesImplFromJson(json);

  @override
  final List<TemplateModel>? templates;

  @override
  String toString() {
    return 'Templates(templates: $templates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TemplatesImpl &&
            const DeepCollectionEquality().equals(other.templates, templates));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(templates));

  /// Create a copy of Templates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TemplatesImplCopyWith<_$TemplatesImpl> get copyWith =>
      __$$TemplatesImplCopyWithImpl<_$TemplatesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TemplatesImplToJson(
      this,
    );
  }
}

abstract class _Templates implements Templates {
  const factory _Templates({required final List<TemplateModel>? templates}) =
      _$TemplatesImpl;

  factory _Templates.fromJson(Map<String, dynamic> json) =
      _$TemplatesImpl.fromJson;

  @override
  List<TemplateModel>? get templates;

  /// Create a copy of Templates
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TemplatesImplCopyWith<_$TemplatesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TemplateModel _$TemplateModelFromJson(Map<String, dynamic> json) {
  return _TemplateModel.fromJson(json);
}

/// @nodoc
mixin _$TemplateModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get externalId => throw _privateConstructorUsedError;
  String? get link => throw _privateConstructorUsedError;

  /// Serializes this TemplateModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TemplateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TemplateModelCopyWith<TemplateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TemplateModelCopyWith<$Res> {
  factory $TemplateModelCopyWith(
          TemplateModel value, $Res Function(TemplateModel) then) =
      _$TemplateModelCopyWithImpl<$Res, TemplateModel>;
  @useResult
  $Res call({String id, String title, String? externalId, String? link});
}

/// @nodoc
class _$TemplateModelCopyWithImpl<$Res, $Val extends TemplateModel>
    implements $TemplateModelCopyWith<$Res> {
  _$TemplateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TemplateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? externalId = freezed,
    Object? link = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      externalId: freezed == externalId
          ? _value.externalId
          : externalId // ignore: cast_nullable_to_non_nullable
              as String?,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TemplateModelImplCopyWith<$Res>
    implements $TemplateModelCopyWith<$Res> {
  factory _$$TemplateModelImplCopyWith(
          _$TemplateModelImpl value, $Res Function(_$TemplateModelImpl) then) =
      __$$TemplateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title, String? externalId, String? link});
}

/// @nodoc
class __$$TemplateModelImplCopyWithImpl<$Res>
    extends _$TemplateModelCopyWithImpl<$Res, _$TemplateModelImpl>
    implements _$$TemplateModelImplCopyWith<$Res> {
  __$$TemplateModelImplCopyWithImpl(
      _$TemplateModelImpl _value, $Res Function(_$TemplateModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TemplateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? externalId = freezed,
    Object? link = freezed,
  }) {
    return _then(_$TemplateModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      externalId: freezed == externalId
          ? _value.externalId
          : externalId // ignore: cast_nullable_to_non_nullable
              as String?,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TemplateModelImpl implements _TemplateModel {
  const _$TemplateModelImpl(
      {required this.id,
      required this.title,
      required this.externalId,
      required this.link});

  factory _$TemplateModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TemplateModelImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String? externalId;
  @override
  final String? link;

  @override
  String toString() {
    return 'TemplateModel(id: $id, title: $title, externalId: $externalId, link: $link)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TemplateModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.externalId, externalId) ||
                other.externalId == externalId) &&
            (identical(other.link, link) || other.link == link));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, externalId, link);

  /// Create a copy of TemplateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TemplateModelImplCopyWith<_$TemplateModelImpl> get copyWith =>
      __$$TemplateModelImplCopyWithImpl<_$TemplateModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TemplateModelImplToJson(
      this,
    );
  }
}

abstract class _TemplateModel implements TemplateModel {
  const factory _TemplateModel(
      {required final String id,
      required final String title,
      required final String? externalId,
      required final String? link}) = _$TemplateModelImpl;

  factory _TemplateModel.fromJson(Map<String, dynamic> json) =
      _$TemplateModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String? get externalId;
  @override
  String? get link;

  /// Create a copy of TemplateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TemplateModelImplCopyWith<_$TemplateModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
