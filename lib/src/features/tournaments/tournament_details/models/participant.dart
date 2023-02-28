import 'package:fifa/src/common/domain/user/user.dart';
import 'package:fifa/src/features/tournaments/collection/model/tournament_collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'participant.freezed.dart';

part 'participant.g.dart';

List<Participant> tournamentParticipantsFromJson(List<dynamic> str) =>
    List<Participant>.from(str.map<Participant>((dynamic x) => Participant.fromJson(x as Map<String, dynamic>)));

@JsonSerializable()
class Participant implements ParticipantScoreFields {
  final int id;
  final String username;
  final String? avatar;
  final int? countryId;
  final Console? console;
  final int flags;
  final int? teamId;
  final int wins;
  final int losses;
  final int ties;
  final int drops;
  final int matches;
  final int goalsScored;
  final int goalsConceded;
  final int? score;
  final int? subscore;
  final int elo;
  final int? globalElo;
  final Team? team;

  Participant({
    required this.id,
    required this.username,
    this.avatar,
    this.countryId,
    this.console,
    required this.flags,
    this.teamId,
    required this.wins,
    required this.losses,
    required this.ties,
    required this.drops,
    required this.matches,
    required this.goalsScored,
    required this.goalsConceded,
    this.score,
    this.subscore,
    required this.elo,
     this.globalElo,
    this.team,
  });
  factory Participant.fromJson(Map<String, dynamic> json) => _$ParticipantFromJson(json);
}

@freezed
class TournamentParticipant with _$TournamentParticipant {
  // @Implements<Participant>()
  const factory TournamentParticipant({
    required int id,
    required String username,
    String? avatar,
    int? countryId,
    Console? console,
    required int flags,
    int? teamId,
    required int wins,
    required int losses,
    required int ties,
    required int drops,
    required int matches,
    required int goalsScored,
    required int goalsConceded,
    int? score,
    int? subscore,
    required int elo,
     int? globalElo,
    Team? team,
    required int rank,
    required String gamerTag,
  }) = _TournamentParticipant;

  const TournamentParticipant._();

  factory TournamentParticipant.fromJson(Map<String, dynamic> json) => _$TournamentParticipantFromJson(json);

  /// The percentage between wins/ (wins+losses).
  /// Its the same value as displayed in the web
  double get winRatio => matches > 0 ? wins / matches : 0;
}

List<Team> teamsFromJson(List<dynamic> str) =>
    List<Team>.from(str.map<Team>((dynamic x) => Team.fromJson(x as Map<String, dynamic>)));

@freezed
class Team with _$Team {
  const factory Team({
    required int id,
    required String name,
    String? logo,
  }) = _Team;

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);
}

extension SortParticipantsX on List<Participant> {
  /// Sorts participants according to a ranking table
  void sortRanking() {
    sort((a, b) {
      if ((a.score ?? 0) != (b.score ?? 0)) {
        return (b.score ?? 0) - (a.score ?? 0);
      }

      if ((a.subscore ?? 0) != (b.subscore ?? 0)) {
        return (b.subscore ?? 0) - (a.subscore ?? 0);
      }

      final aGoalDiff = a.goalsScored - a.goalsConceded;
      final bGoalDiff = b.goalsScored - b.goalsConceded;

      if (aGoalDiff != bGoalDiff) {
        return bGoalDiff - aGoalDiff;
      }

      if (a.goalsScored != b.goalsScored) {
        return b.goalsScored - a.goalsScored;
      }

      if (a.wins != b.wins) {
        return b.wins - a.wins;
      }

      return b.matches - a.matches;
    });
  }
}
