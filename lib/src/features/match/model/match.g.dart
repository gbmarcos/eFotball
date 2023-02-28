// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchMakingMatch _$MatchMakingMatchFromJson(Map<String, dynamic> json) =>
    MatchMakingMatch(
      id: json['id'] as int,
      tournamentId: json['tournament_id'] as int,
      user1Id: json['user1_id'] as int,
      user2Id: json['user2_id'] as int,
      user1Score: json['user1_score'] as int?,
      user2Score: json['user2_score'] as int?,
      droppedUserId: json['dropped_user_id'] as int?,
      submittedUserId: json['submitted_user_id'] as int?,
      confirmedUserId: json['confirmed_user_id'] as int?,
      conflicted: json['conflicted'] as int?,
      submittedTimestamp: const NullableTimestampConverter()
          .fromJson(json['submitted_timestamp'] as int?),
    );

Map<String, dynamic> _$MatchMakingMatchToJson(MatchMakingMatch instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tournament_id': instance.tournamentId,
      'user1_id': instance.user1Id,
      'user2_id': instance.user2Id,
      'user1_score': instance.user1Score,
      'user2_score': instance.user2Score,
      'dropped_user_id': instance.droppedUserId,
      'submitted_user_id': instance.submittedUserId,
      'confirmed_user_id': instance.confirmedUserId,
      'conflicted': instance.conflicted,
      'submitted_timestamp': const NullableTimestampConverter()
          .toJson(instance.submittedTimestamp),
    };

