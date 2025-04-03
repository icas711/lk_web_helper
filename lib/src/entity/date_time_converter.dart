import 'package:freezed_annotation/freezed_annotation.dart';

class DateTimeConverter implements JsonConverter<DateTime, dynamic> {
  const DateTimeConverter();

  @override
  DateTime fromJson(dynamic json) {
    return DateTime.parse(json);
    /*if (json == null) return DateTime.now();
    if (json.length == 6) {
      return DateTime.utc(json[0] ?? 0, json[1] ?? 0, json[2] ?? 0,
              json[3] ?? 0, json[4] ?? 0, json[5] ?? 0)
          .toLocal();
    } else if (json.length == 5) {
      return DateTime.utc(json[0] ?? 0, json[1] ?? 0, json[2] ?? 0,
              json[3] ?? 0, json[4] ?? 0, 0)
          .toLocal();
    }else {
      return DateTime.utc(json[0] ?? 0, json[1] ?? 0, json[2] ?? 0,
              json[3] ?? 0, 0, 0)
          .toLocal();
    }*/
  }

  @override
  dynamic toJson(DateTime object) {
    return object.toIso8601String();
    /*final format = DateFormat('yyyy-MM-dd-HH-mm-ss').format(object.toUtc());
    final date = format.split('-').map(int.parse).toList();
    return date;*/
  }
}
