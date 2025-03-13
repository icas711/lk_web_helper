// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'status_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StatusEvents _$StatusEventsFromJson(Map<String, dynamic> json) {
  return _StatusEvents.fromJson(json);
}

/// @nodoc
mixin _$StatusEvents {
  List<StatusEvent>? get statusEvents => throw _privateConstructorUsedError;

  /// Serializes this StatusEvents to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StatusEvents
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StatusEventsCopyWith<StatusEvents> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusEventsCopyWith<$Res> {
  factory $StatusEventsCopyWith(
          StatusEvents value, $Res Function(StatusEvents) then) =
      _$StatusEventsCopyWithImpl<$Res, StatusEvents>;
  @useResult
  $Res call({List<StatusEvent>? statusEvents});
}

/// @nodoc
class _$StatusEventsCopyWithImpl<$Res, $Val extends StatusEvents>
    implements $StatusEventsCopyWith<$Res> {
  _$StatusEventsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StatusEvents
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusEvents = freezed,
  }) {
    return _then(_value.copyWith(
      statusEvents: freezed == statusEvents
          ? _value.statusEvents
          : statusEvents // ignore: cast_nullable_to_non_nullable
              as List<StatusEvent>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatusEventsImplCopyWith<$Res>
    implements $StatusEventsCopyWith<$Res> {
  factory _$$StatusEventsImplCopyWith(
          _$StatusEventsImpl value, $Res Function(_$StatusEventsImpl) then) =
      __$$StatusEventsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<StatusEvent>? statusEvents});
}

/// @nodoc
class __$$StatusEventsImplCopyWithImpl<$Res>
    extends _$StatusEventsCopyWithImpl<$Res, _$StatusEventsImpl>
    implements _$$StatusEventsImplCopyWith<$Res> {
  __$$StatusEventsImplCopyWithImpl(
      _$StatusEventsImpl _value, $Res Function(_$StatusEventsImpl) _then)
      : super(_value, _then);

  /// Create a copy of StatusEvents
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusEvents = freezed,
  }) {
    return _then(_$StatusEventsImpl(
      statusEvents: freezed == statusEvents
          ? _value._statusEvents
          : statusEvents // ignore: cast_nullable_to_non_nullable
              as List<StatusEvent>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StatusEventsImpl implements _StatusEvents {
  const _$StatusEventsImpl({final List<StatusEvent>? statusEvents})
      : _statusEvents = statusEvents;

  factory _$StatusEventsImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatusEventsImplFromJson(json);

  final List<StatusEvent>? _statusEvents;
  @override
  List<StatusEvent>? get statusEvents {
    final value = _statusEvents;
    if (value == null) return null;
    if (_statusEvents is EqualUnmodifiableListView) return _statusEvents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'StatusEvents(statusEvents: $statusEvents)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatusEventsImpl &&
            const DeepCollectionEquality()
                .equals(other._statusEvents, _statusEvents));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_statusEvents));

  /// Create a copy of StatusEvents
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatusEventsImplCopyWith<_$StatusEventsImpl> get copyWith =>
      __$$StatusEventsImplCopyWithImpl<_$StatusEventsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatusEventsImplToJson(
      this,
    );
  }
}

abstract class _StatusEvents implements StatusEvents {
  const factory _StatusEvents({final List<StatusEvent>? statusEvents}) =
      _$StatusEventsImpl;

  factory _StatusEvents.fromJson(Map<String, dynamic> json) =
      _$StatusEventsImpl.fromJson;

  @override
  List<StatusEvent>? get statusEvents;

  /// Create a copy of StatusEvents
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatusEventsImplCopyWith<_$StatusEventsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