MatchCheckInInfo _$MatchCheckInInfoFromJson(Map<String, dynamic> json) =>
    MatchCheckInInfo(
      id: json['id'] as int,
      tournamentId: json['tournament_id'] as int,
      console: json['console'] as int,
      user1Score: json['user1_score'] as int?,
      user2Score: json['user2_score'] as int?,
      flags: json['flags'] as int,
      inserted: const TimestampConverter().fromJson(json['inserted'] as int),
      droppedUserId: json['dropped_user_id'] as int?,
      submittedUserId: json['submitted_user_id'] as int?,
      submittedTimestamp: const NullableTimestampConverter()
          .fromJson(json['submitted_timestamp'] as int?),
      confirmedUserId: json['confirmed_user_id'] as int?,
      conflicted: json['conflicted'] as int?,
      evidence: (json['evidence'] as List<dynamic>?)
          ?.map((e) => UserEvidence.fromJson(e as Map<String, dynamic>))
          .toList(),
      user1: MatchUser.fromJson(json['user1'] as Map<String, dynamic>),
      user2: MatchUser.fromJson(json['user2'] as Map<String, dynamic>),
      team1: json['team1'] == null
          ? null
          : TeamRef.fromJson(json['team1'] as Map<String, dynamic>),
      team2: json['team2'] == null
          ? null
          : TeamRef.fromJson(json['team2'] as Map<String, dynamic>),
      tournament:
          TournamentRef.fromJson(json['tournament'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MatchCheckInInfoToJson(MatchCheckInInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tournament_id': instance.tournamentId,
      'console': instance.console,
      'user1_score': instance.user1Score,
      'user2_score': instance.user2Score,
      'flags': instance.flags,
      'inserted': const TimestampConverter().toJson(instance.inserted),
      'dropped_user_id': instance.droppedUserId,
      'submitted_user_id': instance.submittedUserId,
      'submitted_timestamp': const NullableTimestampConverter()
          .toJson(instance.submittedTimestamp),
      'confirmed_user_id': instance.confirmedUserId,
      'conflicted': instance.conflicted,
      'evidence': instance.evidence,
      'user1': instance.user1,
      'user2': instance.user2,
      'team1': instance.team1,
      'team2': instance.team2,
      'tournament': instance.tournament,
    };

EndedMatchResponse _$EndedMatchResponseFromJson(Map<String, dynamic> json) =>
    EndedMatchResponse(
      match: MatchMakingMatch.fromJson(json['match'] as Map<String, dynamic>),
      tournament:
          TournamentRef.fromJson(json['tournament'] as Map<String, dynamic>),
      tournamentStartsAt: const NullableTimestampConverter()
          .fromJson(json['tournament_starts_at'] as int?),
      user1: UserBasicInfo.fromJson(json['user1'] as Map<String, dynamic>),
      user2: UserBasicInfo.fromJson(json['user2'] as Map<String, dynamic>),
      team1: json['team1'] == null
          ? null
          : TeamRef.fromJson(json['team1'] as Map<String, dynamic>),
      team2: json['team2'] == null
          ? null
          : TeamRef.fromJson(json['team2'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EndedMatchResponseToJson(EndedMatchResponse instance) =>
    <String, dynamic>{
      'match': instance.match,
      'tournament': instance.tournament,
      'tournament_starts_at': const NullableTimestampConverter()
          .toJson(instance.tournamentStartsAt),
      'user1': instance.user1,
      'user2': instance.user2,
      'team1': instance.team1,
      'team2': instance.team2,
    };

_$_Match _$$_MatchFromJson(Map<String, dynamic> json) => _$_Match(
      id: json['id'] as int,
      tournamentId: json['tournament_id'] as int,
      console: json['console'] as int,
      user1Score: json['user1_score'] as int?,
      user2Score: json['user2_score'] as int?,
      flags: json['flags'] as int,
      inserted: const TimestampConverter().fromJson(json['inserted'] as int),
      user1: UserBasicInfo.fromJson(json['user1'] as Map<String, dynamic>),
      user2: UserBasicInfo.fromJson(json['user2'] as Map<String, dynamic>),
      team1: json['team1'] == null
          ? null
          : TeamRef.fromJson(json['team1'] as Map<String, dynamic>),
      team2: json['team2'] == null
          ? null
          : TeamRef.fromJson(json['team2'] as Map<String, dynamic>),
      org: json['org'] == null
          ? null
          : Club.fromJson(json['org'] as Map<String, dynamic>),
      round: json['round'] as int,
      tournament: json['tournament'] == null
          ? null
          : TournamentRef.fromJson(json['tournament'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MatchToJson(_$_Match instance) => <String, dynamic>{
      'id': instance.id,
      'tournament_id': instance.tournamentId,
      'console': instance.console,
      'user1_score': instance.user1Score,
      'user2_score': instance.user2Score,
      'flags': instance.flags,
      'inserted': const TimestampConverter().toJson(instance.inserted),
      'user1': instance.user1,
      'user2': instance.user2,
      'team1': instance.team1,
      'team2': instance.team2,
      'org': instance.org,
      'round': instance.round,
      'tournament': instance.tournament,
    };

_$_MatchSingle _$$_MatchSingleFromJson(Map<String, dynamic> json) =>
    _$_MatchSingle(
      id: json['id'] as int,
      tournamentId: json['tournament_id'] as int,
      console: json['console'] as int,
      user1Score: json['user1_score'] as int?,
      user2Score: json['user2_score'] as int?,
      flags: json['flags'] as int,
      inserted: const TimestampConverter().fromJson(json['inserted'] as int),
      droppedUserId: json['dropped_user_id'] as int?,
      submittedUserId: json['submitted_user_id'] as int?,
      submittedTimestamp: const NullableTimestampConverter()
          .fromJson(json['submitted_timestamp'] as int?),
      confirmedUserId: json['confirmed_user_id'] as int?,
      conflicted: json['conflicted'] as int?,
      evidence: (json['evidence'] as List<dynamic>?)
          ?.map((e) => UserEvidence.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_MatchSingleToJson(_$_MatchSingle instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tournament_id': instance.tournamentId,
      'console': instance.console,
      'user1_score': instance.user1Score,
      'user2_score': instance.user2Score,
      'flags': instance.flags,
      'inserted': const TimestampConverter().toJson(instance.inserted),
      'dropped_user_id': instance.droppedUserId,
      'submitted_user_id': instance.submittedUserId,
      'submitted_timestamp': const NullableTimestampConverter()
          .toJson(instance.submittedTimestamp),
      'confirmed_user_id': instance.confirmedUserId,
      'conflicted': instance.conflicted,
      'evidence': instance.evidence,
    };

_$_NextMatch _$$_NextMatchFromJson(Map<String, dynamic> json) => _$_NextMatch(
      startsAt: const TimestampConverter().fromJson(json['starts_at'] as int),
      tournament: NextMatchTournament.fromJson(
          json['tournament'] as Map<String, dynamic>),
      team1: NextMatchTeam.fromJson(json['team1'] as Map<String, dynamic>),
      team2: NextMatchTeam.fromJson(json['team2'] as Map<String, dynamic>),
      twitchLink: json['twitch_link'] as String?,
    );

Map<String, dynamic> _$$_NextMatchToJson(_$_NextMatch instance) =>
    <String, dynamic>{
      'starts_at': const TimestampConverter().toJson(instance.startsAt),
      'tournament': instance.tournament,
      'team1': instance.team1,
      'team2': instance.team2,
      'twitch_link': instance.twitchLink,
    };

_$_LatestMatch _$$_LatestMatchFromJson(Map<String, dynamic> json) =>
    _$_LatestMatch(
      startsAt: const TimestampConverter().fromJson(json['starts_at'] as int),
      tournament: NextMatchTournament.fromJson(
          json['tournament'] as Map<String, dynamic>),
      team1: NextMatchTeam.fromJson(json['team1'] as Map<String, dynamic>),
      team2: NextMatchTeam.fromJson(json['team2'] as Map<String, dynamic>),
      twitchLink: json['twitch_link'] as String?,
      matches: (json['matches'] as List<dynamic>)
          .map((e) => LatestMatchMatch.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_LatestMatchToJson(_$_LatestMatch instance) =>
    <String, dynamic>{
      'starts_at': const TimestampConverter().toJson(instance.startsAt),
      'tournament': instance.tournament,
      'team1': instance.team1,
      'team2': instance.team2,
      'twitch_link': instance.twitchLink,
      'matches': instance.matches,
    };
