
import 'package:fifa/src/features/tournaments/tournament_details/models/tournament.dart';

///Usually thrown from missing parameters of a  TournamentLobby [incompleteLobby]
class TournamentHasNoId implements Exception {
  final String message;

  final TournamentLobby? incompleteLobby;

  TournamentHasNoId({
    required this.message,
    this.incompleteLobby,
  });

  TournamentHasNoId.match(
      {this.message = "Tournament lobby's  from `/tournament/lobby/get` don't has the `match_id` attribute",
      this.incompleteLobby});

  TournamentHasNoId.user(
      {this.message = "Tournament lobby's  from `/tournament/lobby/get` don't has the `userX` attribute",
      this.incompleteLobby});

  @override
  String toString() {
    return 'TournamentHasNoMatchId{message: $message, errorResponse: $incompleteLobby}';
  }
}
