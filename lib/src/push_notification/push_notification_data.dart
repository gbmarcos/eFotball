import 'package:fifa/src/common/data/converters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'push_notification_data.g.dart';

abstract class PushNotificationModel {}

@JsonSerializable()
class MatchStarting extends PushNotificationModel {
  final String id;
  final String event;
  @TimestampConverter()
  final DateTime walkoverTime;
  final String userId;
  final String userAvatar;
  final String tournamentId;
  final String tournamentName;
  final String? tournamentLogo;

  MatchStarting({
    required this.id,
    required this.event,
    @TimestampConverter() required this.walkoverTime,
    required this.userId,
    required this.userAvatar,
    required this.tournamentId,
    required this.tournamentName,
    this.tournamentLogo,
  });

  factory MatchStarting.fromJson(Map<String, dynamic> json) => _$MatchStartingFromJson(json);
}
