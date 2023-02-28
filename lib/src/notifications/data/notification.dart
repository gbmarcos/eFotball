import 'package:equatable/equatable.dart';
import 'package:fifa/src/common/data/converters.dart';
import 'package:fifa/src/common/domain/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.g.dart';

@JsonSerializable()
class Notification extends Equatable {
  final int id;
  final NotificationType type;
  final UserBasicInfo? fromUser;
  final dynamic data;
  final bool seen;
  @TimestampConverter()
  final DateTime inserted;

  const Notification(
      {required this.id,
      required this.type,
      this.fromUser,
      required this.data,
      required this.seen,
      @TimestampConverter() required this.inserted});

  factory Notification.fromJson(Map<String, dynamic> json) => _$NotificationFromJson(json);

  @override
  String toString() {
    return 'Notification{id: $id, type: $type, fromUser: $fromUser, data: $data, seen: $seen, inserted: $inserted}';
  }

  @override
  List<Object?> get props => [id, inserted, type, seen];
}

/// Notification received from the `lobby-XX` channel and `check-in` notification
@JsonSerializable()
class CheckInNotificationEvent {
  final int userId;
  final int? matchId;
  @TimestampConverter()
  final DateTime checkInTime;

  CheckInNotificationEvent({required this.userId, this.matchId, @TimestampConverter() required this.checkInTime});

  factory CheckInNotificationEvent.fromJson(Map<String, dynamic> json) => _$CheckInNotificationEventFromJson(json);

  @override
  String toString() {
    return 'CheckInNotificationEvent{userId: $userId, matchId: $matchId, checkInTime: $checkInTime}';
  }
}

enum NotificationType {
  @JsonValue(0)
  friendRequestAccepted,
  @JsonValue(1)
  tournamentJoinRequestAccepted,
  @JsonValue(2)
  tournamentJoinRequestDeclined,
  @JsonValue(3)
  tournamentLobbyCreated,
  @JsonValue(4)
  friendStartedStreaming,
  @JsonValue(5)
  tournamentMatchScoresSubmitted,
  @JsonValue(6)
  orgJoinRequestAccepted,
  @JsonValue(7)
  orgJoinRequestDenied,
  @JsonValue(8)
  tournamentMatchConflict
}
