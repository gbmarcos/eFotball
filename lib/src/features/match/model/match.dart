import 'package:fifa/src/common/data/converters.dart';
import 'package:fifa/src/common/domain/match/match.dart';
import 'package:fifa/src/common/domain/team/team.dart';
import 'package:fifa/src/common/domain/tournament/tournament.dart';
import 'package:fifa/src/common/domain/user/user.dart';
import 'package:fifa/src/features/club/model/club.dart';
import 'package:fifa/src/features/match/model/evidence.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'match.freezed.dart';

part 'match.g.dart';

List<Match> matchesFromJson(List<dynamic> str) =>
    List<Match>.from(str.map<Match>((dynamic x) => Match.fromJson(x as Map<String, dynamic>)));

List<LatestMatch> latestOrgMatchesFromJson(List<dynamic> str) =>
    List<LatestMatch>.from(str.map<LatestMatch>((dynamic x) => LatestMatch.fromJson(x as Map<String, dynamic>)));

@freezed
class Match with _$Match {
  @Implements<MatchRef>()
  factory Match({
    required int id,
    required int tournamentId,
    required int console,
    int? user1Score,
    int? user2Score,
    required int flags,
    @TimestampConverter() required DateTime inserted,
    required UserBasicInfo user1,
    required UserBasicInfo user2,
    TeamRef? team1,
    TeamRef? team2,
    Club? org,
    required int round,
    TournamentRef? tournament,
  }) = _Match;

  const Match._();

  bool get walkover => (flags & MatchFlags.walkover) > 0;

  factory Match.fromJson(Map<String, dynamic> map) => _$MatchFromJson(map);
}

@freezed
class MatchSingle with _$MatchSingle {
  @Implements<MatchRef>()
  factory MatchSingle({
    required int id,
    required int tournamentId,
    required int console,
    int? user1Score,
    int? user2Score,
    required int flags,
    @TimestampConverter() required DateTime inserted,
    int? droppedUserId,
    int? submittedUserId,
    @NullableTimestampConverter() DateTime? submittedTimestamp,
    int? confirmedUserId,
    int? conflicted,
    List<UserEvidence>? evidence,
  }) = _MatchSingle;

  @Implements<MatchRef>()
  const MatchSingle._();

  bool get walkover => (flags & MatchFlags.walkover) > 0;

  factory MatchSingle.fromJson(Map<String, dynamic> map) => _$MatchSingleFromJson(map);
}

abstract class MatchScores {
  final int user1Id;
  final int user2Id;
  final int? user1Score;
  final int? user2Score;

  MatchScores(this.user1Id, this.user2Id, this.user1Score, this.user2Score);
}

@JsonSerializable()
class MatchMakingMatch implements MatchScores {
  final int id;
  final int tournamentId;
  @override
  final int user1Id;
  @override
  final int user2Id;
  @override
  int? user1Score;
  @override
  int? user2Score;
  int? droppedUserId;
  int? submittedUserId;
  int? confirmedUserId;
  int? conflicted;
  @NullableTimestampConverter()
  DateTime? submittedTimestamp;

  MatchMakingMatch({
    required this.id,
    required this.tournamentId,
    required this.user1Id,
    required this.user2Id,
    this.user1Score,
    this.user2Score,
    this.droppedUserId,
    this.submittedUserId,
    this.confirmedUserId,
    this.conflicted,
    @NullableTimestampConverter() this.submittedTimestamp,
  });

  factory MatchMakingMatch.fromJson(Map<String, dynamic> map) => _$MatchMakingMatchFromJson(map);
}



@JsonSerializable()
class MatchCheckInInfo implements MatchScores {
  final int id;
  final int tournamentId;
  final int console;
  @override
  int? user1Score;
  @override
  int? user2Score;
  final int flags;
  @TimestampConverter()
  DateTime inserted;
  int? droppedUserId;
  int? submittedUserId;
  @NullableTimestampConverter()
  DateTime? submittedTimestamp;
  int? confirmedUserId;
  int? conflicted;
  List<UserEvidence>? evidence;
  final MatchUser user1;
  final MatchUser user2;
  TeamRef? team1;
  TeamRef? team2;
  final TournamentRef tournament;

