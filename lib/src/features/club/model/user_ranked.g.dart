// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_ranked.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserRanked _$$_UserRankedFromJson(Map<String, dynamic> json) =>
    _$_UserRanked(
      id: json['id'] as int?,
      username: json['username'] as String,
      avatar: json['avatar'] as String?,
      countryId: json['country_id'] as int?,
      console: $enumDecodeNullable(_$ConsoleEnumMap, json['console']),
      flags: json['flags'] as int,
      elo: json['elo'] as int?,
      rank: json['rank'] as int?,
    );

Map<String, dynamic> _$$_UserRankedToJson(_$_UserRanked instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'avatar': instance.avatar,
      'country_id': instance.countryId,
      'console': _$ConsoleEnumMap[instance.console],
      'flags': instance.flags,
      'elo': instance.elo,
      'rank': instance.rank,
    };

const _$ConsoleEnumMap = {
  Console.xbox: 0,
  Console.playstation: 1,
};
