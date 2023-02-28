import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fifa/r.dart';
import 'package:fifa/src/common/environment.dart';
import 'package:fifa/src/common/exceptions.dart';
import 'package:fifa/src/common/data/network_service.dart';
import 'package:fifa/src/features/streams/model/stream.dart';
import 'package:fpdart/fpdart.dart';

class StreamRepository extends NetworkService {
  StreamRepository({
    required Environment environment,
    Dio? dio,
  }) : super(environment: environment, client: dio);

  /// An array of streams.
  ///   - [limit] (u64)
  ///
  ///   - [orgId] (optional, u32)
  ///
  ///   - [idOffset] (optional, u64)
  ///    	- Used to get another page of streams. The ID should be set to the last stream on the page.
  ///

  Future<Either<NetworkException, List<Stream>>> listLiveStreams({
    required int limit,
    int? tournamentId,
    int? orgId,
    int? idOffset,
  }) async {
    final data = {
      'limit': limit,
      if (tournamentId != null) 'tournament_id': tournamentId,
      if (orgId != null) 'orgId': orgId,
      if (idOffset != null) 'idOffset': idOffset,
    };

    final response = await get(R.apiEndPoints.streams, query: data);

    return response.map<List<Stream>>((dynamic a) => streamsFromJson(a as List<dynamic>));
  }

  Future<Either<NetworkException, List<Stream>>> listArchivedStreams({
    required int limit,
    int? tournamentId,
    int? orgId,
    int? idOffset,
  }) async {
    final data = {
      'limit': limit,
      if (tournamentId != null) 'tournament_id': tournamentId,
      if (orgId != null) 'orgId': orgId,
      if (idOffset != null) 'idOffset': idOffset,
    };

    final response = await get(R.apiEndPoints.pastStreams, query: data);

    return response.map<List<Stream>>((dynamic a) => streamsFromJson(a as List<dynamic>));
  }

  Future<Either<NetworkException, List<Stream>>> mockedListLiveStreams() async {
    return Either.right(streamsFromJson(jsonDecode(streamMock) as List<dynamic>));
  }
}

const streamMock = '''
[
    {
        "url": "https://www.youtube.com/watch?v=SoTea66oO64",
        "tournament_id": null,
        "twitch_user_id": null,
        "twitch_username": null,
        "user_id": null,
        "username": "",
        "status": null,
        "thumbnail_url": null,
        "viewers": 5,
        "org":
        {
            "id": 28,
            "name": "Örgryte IF",
            "logo": "De7bdBztbS7Tjg.png",
            "background": null,
            "banner_url": null,
            "slug": "öis",
            "flags": 513,
            "inserted": 1608209649
        }
    },
    {
        "url": "https://www.youtube.com/watch?v=zrn7V3bMJvg",
        "tournament_id": null,
        "twitch_user_id": null,
        "twitch_username": null,
        "user_id": null,
        "username": "",
        "status": null,
        "thumbnail_url": null,
        "viewers": 10,
        "org":
        {
            "id": 26,
            "name": "sverige",
            "logo": "ybhDukSDIN4r_g.png",
            "background": "VT6lZLThxRIrcw.png",
            "banner_url": null,
            "slug": "tyskland",
            "flags": 3593,
            "inserted": 1608144309
        }
    },
    {
        "url": "https://www.youtube.com/watch?v=aAmP-WcI6dg",
        "tournament_id": null,
        "twitch_user_id": null,
        "twitch_username": null,
        "user_id": null,
        "username": "",
        "status": null,
        "thumbnail_url": null,
        "viewers": null,
        "org":
        {
            "id": 2,
            "name": "Malmö FF",
            "logo": "QL031SIZjLstLw.png",
            "background": "CwrfYvuCwBfuXQ.png",
            "banner_url": null,
            "slug": "mff",
            "flags": 641,
            "inserted": 1607955909
        }
    }
]
''';
