import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:fifa/src/notifications/realtime_notifications_service/realtime_notifications_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:pusher_client/pusher_client.dart';

typedef EventCallback = void Function(PusherEvent? event);
typedef ErrorListener = void Function();
typedef RemoveListener = void Function();

@immutable
class ScopedSubscriptionsState extends Equatable {
  final RealTimeClient client;
  final List<ScopedSubscription> scopedSubscriptions;

  const ScopedSubscriptionsState({required this.scopedSubscriptions, required this.client});

  @override
  List<Object?> get props => [scopedSubscriptions];

  void update() {
    for (final scope in scopedSubscriptions) {
      scope.onConnectionError?.call();
    }
  }

  Future<void> closeSubscriptions() async {
    for (final scope in scopedSubscriptions) {
      scope.close(client);
    }
  }

  String toShortString() => 'ScopedSubscriptionsState<${scopedSubscriptions.first.channel.name}>';

  @override
  String toString() => 'Subscribed to channels [${scopedSubscriptions.map(
        (e) => '${e.channel.name}: '
            'topics {${scopedSubscriptions.map((e) => e.topicCallbacks.keys.join(', '))} ',
      )}]';
}

/// A Scoped subscription to different topics.
///
/// If [unbindChannelOnDispose] is true when this object goes out of scope the [Channel] will be unbind and with it all
/// its subscriptions. If there are channels that are meant to live longer than its scope set [unbindChannelOnDispose]
/// to false and only the [topicCallbacks] will be removed but the channel itself and any previous (NOT OVERRIDDEN)
/// subscription will be preserved.
///
/// An optional [onConnectionError] callback can be provided if you wish to act upon a [RealTimeClient] error within
/// the scope. Usually manual data updates are triggered, this opens the possibility to polling if there is a network
/// error.
///
/// This object is meant to ease the use of [RealTimeClient] by configuring a set of [EventCallback] to topics.
/// This could have been done directly, but this objects acts as a scope that groups all the subscriptions needed for
/// a channel [topicCallbacks]. And a fallback to get the data if there is a connection error [onConnectionError].
///
///
class ScopedSubscription {
  final Channel channel;
  final Map<String, EventCallback> topicCallbacks;
  final bool unbindChannelOnDispose;
  final ErrorListener? onConnectionError;
  RemoveListener? _removeErrorListener;

  ScopedSubscription({
    required String channelName,
    required this.topicCallbacks,
    this.unbindChannelOnDispose = true,
    this.onConnectionError,
    required RealTimeClient client,
  }) : channel = client.subscribe(channelName) {
    _subscribe(client);
  }

  void _subscribe(RealTimeClient client) {
    EventCallback _log(EventCallback callback) {
      return (event) {
        if (event?.data != null) {
          log('Event received from ${event?.channelName} [${event?.eventName}][[${event?.data}]] ');
          callback.call(event);
        } else {
          log('Received null message for topic ${event?.channelName}-${event?.eventName}');
        }
      };
    }

    for (final callback in topicCallbacks.entries) {
      channel.bind(callback.key, _log(callback.value));
    }
    if (onConnectionError != null) {
      _removeErrorListener = client.addErrorListener(onConnectionError!);
    }
  }

  /// Does the housekeeping when the scope is disposed or no longer needed.
  /// Removes [onConnectionError] error callback if provided.
  /// If [unbindChannelOnDispose] is true then [channel] is completely unsubscribed from the client.
  /// else just the topics within this object [topicCallbacks]
  void close(RealTimeClient client) {
    if (unbindChannelOnDispose) {
      // Remove channel subscription
      client.unsubscribe(channel.name);
    } else {
      // Remove only topics which were subscribed on this scope
      for (final callback in topicCallbacks.entries) {
        channel.unbind(callback.key);
      }
    }
    _removeErrorListener?.call();
  }
}
