import 'package:fifa/r.dart';
import 'package:fifa/src/authentication/authentication_repository.dart';
import 'package:fifa/src/common/data/converters.dart';
import 'package:fifa/src/common/data/network_service.dart';
import 'package:fifa/src/common/domain/user/user.dart';
import 'package:fifa/src/common/exceptions.dart';
import 'package:fifa/src/features/tournaments/model/tournament.dart';
import 'package:fifa/src/features/tournaments/tournament_details/models/tournament.dart';
import 'package:fpdart/fpdart.dart';

class CheckInRepository {
  final AuthenticatedNetworkService _client;

  CheckInRepository({required AuthenticatedNetworkService client}) : _client = client;

  Future<Either<NetworkException, DateTime>> checkIn({required int lobbyId}) async {
    final data = {
      'lobby_id': lobbyId,
      '_u': _client.userId,
      '_t': _client.token,
    };
    final response = await _client.postForm('/tournament/lobby/check_in', body: data);

    return response.map<DateTime>((dynamic a) => const TimestampConverter().fromJson(a as int));
  }

  Future<Either<NetworkException, dynamic>> leave({required int lobbyId}) async {
    final data = {
      'lobby_id': lobbyId,
      '_u': _client.userId,
      '_t': _client.token,
    };
    final response = await _client.postForm('/tournament/lobby/leave', body: data);

    return response;
  }

  Future<Either<NetworkException, TournamentLobby>> get({required int lobbyId}) async {
    final data = {'id': lobbyId, '_u': _client.userId, '_t': _client.token, '_': DateTime.now().millisecondsSinceEpoch};
    final response = await _client.get('/tournament/lobby/get', query: data);

    return response.map<TournamentLobby>((dynamic a) => TournamentLobby.fromJson(a as Map<String, dynamic>));
  }

  Future<Either<NetworkException, dynamic>> submitScore(
      {required int matchId, required int score1, required int score2}) async {
    final data = {
      'match_id': matchId,
      'score1': score1,
      'score2': score2,
      '_u': _client.userId,
      '_t': _client.token,
    };
    final response = await _client.postForm('/tournament/matchmaking/scores/submit', body: data);

    return response;
  }

  Future<Either<NetworkException, dynamic>> confirmScore({required int matchId}) async {
    final data = {
      'match_id': matchId,
      '_u': _client.userId,
      '_t': _client.token,
    };
    final response = await _client.postForm('/tournament/matchmaking/scores/confirm', body: data);

    return response;
  }

  Future<Either<NetworkException, SignupStatus>> tournamentStatus({required int tournamentId}) async {
    final data = {
      'tournament_id': tournamentId,
      '_u': _client.userId,
      '_t': _client.token,
    };
    final response = await _client.get('/tournament/signup/status', query: data);

    return response.map<SignupStatus>((dynamic a) => SignupStatus.values[(a as int) - 1]);
  }

  Future<Either<NetworkException, SignupStatus>> collectionStatus({required int collectionId}) async {
    final data = {
      'collection_id': collectionId,
      '_u': _client.userId,
      '_t': _client.token,
    };
    final response = await _client.get('/tournament/collection/signup/status', query: data);

    return response.map<SignupStatus>((dynamic a) => SignupStatus.values[(a as int) - 1]);
  }

  Future<Either<NetworkException, int?>> lobbyId({required int tournamentId}) async {
    final data = {
      'tournament_id': tournamentId,
      '_u': _client.userId,
      '_t': _client.token,
    };
    final response = await _client.get('/tournament/lobby/get_current_id', query: data);

    return response.map((dynamic a) => a as int?);
  }

  Future<Either<NetworkException, LobbyCheckIn?>> checkInLobby() async {
    final data = {
      '_u': _client.userId,
      '_t': _client.token,
    };
    final response = await _client.postForm('/check_in/get', body: data);

    return response.map<LobbyCheckIn?>((dynamic a) {
      if (a is Map<String, dynamic>) return LobbyCheckIn.fromJson(a);
      return null;
    });
  }

  Future<Either<NetworkException, User>> getExtendedUserData() async {
    final data = {
      '_u': _client.userId,
      '_t': _client.token,
    };
    final response = await _client.get('/user/get_extended', query: data);

    return response.map<User>((dynamic a) => User.fromJson(a as Map<String, dynamic>));
  }

  Future<Either<NetworkException, void>> matchmakingEnter({required int tournamentId}) async {
    final data = {
      '_': DateTime.now().millisecondsSinceEpoch,
      '_u': _client.userId,
      '_t': _client.token,
      'id': tournamentId,
    };

    final response = await _client.postForm(R.apiEndPoints.matchmakingEnter, body: data);

    return response.map<void>((dynamic a) {});
  }

  Future<Either<NetworkException, void>> matchmakingKeepAlive({required int tournamentId}) async {
    final data = {
      '_': DateTime.now().millisecondsSinceEpoch,
      '_u': _client.userId,
      '_t': _client.token,
      'id': tournamentId,
    };

    final response = await _client.get(R.apiEndPoints.matchmakingKeepAlive, query: data);

    return response.map<void>((dynamic a) {});
  }

  Future<Either<NetworkException, int>> matchmakingQueueCount({
    required int tournamentId,
    required int poolCount,
  }) async {
    final data = {
      '_': DateTime.now().millisecondsSinceEpoch,
      '_u': _client.userId,
      '_t': _client.token,
      'tournament_id': tournamentId,
      '_poll': poolCount,
    };
    final response = await _client.get(R.apiEndPoints.matchmakingQueueCount, query: data);

    return response.map<int>((dynamic a) => a is int ? a : 0);
  }

  Future<Either<NetworkException, void>> matchmakingLeave({required int tournamentId}) async {
    final data = {
      '_': DateTime.now().millisecondsSinceEpoch,
      '_u': _client.userId,
      '_t': _client.token,
      'id': tournamentId,
    };

    final response = await _client.postForm(R.apiEndPoints.matchmakingLeave, body: data);

    return response.map<void>((dynamic a) {});
  }
}

class FakeCheckInRepository extends CheckInRepository {
  @Deprecated('Do not use in production')
  FakeCheckInRepository({required AuthenticatedNetworkService client}) : super(client: client);

  @override
  Future<Either<NetworkException, TournamentLobby>> get({required int lobbyId}) async {
    return Either.right(
      TournamentLobby(
        id: lobbyId,
        tournamentId: 999,
        walkoverTime: DateTime.now().add(const Duration(minutes: 5)),
        matchId: 845,
        bracketId: 42,
        user1: UserBasicInfo(username: 'mockUser1', flags: 777, id: 67),
        user2: UserBasicInfo(username: 'mockUser2', flags: 777, id: 98),
        user1CheckIn: DateTime.now(),
        user2CheckIn: DateTime.now(),
      ),
    );
  }

  @override
  Future<Either<NetworkException, DateTime>> checkIn({required int lobbyId}) async {
    return Either.right(DateTime.now());
  }

  @override
  Future<Either<NetworkException, User>> getExtendedUserData() async {
    return Either.right(mockUser);
  }
}
