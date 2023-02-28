// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_in.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckIn _$CheckInFromJson(Map<String, dynamic> json) => CheckIn(
      userId: json['user_id'] as int,
      checkInTime:
          const TimestampConverter().fromJson(json['check_in_time'] as int),
      matchId: json['match_id'] as int?,
    );

Map<String, dynamic> _$CheckInToJson(CheckIn instance) => <String, dynamic>{
      'user_id': instance.userId,
      'check_in_time': const TimestampConverter().toJson(instance.checkInTime),
      'match_id': instance.matchId,
    };