  MatchCheckInInfo(
      {required this.id,
      required this.tournamentId,
      required this.console,
      this.user1Score,
      this.user2Score,
      required this.flags,
      @TimestampConverter() required this.inserted,
      this.droppedUserId,
      this.submittedUserId,
      @NullableTimestampConverter() this.submittedTimestamp,
      this.confirmedUserId,
      this.conflicted,
      this.evidence,
      required this.user1,
      required this.user2,
      this.team1,
      this.team2,
      required this.tournament});

  bool get walkover => (flags & MatchFlags.walkover) > 0;

  factory MatchCheckInInfo.fromJson(Map<String, dynamic> map) => _$MatchCheckInInfoFromJson(map);

  @override
  int get user1Id => user1.id!;

  @override
  int get user2Id => user2.id!;

  ScoreStates scoreState(int currentUserId) {
    if (confirmedUserId != null && submittedUserId != null) {
      return ScoreStates.verified;
    } else if (conflicted != null && confirmedUserId == null) {
      return ScoreStates.conflicted;
    } else if (submittedTimestamp == null && submittedUserId == null && user1Score == null && user2Score == null) {
      return ScoreStates.start;
    } else if (submittedTimestamp != null && submittedUserId != null && user1Score != null && user2Score != null) {
      if (currentUserId == submittedUserId) return ScoreStates.submitted;
      return ScoreStates.confirm;
    } else {
      return ScoreStates.start;
    }
  }

  @override
  String toString() {
    return 'MatchCheckInInfo{id: $id, tournamentId: $tournamentId, console: $console, user1Score: $user1Score, user2Score: $user2Score, flags: $flags, inserted: $inserted, droppedUserId: $droppedUserId, submittedUserId: $submittedUserId, submittedTimestamp: $submittedTimestamp, confirmedUserId: $confirmedUserId, conflicted: $conflicted, evidence: $evidence, user1: $user1, user2: $user2, team1: $team1, team2: $team2, tournament: $tournament}';
  }
}

///Describes in which state an [MatchCheckInInfo] is in.
enum ScoreStates {
  start, //_MatchLobbyGameInProgress
  submit, // _MatchLobbyAddResult

  submitted, //   // _MatchLobbyAwaitingConfirmation
  confirm, // _MatchLobbyConfirmResult

  conflicted, // _MatchLobbyDisputeInProgress || // _MatchLobbyConfirmResult
  verified // _MatchLobbyGameOver
}

enum MatchmakingState {
  loading,
  searching,
  ready,
  playing,
}

@freezed
class NextMatch with _$NextMatch {
  @Implements<OrgMatch>()
  factory NextMatch({
    @TimestampConverter() required DateTime startsAt,
    required NextMatchTournament tournament,
    required NextMatchTeam team1,
    required NextMatchTeam team2,
    String? twitchLink,
  }) = _NextMatch;

  const NextMatch._();

  factory NextMatch.fromJson(Map<String, dynamic> map) => _$NextMatchFromJson(map);
}

@freezed
class LatestMatch with _$LatestMatch {
  @Implements<OrgMatch>()
  factory LatestMatch({
    @TimestampConverter() required DateTime startsAt,
    required NextMatchTournament tournament,
    required NextMatchTeam team1,
    required NextMatchTeam team2,
    String? twitchLink,
    required List<LatestMatchMatch> matches,
  }) = _LatestMatch;

  const LatestMatch._();

  factory LatestMatch.fromJson(Map<String, dynamic> map) => _$LatestMatchFromJson(map);
}



// Received usually via pusher on `end-match-conflict`
@JsonSerializable()
class EndedMatchResponse {
  final MatchMakingMatch match;
  final TournamentRef tournament;
  @NullableTimestampConverter()
  final DateTime? tournamentStartsAt;
  final UserBasicInfo user1;
  final UserBasicInfo user2;
  final TeamRef? team1;
  final TeamRef? team2;

  EndedMatchResponse({
    required this.match,
    required this.tournament,
    @NullableTimestampConverter() this.tournamentStartsAt,
    required this.user1,
    required this.user2,
    this.team1,
    this.team2,
  });
  factory EndedMatchResponse.fromJson(Map<String, dynamic> map) => _$EndedMatchResponseFromJson(map);
}
