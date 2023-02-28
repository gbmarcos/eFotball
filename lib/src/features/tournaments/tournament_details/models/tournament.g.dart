// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tournament.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TournamentEntry _$TournamentEntryFromJson(Map<String, dynamic> json) =>
    TournamentEntry(
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
      description: json['description'] as String?,
      org: json['org'] == null
          ? null
          : OrgRef.fromJson(json['org'] as Map<String, dynamic>),
      league: json['league'] == null
          ? null
          : League.fromJson(json['league'] as Map<String, dynamic>),
      prizes: (json['prizes'] as List<dynamic>?)
          ?.map((e) => TournamentPrize.fromJson(e as Map<String, dynamic>))
          .toList(),
      customBanner: json['custom_banner'] as String?,
      format: $enumDecode(_$TournamentFormatEnumMap, json['format']),
      winPoints: json['win_points'] as int,
      tiePoints: json['tie_points'] as int,
      lossPoints: json['loss_points'] as int,
    );

Map<String, dynamic> _$TournamentEntryToJson(TournamentEntry instance) =>
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
      'description': instance.description,
      'org': instance.org,
      'league': instance.league,
      'prizes': instance.prizes,
      'custom_banner': instance.customBanner,
      'format': _$TournamentFormatEnumMap[instance.format],
      'win_points': instance.winPoints,
      'tie_points': instance.tiePoints,
      'loss_points': instance.lossPoints,
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

_$_TournamentLobbyBasic _$$_TournamentLobbyBasicFromJson(
        Map<String, dynamic> json) =>
    _$_TournamentLobbyBasic(
      id: json['id'] as int,
      bracketId: json['bracket_id'] as int,
      user1CheckIn: const NullableTimestampConverter()
          .fromJson(json['user1_check_in'] as int?),
      user2CheckIn: const NullableTimestampConverter()
          .fromJson(json['user2_check_in'] as int?),
    );

Map<String, dynamic> _$$_TournamentLobbyBasicToJson(
        _$_TournamentLobbyBasic instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bracket_id': instance.bracketId,
      'user1_check_in':
          const NullableTimestampConverter().toJson(instance.user1CheckIn),
      'user2_check_in':
          const NullableTimestampConverter().toJson(instance.user2CheckIn),
    };

_$_TournamentLobby _$$_TournamentLobbyFromJson(Map<String, dynamic> json) =>
    _$_TournamentLobby(
      id: json['id'] as int,
      bracketId: json['bracket_id'] as int,
      user1CheckIn: const NullableTimestampConverter()
          .fromJson(json['user1_check_in'] as int?),
      user2CheckIn: const NullableTimestampConverter()
          .fromJson(json['user2_check_in'] as int?),
      user1: UserBasicInfo.fromJson(json['user1'] as Map<String, dynamic>),
      user2: UserBasicInfo.fromJson(json['user2'] as Map<String, dynamic>),
      matchId: json['match_id'] as int?,
      tournamentId: json['tournament_id'] as int,
      walkoverTime:
          const TimestampConverter().fromJson(json['walkover_time'] as int),
    );

Map<String, dynamic> _$$_TournamentLobbyToJson(_$_TournamentLobby instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bracket_id': instance.bracketId,
      'user1_check_in':
          const NullableTimestampConverter().toJson(instance.user1CheckIn),
      'user2_check_in':
          const NullableTimestampConverter().toJson(instance.user2CheckIn),
      'user1': instance.user1,
      'user2': instance.user2,
      'match_id': instance.matchId,
      'tournament_id': instance.tournamentId,
      'walkover_time': const TimestampConverter().toJson(instance.walkoverTime),
    };

_$_League _$$_LeagueFromJson(Map<String, dynamic> json) => _$_League(
      id: json['id'] as int,
      name: json['name'] as String,
      logo: json['logo'] as String?,
      countryId: json['country_id'] as int?,
      inserted: json['inserted'] as int,
    );

Map<String, dynamic> _$$_LeagueToJson(_$_League instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
      'country_id': instance.countryId,
      'inserted': instance.inserted,
    };

_$_TournamentPrize _$$_TournamentPrizeFromJson(Map<String, dynamic> json) =>
    _$_TournamentPrize(
      place: json['place'] as int,
      title: json['title'] as String,
      amount: json['amount'] as String,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$_TournamentPrizeToJson(_$_TournamentPrize instance) =>
    <String, dynamic>{
      'place': instance.place,
      'title': instance.title,
      'amount': instance.amount,
      'image': instance.image,
    };
