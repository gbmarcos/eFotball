// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_notification_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchStarting _$MatchStartingFromJson(Map<String, dynamic> json) =>
    MatchStarting(
      id: json['id'] as String,
      event: json['event'] as String,
      walkoverTime:
          const TimestampConverter().fromJson(json['walkover_time'] as int),
      userId: json['user_id'] as String,
      userAvatar: json['user_avatar'] as String,
      tournamentId: json['tournament_id'] as String,
      tournamentName: json['tournament_name'] as String,
      tournamentLogo: json['tournament_logo'] as String?,
    );

Map<String, dynamic> _$MatchStartingToJson(MatchStarting instance) =>
    <String, dynamic>{
      'id': instance.id,
      'event': instance.event,
      'walkover_time': const TimestampConverter().toJson(instance.walkoverTime),
      'user_id': instance.userId,
      'user_avatar': instance.userAvatar,
      'tournament_id': instance.tournamentId,
      'tournament_name': instance.tournamentName,
      'tournament_logo': instance.tournamentLogo,
    };
