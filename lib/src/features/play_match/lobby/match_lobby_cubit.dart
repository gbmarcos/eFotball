import 'package:async_data_bloc/async_data_bloc.dart';
import 'package:fifa/src/common/domain/user/user.dart';
import 'package:fifa/src/common/utils.dart';
import 'package:fifa/src/features/match/match_repository.dart';
import 'package:fifa/src/features/match/model/match.dart';
import 'package:fifa/src/features/play_match/match/check_in_repository.dart';
import 'package:fifa/src/features/play_match/match/exceptions.dart';
import 'package:fifa/src/features/tournaments/tournament_details/models/participant.dart';
import 'package:fifa/src/features/tournaments/tournament_details/models/tournament.dart';
import 'package:fifa/src/features/tournaments/tournament_repository.dart';

import 'package:fpdart/fpdart.dart' show Option, Some, None;

///Data needed in order to display the MatchLobbyPage
class LobbyParameters {
  final DateTime walkoverTime;
  final int lobbyId;
  final int tournamentId;
  final User currentUser;

  LobbyParameters(
      {required this.currentUser, required this.walkoverTime, required this.lobbyId, required this.tournamentId});

  factory LobbyParameters.fromLobbyCheckIn(LobbyCheckIn lobbyCheckIn, User currentUser) {
    return LobbyParameters(
        walkoverTime: lobbyCheckIn.walkoverDateTime,
        lobbyId: lobbyCheckIn.id,
        tournamentId: lobbyCheckIn.tournament.id,
        currentUser: currentUser);
  }

  ///If there is time left to the  [walkoverTime] returns a Some(),
  ///else if there is not time left returns None
  Option<Duration> get walkoverTimeLeft {
    final timeLeft = walkoverTime.difference(DateTime.now());
    if (timeLeft.isNegative) return const None();
    return Some(timeLeft);
  }
}

class MatchLobbyData {
  final MatchCheckInInfo matchInfo;
  final TournamentParticipant user1;
  final TournamentParticipant user2;

  MatchLobbyData({required this.matchInfo, required this.user1, required this.user2});

  @override
  String toString() {
    return 'MatchLobbyData{matchInfo: $matchInfo, user1: $user1, user2: $user2}';
  }
}

class MatchLobbyCubit {
  //Parameters
  final LobbyParameters lobbyParameters;

  //Dependencies
  final MatchRepository _matchRepository;
  final CheckInRepository _checkInRepository;
  final TournamentRepository _tournamentRepository;

  // Output
  late final AsyncCubit<TournamentLobby> tournamentLobby;
  late final AsyncCubit<MatchCheckInInfo> matchInfo;
  late final AsyncCubit<TournamentParticipant> user1;
  late final AsyncCubit<TournamentParticipant> user2;

  MatchLobbyCubit({
    required this.lobbyParameters,
    required CheckInRepository checkInRepository,
    required MatchRepository matchRepository,
    required TournamentRepository tournamentRepository,
  })  : _tournamentRepository = tournamentRepository,
        _checkInRepository = checkInRepository,
        _matchRepository = matchRepository {
    tournamentLobby = AsyncCubit.stub();
    user1 = AsyncCubit.stub();
    user2 = AsyncCubit.stub();
    matchInfo = AsyncCubit.stub();
    _initialize();
  }

  Future<void> _initialize() async {
    final tournamentLobbyFuture = await _checkInRepository.get(
      lobbyId: lobbyParameters.lobbyId,
    );

    tournamentLobbyFuture.match((l) {
      tournamentLobby.changeFuture = () => Future.error(l);
      user1.changeFuture = () => Future.error(l);
      user2.changeFuture = () => Future.error(l);
      matchInfo.changeFuture = () => Future.error(l);
    }, (tournament) {
      tournamentLobby.changeFuture = () => Future.value(tournament);
      user1.changeFuture = () async {
        if (tournament.user1.id != null) {
          return _tournamentRepository
              .getTournamentParticipant(tournamentId: lobbyParameters.tournamentId, userId: tournament.user1.id!)
              .then(getOrThrow);
        } else {
          return Future.error(TournamentHasNoId.match(incompleteLobby: tournament));
        }
      };
      user2.changeFuture = () async {
        if (tournament.user2.id != null) {
          return _tournamentRepository
              .getTournamentParticipant(tournamentId: lobbyParameters.tournamentId, userId: tournament.user2.id!)
              .then(getOrThrow);
        } else {
          return Future.error(TournamentHasNoId.match(incompleteLobby: tournament));
        }
      };
      matchInfo.changeFuture = () async {
        if (tournament.matchId != null) {
          return _matchRepository.get(matchId: tournament.matchId!).then(getOrThrow);
        } else {
          return Future.error(TournamentHasNoId.match(incompleteLobby: tournament));
        }
      };
    });
  }

  bool get showCheckInButton {
    final userId = lobbyParameters.currentUser.id;
    final lobby = tournamentLobby.state.valueOrNull;
    if (lobby != null) {
      if (lobby.user1.id == userId) return lobby.user1CheckIn != null;
      if (lobby.user2.id == userId) return lobby.user2CheckIn != null;
    }
    return false;
  }

  ///Wether a Participant is checked in to a match
  bool? isParticipantCheckedIn(TournamentParticipant participant) {
    return isParticipantCheckInDate(participant) != null;
  }

  //This info is not available in the participant itself and we have to check the tournamentLobby info
  DateTime? isParticipantCheckInDate(TournamentParticipant participant) {
    final lobby = tournamentLobby.state.valueOrNull;
    if (lobby != null) {
      if (lobby.user1.id == participant.id) return lobby.user1CheckIn;
      if (lobby.user2.id == participant.id) return lobby.user2CheckIn;
    }
    return null;
  }

  MatchLobbyData get matchLobbyData {
    return MatchLobbyData(
      matchInfo: matchInfo.state.valueOrNull!,
      user1: user1.state.valueOrNull!,
      user2: user2.state.valueOrNull!,
    );
  }
}
