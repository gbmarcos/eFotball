// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tournament.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tournament _$TournamentFromJson(Map<String, dynamic> json) => Tournament(
      id: json['id'] as int,
      name: json['name'] as String,
      logo: json['logo'] as String?,
      banner: json['banner'] as String?,
      flags: json['flags'] as int,
      internalFlags: json['internal_flags'] as int?,
      startsAt: const TimestampConverter().fromJson(json['starts_at'] as int),
      endsAt:
          const NullableTimestampConverter().fromJson(json['ends_at'] as int?),
      participants: json['participants'] as int,
      slots: json['slots'] as int?,
      gameId: $enumDecode(_$GameIdEnumMap, json['game_id']),
      gameSettings: json['game_settings'] as String,
      org: json['org'] == null
          ? null
          : Club.fromJson(json['org'] as Map<String, dynamic>),
      customBanner: json['custom_banner'] as String?,
      format: $enumDecode(_$TournamentFormatEnumMap, json['format']),
      winPoints: json['win_points'] as int,
      tiePoints: json['tie_points'] as int,
      lossPoints: json['loss_points'] as int,
    );

Map<String, dynamic> _$TournamentToJson(Tournament instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
      'banner': instance.banner,
      'flags': instance.flags,
      'internal_flags': instance.internalFlags,
      'starts_at': const TimestampConverter().toJson(instance.startsAt),
      'ends_at': const NullableTimestampConverter().toJson(instance.endsAt),
      'participants': instance.participants,
      'slots': instance.slots,
      'game_id': _$GameIdEnumMap[instance.gameId],
      'game_settings': instance.gameSettings,
      'custom_banner': instance.customBanner,
      'format': _$TournamentFormatEnumMap[instance.format],
      'win_points': instance.winPoints,
      'tie_points': instance.tiePoints,
      'loss_points': instance.lossPoints,
      'org': instance.org,
    };

const _$GameIdEnumMap = {
  GameId.fifa21: 1,
  GameId.pes20: 2,
  GameId.fifa22: 3,
};

const _$TournamentFormatEnumMap = {
  TournamentFormat.matchmaking: 0,
  TournamentFormat.singleElimination: 1,
  TournamentFormat.swissSystem: 2,
  TournamentFormat.roundRobin: 3,
  TournamentFormat.stages: 4,
};
