import 'package:dio/dio.dart';
import 'package:fifa/r.dart';
import 'package:fifa/src/common/exceptions.dart';
import 'package:fifa/src/common/data/network_service.dart';
import 'package:fpdart/fpdart.dart';

class DisputeRepository {
  final AuthenticatedNetworkService _client;

  DisputeRepository({required AuthenticatedNetworkService client}) : _client = client;

  ///to start a score dispute
  Future<Either<NetworkException, void>> disputeScore({required int matchId}) async {
    final data = {
      'match_id': matchId,
      '_u': _client.userId,
      '_t': _client.token,
    };

    final response = await _client.postForm(R.apiEndPoints.disputeScore, body: data);

    return response.map<void>((dynamic a) {});
  }

  ///to upload an evidence
  Future<Either<NetworkException, void>> uploadEvidence({
    required int matchId,
    String? youtubeId,
    String? photoPath,
  }) async {
    final fileName = photoPath?.split('/').last;

    final data = {
      'id': matchId,
      '_u': _client.userId,
      '_t': _client.token,
      if (youtubeId != null) 'youtube_id': youtubeId,
      if (photoPath != null) 'image': await MultipartFile.fromFile(photoPath, filename: fileName),
    };

    final response = await _client.postForm(R.apiEndPoints.uploadEvidence, body: data);

    return response.map<void>((dynamic a) {});
  }
}
