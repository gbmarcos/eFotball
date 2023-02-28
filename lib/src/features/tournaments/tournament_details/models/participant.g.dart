// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Participant _$ParticipantFromJson(Map<String, dynamic> json) => Participant(
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
    );

Map<String, dynamic> _$ParticipantToJson(Participant instance) =>
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
    };

const _$ConsoleEnumMap = {
  Console.xbox: 0,
  Console.playstation: 1,
};

_$_TournamentParticipant _$$_TournamentParticipantFromJson(
        Map<String, dynamic> json) =>
    _$_TournamentParticipant(
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
      rank: json['rank'] as int,
      gamerTag: json['gamer_tag'] as String,
    );

Map<String, dynamic> _$$_TournamentParticipantToJson(
        _$_TournamentParticipant instance) =>
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
      'rank': instance.rank,
      'gamer_tag': instance.gamerTag,
    };

_$_Team _$$_TeamFromJson(Map<String, dynamic> json) => _$_Team(
      id: json['id'] as int,
      name: json['name'] as String,
      logo: json['logo'] as String?,
    );

Map<String, dynamic> _$$_TeamToJson(_$_Team instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
    };
