// ignore_for_file: annotate_overrides

import 'package:fifa/src/common/data/converters.dart';
import 'package:fifa/src/common/domain/org/org.dart';
import 'package:fifa/src/common/domain/tournament/tournament.dart';
import 'package:fifa/src/common/domain/user/user.dart';
import 'package:fifa/src/features/tournaments/model/tournament.dart';
import 'package:fifa/src/features/tournaments/tournament_details/models/bracket.dart';
import 'package:fifa/src/features/tournaments/tournament_details/models/participant.dart';
import 'package:fifa/src/features/tournaments/tournament_details/models/tournament.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'tournament_collection.freezed.dart';

part 'tournament_collection.g.dart';

List<TournamentCollection> tournamentCollectionFromJson(List<dynamic> str) => List<TournamentCollection>.from(
    str.map<TournamentCollection>((dynamic x) => TournamentCollection.fromJson(x as Map<String, dynamic>)));

abstract class TournamentDetails implements TournamentInterface {
  final int? internalFlags;
  final DateTime? endsAt;
  final GameId gameId;
  final String gameSettings;
  final String? description;
  final OrgRef? org;
  final League? league;
  final List<TournamentPrize>? prizes;

  TournamentDetails(
      {this.internalFlags,
      this.endsAt,
      required this.gameId,
      required this.gameSettings,
      this.description,
      this.org,
      required this.league,
      this.prizes});
}

@JsonSerializable()
class TournamentCollection implements TournamentDetails {
  final int id;
  final String name;
  final String? logo;
  final String? banner;
  final int flags;
  final int? internalFlags;
  @TimestampConverter()
  final DateTime startsAt;
  @NullableTimestampConverter()
  final DateTime? endsAt;
  final int participants;
  final int? slots;
  final GameId gameId;
  final String gameSettings;
  final String? description;
  final OrgRef? org;
  final League? league;
  final List<TournamentPrize>? prizes;
  final List<TournamentCollectionStageEntry>? stages;

  TournamentCollection({
    required this.id,
    required this.name,
    this.logo,
    this.banner,
    required this.flags,
     this.internalFlags,
    required this.startsAt,
    this.endsAt,
    required this.participants,
    this.slots,
    required this.gameId,
    required this.gameSettings,
    this.description,
    this.org,
    this.stages,
    this.league,
    this.prizes,
  });
  factory TournamentCollection.fromJson(Map<String, dynamic> json) => _$TournamentCollectionFromJson(
      json..update('game_settings', (dynamic _) => 'MANUALLY REMOVED, SEE fromJson implementation'));

  TournamentFormat? get tournamentFormat => null;

  bool get isCollection => tournamentFormat == null;
}

@freezed
class TournamentCollectionStageEntry with _$TournamentCollectionStageEntry {
  @Implements<TournamentRef>()
  const factory TournamentCollectionStageEntry({
    required int id,
    required String name,
    String? logo,
    String? banner,
    required int flags,

    ///	* The stage of the tournament. Tournaments with stage 0 are the tournaments that are played first.
    required int stage,
    required int format,
    required int slots,
    required int participants,

    ///	* The number of participants that will go to the next stage of the tournament collection if they win.
    int? winners,

    ///	* The ID of the stage in tournament_collection_stages. Only used in admin tournament collection editor.
    int? winningStage,
    int? internalFlags,

    ///		* The ID of the tournament in this collection that winners will go to.
    int? winningStageTournamentID,
  }) = _TournamentCollectionStageEntry;

  const TournamentCollectionStageEntry._();

  factory TournamentCollectionStageEntry.fromJson(Map<String, dynamic> json) =>
      _$TournamentCollectionStageEntryFromJson(json);
}

typedef TournamentId = int;

List<TournamentCollectionParticipant> tournamentCollectionParticipantsFromJson(List<dynamic> str) =>
    List<TournamentCollectionParticipant>.from(str.map<TournamentCollectionParticipant>(
        (dynamic x) => TournamentCollectionParticipant.fromJson(x as Map<String, dynamic>)));

@JsonSerializable()
class TournamentCollectionParticipant implements Participant, ParticipantScoreFields {
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
  final List<MatchHistory>? matchHistory;
  final Map<TournamentId /*int*/, ParticipantScoreFields> tournamentStats;

  TournamentCollectionParticipant({
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
    this.matchHistory,
    required this.tournamentStats,
  });

  factory TournamentCollectionParticipant.fromJson(Map<String, dynamic> json) =>
      _$TournamentCollectionParticipantFromJson(json);

  /// The percentage between wins/ (wins+losses).
  /// Its the same value as displayed in the web
  double get winRatio => matches > 0 ? wins / matches : 0;
}

@freezed
class MatchHistory with _$MatchHistory {
  const factory MatchHistory(
      {required int id,
      required int tournamentId,
      required int user1Id,
      required int user2Id,
      required String opponentName,
      int? score1,
      int? score2,
      required int flags}) = _MatchHistory;

  const MatchHistory._();

  factory MatchHistory.fromJson(Map<String, dynamic> json) => _$MatchHistoryFromJson(json);
}

@JsonSerializable()
class ParticipantScoreFields {
  final int drops;
  final int elo;
  final int? globalElo;
  final int goalsConceded;
  final int goalsScored;
  final int losses;
  final int matches;
  final int? score;
  final int? subscore;
  final int? teamId;
  final int ties;
  final int wins;

  ParticipantScoreFields(
      {required this.drops,
      required this.elo,
       this.globalElo,
      required this.goalsConceded,
      required this.goalsScored,
      required this.losses,
      required this.matches,
      this.score,
      this.subscore,
      this.teamId,
      required this.ties,
      required this.wins});
  factory ParticipantScoreFields.fromJson(Map<String, dynamic> json) => _$ParticipantScoreFieldsFromJson(json);
}

typedef TournamentCollectionBracketResponse = Map<TournamentId, List<TournamentBracket>>;

TournamentCollectionBracketResponse tournamentCollectionBracketResponseFromJson(dynamic json) =>
    (json as Map<String, dynamic>).map(
      (k, dynamic e) => MapEntry(int.parse(k), tournamentBracketsFromJson(e as List<dynamic>)),
    );
