
import 'package:fifa/src/common/domain/user/user.dart';
import 'package:fifa/src/common/exceptions.dart';
import 'package:fifa/src/common/data/network_service.dart';
import 'package:fifa/src/features/club/model/club.dart';
import 'package:fifa/src/features/club/model/org_featured_player.dart';
import 'package:fifa/src/features/club/model/ranking.dart';
import 'package:fifa/src/features/club/model/social_media.dart';
import 'package:fpdart/fpdart.dart';

class ClubRepository {
  final NetworkService _client;

  ClubRepository({required NetworkService client}) : _client = client;

  /// An array of clubs.
  /// 	- [featured] (string)
  /// 		- Set this to "1" to only get a list of featured orgs/clubs
  ///   - [query] (string)
  ///     - must be greater than 2 characters and less than 100
  ///   - [limit] (u64)
  ///     - 1 to 30, default 5
  ///   - [idOffset] (u64)

  Future<Either<NetworkException, List<Club>>> listClubs({
    String featured = '1',
    String? query,
    int limit = 10,
    int? idOffset,
  }) async {
    final data = {
      'featured': featured,
      'limit': limit,
      if (query != null) 'query': query,
      if (idOffset != null) 'id_offset': idOffset,
    };

    final response = await _client.get('/orgs/list', query: data);

    return response.map<List<Club>>((dynamic a) => clubsFromJson(a as List<dynamic>));
  }

  Future<Either<NetworkException, Club>> get({
    required String id,
  }) async {
    final data = {
      'id': id,
    };

    final response = await _client.get('/org/get', query: data);

    return response.map((dynamic a) => Club.fromJson(a as Map<String, dynamic>));
  }

  /// An array of social media publications
  ///   [orgId] (int) - The org ID to get the social media posts from.
  ///   [limit] (int) - The amount of [SocialMedia] to retrieve
  Future<Either<NetworkException, List<SocialMedia>?>> getSocialMedia({required int orgId, int limit = 10}) async {
    final data = {'org_id': orgId, 'limit': limit};

    final response = await _client.get('/org/get_social_media', query: data);

    return response.map<List<SocialMedia>>((dynamic a) => socialMediaFromJson(a as List<dynamic>));
  }

  /// An array of org featured players.
  ///	- [orgId] (int)
  ///
  Future<Either<NetworkException, List<OrgFeaturedPlayer>>> getFeaturedPlayers({required int orgId}) async {
    final data = {'org_id': orgId};

    final response = await _client.get('/org/featured_players/list', query: data);

    return response.map<List<OrgFeaturedPlayer>>((dynamic a) => orgFeaturedPlayerFromJson(a as List<dynamic>));
  }

  /// An array of `UserRanked` filterable by console, either from PES or FIFA game
  /// 	[orgId] (int) - The identifier of the club
  /// 	[limit] (int) - Tha amount of entries to retrieve
  ///	  [eloOffset0Xbox] (u64) - Returns all of the entries below this Elo value for Xbox
  /// 	[idOffset0Xbox] (u32) - Returns all the entries at or below the Elo offset and below this ID for Xbox
  /// 	[eloOffset1Playstation] (u64) - Returns all of the entries below this Elo value for Playstation
  /// 	[idOffset1Playstation] (u32) - Returns all the entries at or below the Elo offset and below this ID for Playstation
  Future<Either<NetworkException, Ranking>> getRankings({
    required int orgId,
    required Game game,
    int limit = 10,
    int? eloOffset0Xbox,
    int? eloOffset1Playstation,
    int? idOffset0Xbox,
    int? idOffset1Playstation,
  }) async {
    final data = {
      'org_id': orgId,
      'limit': limit,
      if (eloOffset0Xbox != null) 'elo_offset_0': eloOffset0Xbox,
      if (eloOffset1Playstation != null) 'elo_offset_1': eloOffset1Playstation,
      if (idOffset0Xbox != null) 'id_offset_0': idOffset0Xbox,
      if (idOffset1Playstation != null) 'id_offset_1': idOffset1Playstation,
    };
    late final String gameType;
    //Switch instead of if/else to make the comparison exhaustive in case of future enum values
    switch (game) {
      case Game.fifa21:
        gameType = 'fifa';
        break;
      case Game.pes20:
        gameType = 'pes';
        break;
    }

    final response = await _client.get('/org/ranking/$gameType', query: data);

    return response.map((dynamic a) => Ranking.fromJson(a as List<dynamic>));
  }

  Future<Either<NetworkException, GameRanking?>> getGameRanking(Club org) async {
    final fifaPS = org.hasFlag(ClubFlags.rankFifaPS);
    final fifaXbx = org.hasFlag(ClubFlags.rankFifaXbox);

    final pesPS = org.hasFlag(ClubFlags.rankPesPS);
    final pesXbx = org.hasFlag(ClubFlags.rankPesXbox);

    final hasFifaRank = fifaPS || fifaXbx;
    final hasPesRank = pesPS || pesXbx;

    if (!hasPesRank && !hasFifaRank) {
      return const Right(null);
    } else {
      final fifaRanking = hasFifaRank ? await getRankings(orgId: org.id, game: Game.fifa21) : null;
      final pesRanking = hasPesRank ? await getRankings(orgId: org.id, game: Game.pes20) : null;

      if (fifaRanking != null && fifaRanking.isLeft() || pesRanking != null && pesRanking.isLeft()) {
        return const Left(NetworkException.noDataException());
      }
      return Right(GameRanking(rankings: <Ranking?>[
        fifaRanking?.getRight().toNullable(),
        pesRanking?.getRight().toNullable(),
      ]));
    }
  }
}
