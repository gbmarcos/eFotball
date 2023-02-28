// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tournament_collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TournamentCollection _$TournamentCollectionFromJson(
        Map<String, dynamic> json) =>
    TournamentCollection(
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
      stages: (json['stages'] as List<dynamic>?)
          ?.map((e) => TournamentCollectionStageEntry.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      league: json['league'] == null
          ? null
          : League.fromJson(json['league'] as Map<String, dynamic>),
      prizes: (json['prizes'] as List<dynamic>?)
          ?.map((e) => TournamentPrize.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TournamentCollectionToJson(
        TournamentCollection instance) =>
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
      'stages': instance.stages,
    };

const _$GameIdEnumMap = {
  GameId.fifa21: 1,
  GameId.pes20: 2,
  GameId.fifa22: 3,
};

TournamentCollectionParticipant _$TournamentCollectionParticipantFromJson(
        Map<String, dynamic> json) =>
    TournamentCollectionParticipant(
      id: json['id'] as int,
      username: json['username'] as String,
      avatar: json['avatar'] as String?,
      countryId: json['country_id'] as int?,
      console: $enumDecodeNullable(_$ConsoleEnumMap, json['console']),
      flags: json['flags'] as int,
      teamId: json['team_id'] as int?,
      wins: json['wins'] as int,
      losses: json['losses'] as int,
      ties: json['ties'] as int,
      drops: json['drops'] as int,
      matches: json['matches'] as int,
      goalsScored: json['goals_scored'] as int,
      goalsConceded: json['goals_conceded'] as int,
      score: json['score'] as int?,
      subscore: json['subscore'] as int?,
      elo: json['elo'] as int,
      globalElo: json['global_elo'] as int?,
      team: json['team'] == null
          ? null
          : Team.fromJson(json['team'] as Map<String, dynamic>),
      matchHistory: (json['match_history'] as List<dynamic>?)
          ?.map((e) => MatchHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
      tournamentStats: (json['tournament_stats'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(int.parse(k),
            ParticipantScoreFields.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$TournamentCollectionParticipantToJson(
        TournamentCollectionParticipant instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'avatar': instance.avatar,
      'country_id': instance.countryId,
      'console': _$ConsoleEnumMap[instance.console],
      'flags': instance.flags,
      'team_id': instance.teamId,
      'wins': instance.wins,
      'losses': instance.losses,
      'ties': instance.ties,
      'drops': instance.drops,
      'matches': instance.matches,
      'goals_scored': instance.goalsScored,
      'goals_conceded': instance.goalsConceded,
      'score': instance.score,
      'subscore': instance.subscore,
      'elo': instance.elo,
      'global_elo': instance.globalElo,
      'team': instance.team,
      'match_history': instance.matchHistory,
      'tournament_stats':
          instance.tournamentStats.map((k, e) => MapEntry(k.toString(), e)),
    };

const _$ConsoleEnumMap = {
  Console.xbox: 0,
  Console.playstation: 1,
};

ParticipantScoreFields _$ParticipantScoreFieldsFromJson(
        Map<String, dynamic> json) =>
    ParticipantScoreFields(
      drops: json['drops'] as int,
      elo: json['elo'] as int,
      globalElo: json['global_elo'] as int?,
      goalsConceded: json['goals_conceded'] as int,
      goalsScored: json['goals_scored'] as int,
      losses: json['losses'] as int,
      matches: json['matches'] as int,
      score: json['score'] as int?,
      subscore: json['subscore'] as int?,
      teamId: json['team_id'] as int?,
      ties: json['ties'] as int,
      wins: json['wins'] as int,
    );

Map<String, dynamic> _$ParticipantScoreFieldsToJson(
        ParticipantScoreFields instance) =>
    <String, dynamic>{
      'drops': instance.drops,
      'elo': instance.elo,
      'global_elo': instance.globalElo,
      'goals_conceded': instance.goalsConceded,
      'goals_scored': instance.goalsScored,
      'losses': instance.losses,
      'matches': instance.matches,
      'score': instance.score,
      'subscore': instance.subscore,
      'team_id': instance.teamId,
      'ties': instance.ties,
      'wins': instance.wins,
    };

_$_TournamentCollectionStageEntry _$$_TournamentCollectionStageEntryFromJson(
        Map<String, dynamic> json) =>
    _$_TournamentCollectionStageEntry(
      id: json['id'] as int,
      name: json['name'] as String,
      logo: json['logo'] as String?,
      banner: json['banner'] as String?,
      flags: json['flags'] as int,
      stage: json['stage'] as int,
      format: json['format'] as int,
      slots: json['slots'] as int,
      participants: json['participants'] as int,
      winners: json['winners'] as int?,
      winningStage: json['winning_stage'] as int?,
      internalFlags: json['internal_flags'] as int?,
      winningStageTournamentID: json['winning_stage_tournament_i_d'] as int?,
    );

Map<String, dynamic> _$$_TournamentCollectionStageEntryToJson(
        _$_TournamentCollectionStageEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
      'banner': instance.banner,
      'flags': instance.flags,
      'stage': instance.stage,
      'format': instance.format,
      'slots': instance.slots,
      'participants': instance.participants,
      'winners': instance.winners,
      'winning_stage': instance.winningStage,
      'internal_flags': instance.internalFlags,
      'winning_stage_tournament_i_d': instance.winningStageTournamentID,
    };

_$_MatchHistory _$$_MatchHistoryFromJson(Map<String, dynamic> json) =>
    _$_MatchHistory(
      id: json['id'] as int,
      tournamentId: json['tournament_id'] as int,
      user1Id: json['user1_id'] as int,
      user2Id: json['user2_id'] as int,
      opponentName: json['opponent_name'] as String,
      score1: json['score1'] as int?,
      score2: json['score2'] as int?,
      flags: json['flags'] as int,
    );

Map<String, dynamic> _$$_MatchHistoryToJson(_$_MatchHistory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tournament_id': instance.tournamentId,
      'user1_id': instance.user1Id,
      'user2_id': instance.user2Id,
      'opponent_name': instance.opponentName,
      'score1': instance.score1,
      'score2': instance.score2,
      'flags': instance.flags,
    };
