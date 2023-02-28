import 'package:fifa/r.dart';
import 'package:fifa/src/common/data/network_service.dart';
import 'package:fifa/src/common/exceptions.dart';
import 'package:fifa/src/features/tournaments/model/tournament.dart';
import 'package:fifa/src/features/tournaments/tournament_details/models/bracket.dart';
import 'package:fifa/src/features/tournaments/tournament_details/models/participant.dart';
import 'package:fifa/src/features/tournaments/tournament_details/models/tournament.dart';
import 'package:fpdart/fpdart.dart';

class TournamentRepository {
  final AuthenticatedNetworkService _client;

  TournamentRepository({required AuthenticatedNetworkService client}) : _client = client;

  /// An array of tournaments ordered by upcoming, active, then completed.
  ///	  - [limit] (int)
  /// 	- [orgId] (int)
  /// 	- [featured] (string)
  /// 		- Filter for tournaments that are featured on the front page.
  /// 	- [orgFeatured] (string)
  /// 		- Filter for tournaments that are featured on the org's (org_id) front page.
  Future<Either<NetworkException, List<Tournament>>> listTournaments({
    int? limit,
    int? orgId,
    String? featured,
    String? orgFeatured,
    String? upcoming,
    String? live,
    String? finished,
    String? query,
  }) async {
    final data = <String, dynamic>{
      if (limit != null) 'limit': limit,
      if (orgId != null) 'org_id': orgId,
      if (featured != null) 'featured': featured,
      if (orgFeatured != null) 'orf_featured': orgFeatured,
      if (upcoming != null) 'upcoming': upcoming,
      if (live != null) 'live': live,
      if (finished != null) 'finished': finished,
      if (query != null) 'query': query,
    };

    final response = await _client.get('/tournaments/list', query: data);

    return response.map<List<Tournament>>((dynamic a) => tournamentFromJson(a as List<dynamic>));
  }

  /// Get the tournament with the supplied ID
  ///   - [id] (u32)
  Future<Either<NetworkException, TournamentEntry>> getTournament({
    required int id,
  }) async {
    final data = <String, dynamic>{
      'id': id,
    };

    final response = await _client.get(R.apiEndPoints.singleTournament, query: data);

    return response.map<TournamentEntry>(
      (dynamic a) => TournamentEntry.fromJson(a as Map<String, dynamic>),
    );
  }

  /// An array of tournament participants.
  ///   - [tournamentId] (u32)
  Future<Either<NetworkException, List<Participant>>> getTournamentParticipants({
    required int tournamentId,
  }) async {
    final data = <String, dynamic>{
      'tournament_id': tournamentId,
    };

    final response = await _client.get(R.apiEndPoints.tournamentParticipants, query: data);

    return response.map<List<Participant>>((dynamic a) => tournamentParticipantsFromJson(a as List<dynamic>));
  }

  /// A single tournament participant
  ///   - [tournamentId] (u32)
  Future<Either<NetworkException, TournamentParticipant>> getTournamentParticipant({
    required int tournamentId,
    required int userId,
  }) async {
    print('getting real user 1');
    final data = <String, dynamic>{
      // '_': DateTime.now().millisecondsSinceEpoch,
      'tournament_id': tournamentId,
      'user_id': userId,
    };

    final response = await _client.get(R.apiEndPoints.tournamentParticipant, query: data);

    return response
        .map<TournamentParticipant>((dynamic a) => TournamentParticipant.fromJson(a as Map<String, dynamic>));
  }

  /// An array of tournament brackets.
  ///   - [tournamentId] (u32)
  Future<Either<NetworkException, List<TournamentBracket>>> getTournamentBrackets({
    required int tournamentId,
  }) async {
    final data = <String, dynamic>{
      'tournament_id': tournamentId,
    };

    final response = await _client.get(R.apiEndPoints.tournamentBrackets, query: data);

    return response.map<List<TournamentBracket>>((dynamic a) => tournamentBracketsFromJson(a as List<dynamic>));
  }

  Future<Either<NetworkException, void>> tournamentSignUp({
    required int tournamentId,
    int? teamId,
  }) async {
    final data = <String, dynamic>{
      'tournament_id': tournamentId,
      '_u': _client.userId,
      '_t': _client.token,
      if (teamId != null) 'team_id': teamId,
    };

    final response = await _client.postForm(R.apiEndPoints.tournamentSignUp, body: data);

    return response.map((dynamic _) {});
  }

  Future<Either<NetworkException, void>> tournamentSignUpCancel({
    required int tournamentId,
  }) async {
    final data = <String, dynamic>{
      'tournament_id': tournamentId,
      '_u': _client.userId,
      '_t': _client.token,
    };

    final response = await _client.postForm(R.apiEndPoints.tournamentSignUpCancel, body: data);

    return response.map((dynamic _) {});
  }

  Future<Either<NetworkException, List<Team>>> listLeagueTeams({
    required int leagueId,
  }) async {
    final data = <String, dynamic>{
      'league_id': leagueId,
    };

    final response = await _client.get(R.apiEndPoints.leagueTeamsList, query: data);

    return response.map<List<Team>>((dynamic a) => teamsFromJson(a as List<dynamic>));
  }
}

const singleTournamentMock = '''
{
   "id": 201,
   "name": "Test 2 Juli",
   "logo": "RFickFz6EnBOtg.png",
   "banner": null,
   "flags": 98
}
''';

class FakeTournamentRepository extends TournamentRepository {
  @Deprecated('Do not use in production')
  FakeTournamentRepository({required AuthenticatedNetworkService client}) : super(client: client);
  @override
  Future<Either<NetworkException, TournamentParticipant>> getTournamentParticipant({
    required int tournamentId,
    required int userId,
  }) async {
    print('returning mock tournament participant');
    return Either.right(const TournamentParticipant(
      id: 67,
      username: 'mockUser',
      flags: 777,
      wins: 2,
      losses: 1,
      ties: 0,
      drops: 0,
      matches: 3,
      goalsScored: 5,
      goalsConceded: 3,
      elo: 999,
      globalElo: 1011,
      rank: 24,
      gamerTag: 'gamerTag',
    ));
  }
}
