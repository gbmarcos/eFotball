import 'package:fifa/src/notifications/realtime_notifications_service/realtime_notifications_service.dart';
import 'package:pusher_client/pusher_client.dart';

class MockRealtimeClient extends RealTimeClient {
  @override
  Set<Channel> get activeChannels => {};

  @override
  Future connect() async {}

  @override
  Future disconnect() async {}

  @override
  Channel subscribe(String channelName, {bool force = true}) {
    return MockChannel();
  }

  @override
  Future unsubscribe(String channelName) async {}

  @override
  RemoveListener addErrorListener(ErrorListener listener) => () {};
}

class MockChannel implements Channel {
  @override
  Future<void> bind(String eventName, void Function(PusherEvent? event) onEvent) async {}

  @override
  void cancelEventChannelStream() {}

  @override
  String get name => 'throw UnimplementedError()';

  @override
  void registerListener(String classId, Function(dynamic p1) method) {}

  @override
  Future<void> trigger(String eventName, dynamic data) async {}

  @override
  Future<void> unbind(String eventName) async {}
}
