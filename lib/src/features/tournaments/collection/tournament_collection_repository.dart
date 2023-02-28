import 'package:fifa/src/common/data/network_service.dart';
import 'package:fifa/src/common/exceptions.dart';
import 'package:fifa/src/features/tournaments/collection/model/tournament_collection.dart';
import 'package:fifa/src/features/tournaments/model/tournament.dart';
import 'package:fifa/src/features/tournaments/tournament_details/models/participant.dart';
import 'package:fpdart/fpdart.dart';

class TournamentCollectionRepository {
  final AuthenticatedNetworkService _client;

  TournamentCollectionRepository({required AuthenticatedNetworkService client}) : _client = client;

  ///(GET) To get individual tournament collections
  Future<Either<NetworkException, TournamentCollection>> get({
    required int id,
  }) async {
    final data = <String, dynamic>{'id': id};

    final response = await _client.get('/tournament/collection/get', query: data);

    return response.map<TournamentCollection>(
      (dynamic a) => TournamentCollection.fromJson(a as Map<String, dynamic>),
    );
  }

  ///(GET) To get an individual tournament collection participant:
  Future<Either<NetworkException, TournamentParticipant>> participant({
    required int collectionId,
    required int userId,
  }) async {
    final data = <String, dynamic>{
      // '_': DateTime.now().millisecondsSinceEpoch,
      'collection_id': collectionId,
      'user_id': userId,
    };

    final response = await _client.get('/tournament/collection/participant/get', query: data);

    return response
        .map<TournamentParticipant>((dynamic a) => TournamentParticipant.fromJson(a as Map<String, dynamic>));
  }

  Future<Either<NetworkException, List<TournamentCollectionParticipant>>> participantsList({
    required int collectionId,
  }) async {
    final data = <String, dynamic>{
      'collection_id': collectionId,
    };

    final response = await _client.get('/tournament/collection/participants/get', query: data);

    return response.map<List<TournamentCollectionParticipant>>(
        (dynamic a) => tournamentCollectionParticipantsFromJson(a as List<dynamic>));
  }

  ///GET /tournaments/collections/list
  ///     - limit (u8)
  ///     - org_id (u32, optional)
  ///     - featured (string, "1" to set)
  ///     - org_featured (string, "1" to set)
  ///     - upcoming (string, "1" to set)
  ///     - live (string, "1" to set)
  ///     - finished (string, "1" to set)
  Future<Either<NetworkException, List<TournamentCollection>>> list({
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

    final response = await _client.get('/tournaments/collections/list', query: data);

    return response.map<List<TournamentCollection>>((dynamic a) => tournamentCollectionFromJson(a as List<dynamic>));
  }

  ///GET /tournament/collection/brackets/get
  ///     - collection_id (u32)
  Future<Either<NetworkException, TournamentCollectionBracketResponse>> brackets({
    required int collectionId,
  }) async {
    final data = <String, dynamic>{
      'collection_id': collectionId,
    };

    final response = await _client.get('/tournament/collection/brackets/get', query: data);

    return response.map(tournamentCollectionBracketResponseFromJson);
  }

  ///GET /tournament/collection/signup/status
  ///     - collection_id (u32)
  ///     - Requires user authentication.
  Future<Either<NetworkException, SignupStatus>> status({required int collectionId}) async {
    final data = {
      'collection_id': collectionId,
      '_u': _client.userId,
      '_t': _client.token,
    };
    final response = await _client.get('/tournament/collection/signup/status', query: data);

    return response.map<SignupStatus>((dynamic a) => SignupStatus.values[(a as int) - 1]);
  }

  ///POST /tournament/collection/signup
  ///     - collection_id (u32)
  ///     - team_id (u64, optional)
  ///     - Requires user authentication.
  Future<Either<NetworkException, dynamic>> signUp({required int collectionId, int? teamId}) async {
    final data = {
      'collection_id': collectionId,
      '_u': _client.userId,
      '_t': _client.token,
      if (teamId != null) 'team_id': teamId,
    };
    final response = await _client.postForm('/tournament/collection/signup', body: data);

    return response;
  }

  ///POST /tournament/collection/signup/cancel
  ///     - collection_id
  ///     - Requires user authentication.
  Future<Either<NetworkException, dynamic>> cancel({required int collectionId}) async {
    final data = {
      'collection_id': collectionId,
      '_u': _client.userId,
      '_t': _client.token,
    };
    final response = await _client.postForm('/tournament/collection/signup/cancel', body: data);

    return response;
  }
}
