import 'package:fifa/src/common/data/converters.dart';
import 'package:fifa/src/common/domain/match/match.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bracket.freezed.dart';

part 'bracket.g.dart';

List<TournamentBracket> tournamentBracketsFromJson(List<dynamic> str) =>
    List<TournamentBracket>.from(str.map<TournamentBracket>(
        (dynamic x) => TournamentBracket.fromJson(x as Map<String, dynamic>)));

@freezed
class TournamentBracket with _$TournamentBracket {
  const factory TournamentBracket({
    required int id,
    required int tournamentId,
    int? user1Id,
    int? user2Id,
    @NullableTimestampConverter() DateTime? startTime,
    required int round,
    int? winnerBracketId,
    int? loserBracketId,
    int? user1Score,
    int? user2Score,
    required bool verified,
    int? flags,
  }) = _TournamentBracket;

  const TournamentBracket._();

  bool get walkover => (flags != null) && (flags! & MatchFlags.walkover) > 0;

  factory TournamentBracket.fromJson(Map<String, dynamic> json) =>
      _$TournamentBracketFromJson(json);
}
