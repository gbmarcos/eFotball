import 'package:fifa/src/common/data/converters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_in.g.dart';

@JsonSerializable()
class CheckIn {
  final int userId;
  @TimestampConverter()
  final DateTime checkInTime;
  final int? matchId;

  CheckIn({
    required this.userId,
    required this.checkInTime,
    this.matchId,
  });

  factory CheckIn.fromJson(Map<String, dynamic> json) => _$CheckInFromJson(json);
}
