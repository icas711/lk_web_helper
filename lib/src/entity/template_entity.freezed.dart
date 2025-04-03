// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'template_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TemplateEntity _$TemplateEntityFromJson(Map<String, dynamic> json) {
  return _TemplateEntity.fromJson(json);
}

/// @nodoc
mixin _$TemplateEntity {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get screen => throw _privateConstructorUsedError;
  String? get externalId => throw _privateConstructorUsedError;
  String? get link => throw _privateConstructorUsedError;

  /// Serializes this TemplateEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TemplateEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TemplateEntityCopyWith<TemplateEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TemplateEntityCopyWith<$Res> {
  factory $TemplateEntityCopyWith(
          TemplateEntity value, $Res Function(TemplateEntity) then) =
      _$TemplateEntityCopyWithImpl<$Res, TemplateEntity>;
  @useResult
  $Res call(
      {String id,
      String title,
      String screen,
      String? externalId,
      String? link});
}

/// @nodoc
class _$TemplateEntityCopyWithImpl<$Res, $Val extends TemplateEntity>
    implements $TemplateEntityCopyWith<$Res> {
  _$TemplateEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TemplateEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? screen = null,
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
      screen: null == screen
          ? _value.screen
          : screen // ignore: cast_nullable_to_non_nullable
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
abstract class _$$TemplateEntityImplCopyWith<$Res>
    implements $TemplateEntityCopyWith<$Res> {
  factory _$$TemplateEntityImplCopyWith(_$TemplateEntityImpl value,
          $Res Function(_$TemplateEntityImpl) then) =
      __$$TemplateEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String screen,
      String? externalId,
      String? link});
}

/// @nodoc
class __$$TemplateEntityImplCopyWithImpl<$Res>
    extends _$TemplateEntityCopyWithImpl<$Res, _$TemplateEntityImpl>
    implements _$$TemplateEntityImplCopyWith<$Res> {
  __$$TemplateEntityImplCopyWithImpl(
      _$TemplateEntityImpl _value, $Res Function(_$TemplateEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of TemplateEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? screen = null,
    Object? externalId = freezed,
    Object? link = freezed,
  }) {
    return _then(_$TemplateEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      screen: null == screen
          ? _value.screen
          : screen // ignore: cast_nullable_to_non_nullable
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
class _$TemplateEntityImpl implements _TemplateEntity {
  const _$TemplateEntityImpl(
      {required this.id,
      required this.title,
      required this.screen,
      required this.externalId,
      required this.link});

  factory _$TemplateEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$TemplateEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String screen;
  @override
  final String? externalId;
  @override
  final String? link;

  @override
  String toString() {
    return 'TemplateEntity(id: $id, title: $title, screen: $screen, externalId: $externalId, link: $link)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TemplateEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.screen, screen) || other.screen == screen) &&
            (identical(other.externalId, externalId) ||
                other.externalId == externalId) &&
            (identical(other.link, link) || other.link == link));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, screen, externalId, link);

  /// Create a copy of TemplateEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TemplateEntityImplCopyWith<_$TemplateEntityImpl> get copyWith =>
      __$$TemplateEntityImplCopyWithImpl<_$TemplateEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TemplateEntityImplToJson(
      this,
    );
  }
}

abstract class _TemplateEntity implements TemplateEntity {
  const factory _TemplateEntity(
      {required final String id,
      required final String title,
      required final String screen,
      required final String? externalId,
      required final String? link}) = _$TemplateEntityImpl;

  factory _TemplateEntity.fromJson(Map<String, dynamic> json) =
      _$TemplateEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get screen;
  @override
  String? get externalId;
  @override
  String? get link;

  /// Create a copy of TemplateEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TemplateEntityImplCopyWith<_$TemplateEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
