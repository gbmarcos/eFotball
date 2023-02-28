// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchRef _$MatchRefFromJson(Map<String, dynamic> json) => MatchRef(
      id: json['id'] as int,
      tournamentId: json['tournament_id'] as int,
      console: json['console'] as int,
      user1Score: json['user1_score'] as int?,
      user2Score: json['user2_score'] as int?,
      flags: json['flags'] as int,
      inserted: const TimestampConverter().fromJson(json['inserted'] as int),
    );

Map<String, dynamic> _$MatchRefToJson(MatchRef instance) => <String, dynamic>{
      'id': instance.id,
      'tournament_id': instance.tournamentId,
      'console': instance.console,
      'user1_score': instance.user1Score,
      'user2_score': instance.user2Score,
      'flags': instance.flags,
      'inserted': const TimestampConverter().toJson(instance.inserted),
    };

OrgMatch _$OrgMatchFromJson(Map<String, dynamic> json) => OrgMatch(
      startsAt: const TimestampConverter().fromJson(json['starts_at'] as int),
      tournament: NextMatchTournament.fromJson(
          json['tournament'] as Map<String, dynamic>),
      team1: NextMatchTeam.fromJson(json['team1'] as Map<String, dynamic>),
      team2: NextMatchTeam.fromJson(json['team2'] as Map<String, dynamic>),
      twitchLink: json['twitch_link'] as String?,
    );

Map<String, dynamic> _$OrgMatchToJson(OrgMatch instance) => <String, dynamic>{
      'starts_at': const TimestampConverter().toJson(instance.startsAt),
      'tournament': instance.tournament,
      'team1': instance.team1,
      'team2': instance.team2,
      'twitch_link': instance.twitchLink,
    };

LatestMatchMatch _$LatestMatchMatchFromJson(Map<String, dynamic> json) =>
    LatestMatchMatch(
      match: json['match'] as int,
      user1: LatestMatchUser.fromJson(json['user1'] as Map<String, dynamic>),
      user2: LatestMatchUser.fromJson(json['user2'] as Map<String, dynamic>),
      matchId: json['match_id'] as int?,
      console: json['console'] as int?,
    );

Map<String, dynamic> _$LatestMatchMatchToJson(LatestMatchMatch instance) =>
    <String, dynamic>{
      'match': instance.match,
      'match_id': instance.matchId,
      'console': instance.console,
      'user1': instance.user1,
      'user2': instance.user2,
    };

_$_ActiveMatch _$$_ActiveMatchFromJson(Map<String, dynamic> json) =>
    _$_ActiveMatch(
      matchId: json['match_id'] as int,
      tournamentId: json['tournament_id'] as int,
      actionNeeded: json['action_needed'] as bool?,
      scoreSubmitted: json['score_submitted'] as bool?,
    );

Map<String, dynamic> _$$_ActiveMatchToJson(_$_ActiveMatch instance) =>
    <String, dynamic>{
      'match_id': instance.matchId,
      'tournament_id': instance.tournamentId,
      'action_needed': instance.actionNeeded,
      'score_submitted': instance.scoreSubmitted,
    };
