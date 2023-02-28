import 'package:fifa/src/common/data/converters.dart';
import 'package:fifa/src/common/domain/team/team.dart';
import 'package:fifa/src/common/domain/tournament/tournament.dart';
import 'package:fifa/src/common/domain/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'match.g.dart';

part 'match.freezed.dart';

@JsonSerializable()
class MatchRef {
  final int id;
  final int tournamentId;
  final int console;
  final int? user1Score;
  final int? user2Score;
  final int flags;
  @TimestampConverter()
  final DateTime inserted;

  MatchRef({
    required this.id,
    required this.tournamentId,
    required this.console,
    this.user1Score,
    this.user2Score,
    required this.flags,
    required this.inserted,
  });

  bool get walkover => (flags & MatchFlags.walkover) > 0;

  factory MatchRef.fromJson(Map<String, dynamic> json) => _$MatchRefFromJson(json);
}

@JsonSerializable()
class OrgMatch {
  @TimestampConverter()
  final DateTime startsAt;
  final NextMatchTournament tournament;
  final NextMatchTeam team1;
  final NextMatchTeam team2;
  final String? twitchLink;

  OrgMatch({
    required this.startsAt,
    required this.tournament,
    required this.team1,
    required this.team2,
    this.twitchLink,
  });

  factory OrgMatch.fromJson(Map<String, dynamic> json) => _$OrgMatchFromJson(json);
}

@JsonSerializable()
class LatestMatchMatch {
  final int match;
  final int? matchId;
  final int? console;
  final LatestMatchUser user1;
  final LatestMatchUser user2;

  LatestMatchMatch({
    required this.match,
    required this.user1,
    required this.user2,
    this.matchId,
    this.console,
  });

  factory LatestMatchMatch.fromJson(Map<String, dynamic> json) => _$LatestMatchMatchFromJson(json);
}

class MatchFlags {
  const MatchFlags._();

  static const forfeit = 1 << 0;

  ///if match.flags & MatchFlags.walkover!=0 : there was no walkover
  static const walkover = 1 << 1;
}

///The pending active matches a user has, with the corresponding [tournamentId] they belong to.
///Usually received associated to a User
@freezed
class ActiveMatch with _$ActiveMatch {
  factory ActiveMatch({
    required int matchId,
    required int tournamentId,
    bool? actionNeeded,
    bool? scoreSubmitted,
  }) = _ActiveMatch;

  const ActiveMatch._();

  factory ActiveMatch.fromJson(Map<String, dynamic> map) => _$ActiveMatchFromJson(map);
}
