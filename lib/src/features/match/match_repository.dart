import 'package:fifa/r.dart';
import 'package:fifa/src/common/domain/tournament/tournament.dart';
import 'package:fifa/src/common/domain/user/user.dart';
import 'package:fifa/src/common/exceptions.dart';
import 'package:fifa/src/common/data/network_service.dart';
import 'package:fifa/src/features/match/model/match.dart';
import 'package:fpdart/fpdart.dart';

class MatchRepository {
  final AuthenticatedNetworkService _client;

  MatchRepository({required AuthenticatedNetworkService client}) : _client = client;

  /// An array of matches ordered by newest to oldest
  ///   - [limit] (u8)
  ///      - Limit of fetched matches
  /// 	- [orgId] (optional, u32)
  ///      - A filter for the match's club.
  /// 	- [userId] (optional, u32)
  ///      - A filter for the match's user.
  ///  	- [featured] (string)
  ///      - If "1", only show matches from tournaments that are featured.

  Future<Either<NetworkException, List<Match>>> listMatches({
    int limit = 10,
    String? featured,
    String? query,
    int? orgId,
    int? userId,
    int? tournamentId,
  }) async {
    final data = {
      if (orgId != null) 'org_id': orgId,
      if (userId != null) 'user_id': userId,
      if (query != null) 'query': query,
      if (tournamentId != null) 'tournament_id': tournamentId,
      'limit': limit,
      'featured': featured ?? '0',
    };

    final response = await _client.get(R.apiEndPoints.latestMatches, query: data);

    return response.map<List<Match>>((dynamic a) => matchesFromJson(a as List<dynamic>));
  }

  /// An array of matches ordered by newest to oldest
  ///
  ///   - [orgId] (u32, optional)
  ///   - [query] (string, must be greater than 2 characters and less than 100)
  /// 	- [limit] (u64, 1 to 30, default 5)
  ///   - [insertedOffset] (u64)
  /// 			Doesn't include matches that were inserted before time stamp.
  ///

  Future<Either<NetworkException, List<Match>>> searchMatches({
    int limit = 10,
    int? orgId,
    String? query,
    int? insertedOffset,
  }) async {
    final data = {
      if (orgId != null) 'org_id': orgId,
      if (query != null) 'query': query,
      if (insertedOffset != null) 'inserted_offset': insertedOffset,
      'limit': limit,
    };

    final response = await _client.get(R.apiEndPoints.matchesSearch, query: data);

    return response.map<List<Match>>((dynamic a) => matchesFromJson(a as List<dynamic>));
  }

  /// An array of manually generated latest matches
  ///   - [limit] (u64)
  ///      - Limit of fetched matches
  ///   - [orgId] (u32)
  ///      - A required filter for the match's club.

  Future<Either<NetworkException, List<LatestMatch>>> listOrgMatches({
    int limit = 10,
    required int orgId,
  }) async {
    final data = {
      'org_id': orgId,
      'limit': limit,
    };

    final response = await _client.get(R.apiEndPoints.latestOrgMatches, query: data);

    return response.map<List<LatestMatch>>((dynamic a) => latestOrgMatchesFromJson(a as List<dynamic>));
  }

  /// The featured next match
  ///   - [orgId] (u32)
  ///      - the Id of the featured next match's club.
  Future<Either<NetworkException, NextMatch>> getFeaturedNextMatch({
    required int orgId,
  }) async {
    final data = {
      'org_id': orgId,
    };

    final response = await _client.get(R.apiEndPoints.featuredNextMatch, query: data);

    return response.map<NextMatch>((dynamic a) => NextMatch.fromJson(a as Map<String, dynamic>));
  }

  Future<Either<NetworkException, MatchCheckInInfo>> get({
    required int matchId,
  }) async {
    final data = {
      'id': matchId,
      '_u': _client.userId,
      '_t': _client.token,
      '_': DateTime.now().millisecondsSinceEpoch,
    };

    final response = await _client.get(R.apiEndPoints.getMatch, query: data);

    return response.map<MatchCheckInInfo>((dynamic a) => MatchCheckInInfo.fromJson(a as Map<String, dynamic>));
  }
}

class FakeMatchRepository extends MatchRepository {
  @Deprecated('Do not use in production')
  FakeMatchRepository({required AuthenticatedNetworkService client}) : super(client: client);
  @override
  Future<Either<NetworkException, MatchCheckInInfo>> get({
    required int matchId,
  }) async {
    print('returning mock match');
    return Either.right(
      MatchCheckInInfo(
          conflicted: 45,
          confirmedUserId: null,
          id: 786,
          tournamentId: 87,
          console: 1,
          flags: 777,
          inserted: DateTime.now(),
          user1: MatchUser(username: 'mockusername', flags: 777, elo: 999, id: 67),
          user2: MatchUser(username: 'mockusername2', flags: 777, elo: 999, id: 90),
          tournament: TournamentRef(id: 777, name: 'mockname', flags: 777)),
    );
  }
}
