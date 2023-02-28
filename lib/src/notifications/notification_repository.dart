import 'package:fifa/src/common/exceptions.dart';
import 'package:fifa/src/common/data/network_service.dart';
import 'package:fpdart/fpdart.dart';

class NotificationRepository {
  final AuthenticatedNetworkService _client;

  NotificationRepository({required AuthenticatedNetworkService client}) : _client = client;

  /// Marks notifications as seen. The [id] of the notification must be specified.
  /// If an optional [lastId] is also specified the notifications from [id] to [lastId] inclusive will be marked as seen
  Future<Either<NetworkException, dynamic>> markNotificationRangeAsSeen(int id, [int? lastId]) async {
    final data = {
      'id': id,
      if (lastId != null) 'last_id': lastId,
      '_u': _client.userId,
      '_t': _client.token,
    };
    return _client.postForm('/notifications/mark_as_seen', body: data);
  }


}
