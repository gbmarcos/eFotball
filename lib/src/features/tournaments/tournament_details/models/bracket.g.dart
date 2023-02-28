// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bracket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TournamentBracket _$$_TournamentBracketFromJson(Map<String, dynamic> json) =>
    _$_TournamentBracket(
      id: json['id'] as int,
      tournamentId: json['tournament_id'] as int,
      user1Id: json['user1_id'] as int?,
      user2Id: json['user2_id'] as int?,
      startTime: const NullableTimestampConverter()
          .fromJson(json['start_time'] as int?),
      round: json['round'] as int,
      winnerBracketId: json['winner_bracket_id'] as int?,
      loserBracketId: json['loser_bracket_id'] as int?,
      user1Score: json['user1_score'] as int?,
      user2Score: json['user2_score'] as int?,
      verified: json['verified'] as bool,
      flags: json['flags'] as int?,
    );

Map<String, dynamic> _$$_TournamentBracketToJson(
        _$_TournamentBracket instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tournament_id': instance.tournamentId,
      'user1_id': instance.user1Id,
      'user2_id': instance.user2Id,
      'start_time':
          const NullableTimestampConverter().toJson(instance.startTime),
      'round': instance.round,
      'winner_bracket_id': instance.winnerBracketId,
      'loser_bracket_id': instance.loserBracketId,
      'user1_score': instance.user1Score,
      'user2_score': instance.user2Score,
      'verified': instance.verified,
      'flags': instance.flags,
    };
