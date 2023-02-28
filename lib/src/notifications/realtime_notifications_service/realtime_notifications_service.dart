import 'dart:collection';
import 'dart:developer';

import 'package:fifa/src/common/environment.dart';
import 'package:pusher_client/pusher_client.dart';

abstract class RealTimeClient {
  /// Connects to the underlying background-service
  Future<dynamic> connect();

  /// Disconnects to the background service
  Future<dynamic> disconnect();

  /// Subscribes the client to a new channel of [channelName].
  ///
  /// To subscribe to topics maintain a reference to the returned channel:
  ///
  /// ```
  ///     final RealTimeClient client;
  ///     client.subscribe('private-user-67');
  ///     await channel.bind('end-match', (event) async {...}
  /// ```
  ///
  Channel subscribe(String channelName);

  /// Unsubscribes the client from a particular Channel with [channelName]
  Future<dynamic> unsubscribe(String channelName);

  Set<Channel> get activeChannels;

  /// Subscribes to a listener to a connection error.
  ///
  /// The [listener] callback will be called on [PusherClient.onConnectionError]
  /// on each error
  ///
  /// To remove this [listener], call the function returned by [addListener]:
  ///
  /// ```dart
  /// RealTimeClient example;
  /// final removeListener = example.addErrorListener(() => ...);
  /// removeListener();
  /// ```
  ///
  /// Listeners cannot add other listeners.
  RemoveListener addErrorListener(ErrorListener listener);
}

typedef EventCallback = void Function(PusherEvent? event);

/// A listener that can be added to a [RealTimeClient] using
/// [RealTimeClient.addErrorListener].
typedef ErrorListener = void Function();

/// LinkedList entry of a callback
/// The optional [type] parameter can be used to identify the precedence of the [listener]
class _ListenerEntry extends LinkedListEntry<_ListenerEntry> {
  final Type? type;
  _ListenerEntry(this.listener, {this.type});

  final ErrorListener listener;
}

/// A callback that can be used to remove a listener added with
/// [RealTimeClient.addErrorListener].
///
/// It is safe to call this callback multiple times.
///
/// Calling this callback multiple times will remove the listener only once,
/// even if [RealTimeClient.addErrorListener] was called multiple times with the exact
/// same listener.
typedef RemoveListener = void Function();

///pusher_client Implementation of a [RealTimeClient]
class PusherRealtimeNotifications implements RealTimeClient {
  late final PusherClient _pusherClient;
  final Set<Channel> subscribedChannels = {};

  final _errorListeners = LinkedList<_ListenerEntry>();

  @override
  RemoveListener addErrorListener(ErrorListener listener) {
    final listenerEntry = _ListenerEntry(listener);
    _errorListeners.add(listenerEntry);
    return () {
      if (listenerEntry.list != null) {
        listenerEntry.unlink();
      }
    };
  }

  @override
  String toString() {
    return '[${subscribedChannels.length}] Subscriptions {${subscribedChannels.map((e) => e.name)}';
  }

  PusherRealtimeNotifications(
      {required Environment environment, PusherOptions? options, required int userId, required String token}) {
    // Construct default configuration if none was provided in the constructor
    final _options = options ??
        PusherOptions(
          host: environment.apiUrl,
          auth: PusherAuth(
            '${environment.apiUrl}/user/pusher/auth',
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
            params: {'_u': '$userId', '_t': token},
          ),
          cluster: 'eu',
        );

    _pusherClient = PusherClient(environment.pusherKey, _options);
    _pusherClient.onConnectionStateChange((state) {
      print('Connection state changed from ${state?.previousState}, to ${state?.currentState}');
    });

    _pusherClient.onConnectionError((error) async {
      log('x' * 45);
      log('Pusher error : {${error?.code}, ${error?.message}, ${error?.exception}');
      log('Proceeding to call error listeners');

      for (final errorListener in _errorListeners) {
        errorListener.listener();
      }
      log('x' * 45);
      // Retry connection after 2 seconds
      await Future<void>.delayed(const Duration(seconds: 2), connect);
    });
  }

  @override
  Set<Channel> get activeChannels => Set.unmodifiable(subscribedChannels);

  @override
  Future connect() => _pusherClient.connect();

  @override
  Future disconnect() => _pusherClient.disconnect();

  @override
  Channel subscribe(String channelName) {
    final channel = _pusherClient.subscribe(channelName);
    subscribedChannels.add(channel);
    return channel;
  }

  @override
  Future unsubscribe(String channelName) async {
    final channel = await _pusherClient.unsubscribe(channelName);
    subscribedChannels.removeWhere((element) => element.name == channelName);
    return channel;
  }
}
