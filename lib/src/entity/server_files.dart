import 'package:freezed_annotation/freezed_annotation.dart';
import 'date_time_converter.dart';
part 'server_files.freezed.dart';

part 'server_files.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class ServerFiles with _$ServerFiles {
  const factory ServerFiles({
    required List<ServerFile>? serverFiles,
  }) = _ServerFiles;

  factory ServerFiles.fromList(List list) {
    return ServerFiles(
      serverFiles: list
          .map((e) => ServerFile.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  factory ServerFiles.fromJson(Map<String, dynamic> json) =>
      _$ServerFilesFromJson(json);
}

@freezed
class ServerFile with _$ServerFile {
  factory ServerFile({
    required String id,
    required String? filename,
    @DateTimeConverter() required DateTime? date,
    required String? contentType,
    required int? size,
    required int? checksum,
  }) = _ServerFile;

  factory ServerFile.fromJson(Map<String, dynamic> json) =>
      _$ServerFileFromJson(json);

  factory ServerFile.init() {
    return ServerFile(
      id: '',
      filename: '',
      date: DateTime.now(),
      contentType: null,
      size: 0,
      checksum: 0,
    );
  }
}
