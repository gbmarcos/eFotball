import 'package:freezed_annotation/freezed_annotation.dart';
// This file holds converters meant to be used with the `json_serializable` package

///Converts a Unix timestamp(int) into a native Dart [DateTime].
class TimestampConverter implements JsonConverter<DateTime, int> {
  const TimestampConverter();

  @override
  DateTime fromJson(int json) {
    return DateTime.fromMillisecondsSinceEpoch(json * 1000, isUtc: true).toLocal();
  }

  @override
  int toJson(DateTime object) {
    return object.toUtc().millisecondsSinceEpoch ~/ 1000;
  }
}

///Converts a nullable  Unix timestamp(int?) into a native Dart [DateTime]?.
class NullableTimestampConverter implements JsonConverter<DateTime?, int?> {
  const NullableTimestampConverter();

  @override
  DateTime? fromJson(int? json) {
    if (json != null) {
      return DateTime.fromMillisecondsSinceEpoch(json * 1000, isUtc: true).toLocal();
    }
  }

  @override
  int? toJson(DateTime? object) {
    if (object != null) {
      return object.toUtc().millisecondsSinceEpoch ~/ 1000;
    }
  }
}
