import 'package:fifa/r.dart';
import 'package:fifa/src/common/exceptions.dart';
import 'package:fifa/src/common/data/network_service.dart';
import 'package:fifa/src/features/profile/models/user_profile.dart';
import 'package:fpdart/fpdart.dart';

class FriendRepository {
  final AuthenticatedNetworkService _client;

  FriendRepository({required AuthenticatedNetworkService client}) : _client = client;

  /// The user's profile.
  ///   - [userId] (u32)
  ///   - [query] (optional, string, must be greater than 2 characters and less than 100)
  ///   - [limit] (u64, 1 to 30, default 5)
  ///   - [idOffset] (optional, u64)

  Future<Either<NetworkException, List<Friend>>> getFriend({
    required int userId,
    String? query,
    int limit = 5,
    int? idOffset,
  }) async {
    final data = {
      'user_id': userId,
      'limit': limit,
      if (query != null) 'query': query,
      if (idOffset != null) 'id_offset': idOffset,
    };

    final response = await _client.get(R.apiEndPoints.friendsSearch, query: data);

    return response.map<List<Friend>>((dynamic a) => friendsFromJson(a as List<dynamic>));
  }
}

const friendMock = '''

[
    {
        "id": 1,
        "username": "mark",
        "avatar": "tws9DOS8BiTZag.jpg",
        "country_id": 210,
        "flags": 0,
        "console": 0,
        "online_status": 0,
        "inserted": 1598025512
    },
    {
        "id": 2,
        "username": "Sam",
        "avatar": "7LFASZKsnF-gYg.png",
        "country_id": 210,
        "flags": 0,
        "console": 0,
        "online_status": 0,
        "inserted": 1598506876
    },
    {
        "id": 6,
        "username": "ronald2",
        "avatar": "Qd7g7nTY1rDHmg.png",
        "country_id": 171,
        "flags": 0,
        "console": 0,
        "online_status": 0,
        "inserted": 1597839609
    },
    {
        "id": 7,
        "username": "ronald3",
        "avatar": null,
        "country_id": 171,
        "flags": 0,
        "console": 0,
        "online_status": 0,
        "inserted": 1597839401
    },
    {
        "id": 8,
        "username": "ronald4",
        "avatar": null,
        "country_id": 170,
        "flags": 0,
        "console": 0,
        "online_status": 0,
        "inserted": 1597839134
    }
]

''';
