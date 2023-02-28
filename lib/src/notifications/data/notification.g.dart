// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notification _$NotificationFromJson(Map<String, dynamic> json) => Notification(
      id: json['id'] as int,
      type: $enumDecode(_$NotificationTypeEnumMap, json['type']),
      fromUser: json['from_user'] == null
          ? null
          : UserBasicInfo.fromJson(json['from_user'] as Map<String, dynamic>),
      data: json['data'],
      seen: json['seen'] as bool,
      inserted: const TimestampConverter().fromJson(json['inserted'] as int),
    );

Map<String, dynamic> _$NotificationToJson(Notification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$NotificationTypeEnumMap[instance.type],
      'from_user': instance.fromUser,
      'data': instance.data,
      'seen': instance.seen,
      'inserted': const TimestampConverter().toJson(instance.inserted),
    };

const _$NotificationTypeEnumMap = {
  NotificationType.friendRequestAccepted: 0,
  NotificationType.tournamentJoinRequestAccepted: 1,
  NotificationType.tournamentJoinRequestDeclined: 2,
  NotificationType.tournamentLobbyCreated: 3,
  NotificationType.friendStartedStreaming: 4,
  NotificationType.tournamentMatchScoresSubmitted: 5,
  NotificationType.orgJoinRequestAccepted: 6,
  NotificationType.orgJoinRequestDenied: 7,
  NotificationType.tournamentMatchConflict: 8,
};

CheckInNotificationEvent _$CheckInNotificationEventFromJson(
        Map<String, dynamic> json) =>
    CheckInNotificationEvent(
      userId: json['user_id'] as int,
      matchId: json['match_id'] as int?,
      checkInTime:
          const TimestampConverter().fromJson(json['check_in_time'] as int),
    );

Map<String, dynamic> _$CheckInNotificationEventToJson(
        CheckInNotificationEvent instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'match_id': instance.matchId,
      'check_in_time': const TimestampConverter().toJson(instance.checkInTime),
    };
