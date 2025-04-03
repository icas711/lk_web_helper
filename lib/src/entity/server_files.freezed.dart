// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server_files.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ServerFiles _$ServerFilesFromJson(Map<String, dynamic> json) {
  return _ServerFiles.fromJson(json);
}

/// @nodoc
mixin _$ServerFiles {
  List<ServerFile>? get serverFiles => throw _privateConstructorUsedError;

  /// Serializes this ServerFiles to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ServerFiles
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServerFilesCopyWith<ServerFiles> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerFilesCopyWith<$Res> {
  factory $ServerFilesCopyWith(
          ServerFiles value, $Res Function(ServerFiles) then) =
      _$ServerFilesCopyWithImpl<$Res, ServerFiles>;
  @useResult
  $Res call({List<ServerFile>? serverFiles});
}

/// @nodoc
class _$ServerFilesCopyWithImpl<$Res, $Val extends ServerFiles>
    implements $ServerFilesCopyWith<$Res> {
  _$ServerFilesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServerFiles
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serverFiles = freezed,
  }) {
    return _then(_value.copyWith(
      serverFiles: freezed == serverFiles
          ? _value.serverFiles
          : serverFiles // ignore: cast_nullable_to_non_nullable
              as List<ServerFile>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServerFilesImplCopyWith<$Res>
    implements $ServerFilesCopyWith<$Res> {
  factory _$$ServerFilesImplCopyWith(
          _$ServerFilesImpl value, $Res Function(_$ServerFilesImpl) then) =
      __$$ServerFilesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ServerFile>? serverFiles});
}

/// @nodoc
class __$$ServerFilesImplCopyWithImpl<$Res>
    extends _$ServerFilesCopyWithImpl<$Res, _$ServerFilesImpl>
    implements _$$ServerFilesImplCopyWith<$Res> {
  __$$ServerFilesImplCopyWithImpl(
      _$ServerFilesImpl _value, $Res Function(_$ServerFilesImpl) _then)
      : super(_value, _then);

  /// Create a copy of ServerFiles
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serverFiles = freezed,
  }) {
    return _then(_$ServerFilesImpl(
      serverFiles: freezed == serverFiles
          ? _value.serverFiles
          : serverFiles // ignore: cast_nullable_to_non_nullable
              as List<ServerFile>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServerFilesImpl implements _ServerFiles {
  const _$ServerFilesImpl({required this.serverFiles});

  factory _$ServerFilesImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServerFilesImplFromJson(json);

  @override
  final List<ServerFile>? serverFiles;

  @override
  String toString() {
    return 'ServerFiles(serverFiles: $serverFiles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerFilesImpl &&
            const DeepCollectionEquality()
                .equals(other.serverFiles, serverFiles));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(serverFiles));

  /// Create a copy of ServerFiles
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerFilesImplCopyWith<_$ServerFilesImpl> get copyWith =>
      __$$ServerFilesImplCopyWithImpl<_$ServerFilesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServerFilesImplToJson(
      this,
    );
  }
}

abstract class _ServerFiles implements ServerFiles {
  const factory _ServerFiles({required final List<ServerFile>? serverFiles}) =
      _$ServerFilesImpl;

  factory _ServerFiles.fromJson(Map<String, dynamic> json) =
      _$ServerFilesImpl.fromJson;

  @override
  List<ServerFile>? get serverFiles;

  /// Create a copy of ServerFiles
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServerFilesImplCopyWith<_$ServerFilesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ServerFile _$ServerFileFromJson(Map<String, dynamic> json) {
  return _ServerFile.fromJson(json);
}

/// @nodoc
mixin _$ServerFile {
  String get id => throw _privateConstructorUsedError;
  String? get filename => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get date => throw _privateConstructorUsedError;
  String? get contentType => throw _privateConstructorUsedError;
  int? get size => throw _privateConstructorUsedError;
  int? get checksum => throw _privateConstructorUsedError;

  /// Serializes this ServerFile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ServerFile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServerFileCopyWith<ServerFile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerFileCopyWith<$Res> {
  factory $ServerFileCopyWith(
          ServerFile value, $Res Function(ServerFile) then) =
      _$ServerFileCopyWithImpl<$Res, ServerFile>;
  @useResult
  $Res call(
      {String id,
      String? filename,
      @DateTimeConverter() DateTime? date,
      String? contentType,
      int? size,
      int? checksum});
}

/// @nodoc
class _$ServerFileCopyWithImpl<$Res, $Val extends ServerFile>
    implements $ServerFileCopyWith<$Res> {
  _$ServerFileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServerFile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? filename = freezed,
    Object? date = freezed,
    Object? contentType = freezed,
    Object? size = freezed,
    Object? checksum = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      filename: freezed == filename
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      contentType: freezed == contentType
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      checksum: freezed == checksum
          ? _value.checksum
          : checksum // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServerFileImplCopyWith<$Res>
    implements $ServerFileCopyWith<$Res> {
  factory _$$ServerFileImplCopyWith(
          _$ServerFileImpl value, $Res Function(_$ServerFileImpl) then) =
      __$$ServerFileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? filename,
      @DateTimeConverter() DateTime? date,
      String? contentType,
      int? size,
      int? checksum});
}

/// @nodoc
class __$$ServerFileImplCopyWithImpl<$Res>
    extends _$ServerFileCopyWithImpl<$Res, _$ServerFileImpl>
    implements _$$ServerFileImplCopyWith<$Res> {
  __$$ServerFileImplCopyWithImpl(
      _$ServerFileImpl _value, $Res Function(_$ServerFileImpl) _then)
      : super(_value, _then);

  /// Create a copy of ServerFile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? filename = freezed,
    Object? date = freezed,
    Object? contentType = freezed,
    Object? size = freezed,
    Object? checksum = freezed,
  }) {
    return _then(_$ServerFileImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      filename: freezed == filename
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      contentType: freezed == contentType
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      checksum: freezed == checksum
          ? _value.checksum
          : checksum // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServerFileImpl implements _ServerFile {
  _$ServerFileImpl(
      {required this.id,
      required this.filename,
      @DateTimeConverter() required this.date,
      required this.contentType,
      required this.size,
      required this.checksum});

  factory _$ServerFileImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServerFileImplFromJson(json);

  @override
  final String id;
  @override
  final String? filename;
  @override
  @DateTimeConverter()
  final DateTime? date;
  @override
  final String? contentType;
  @override
  final int? size;
  @override
  final int? checksum;

  @override
  String toString() {
    return 'ServerFile(id: $id, filename: $filename, date: $date, contentType: $contentType, size: $size, checksum: $checksum)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerFileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.filename, filename) ||
                other.filename == filename) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.contentType, contentType) ||
                other.contentType == contentType) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.checksum, checksum) ||
                other.checksum == checksum));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, filename, date, contentType, size, checksum);

  /// Create a copy of ServerFile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerFileImplCopyWith<_$ServerFileImpl> get copyWith =>
      __$$ServerFileImplCopyWithImpl<_$ServerFileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServerFileImplToJson(
      this,
    );
  }
}

abstract class _ServerFile implements ServerFile {
  factory _ServerFile(
      {required final String id,
      required final String? filename,
      @DateTimeConverter() required final DateTime? date,
      required final String? contentType,
      required final int? size,
      required final int? checksum}) = _$ServerFileImpl;

  factory _ServerFile.fromJson(Map<String, dynamic> json) =
      _$ServerFileImpl.fromJson;

  @override
  String get id;
  @override
  String? get filename;
  @override
  @DateTimeConverter()
  DateTime? get date;
  @override
  String? get contentType;
  @override
  int? get size;
  @override
  int? get checksum;

  /// Create a copy of ServerFile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServerFileImplCopyWith<_$ServerFileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
