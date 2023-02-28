import 'package:fifa/src/notifications/realtime_notifications_service/realtime_notifications_service.dart';

///Facade in which all channels[ChannelConfiguration] that the app supports are stored.
class NotificationChannelsFacade {
  NotificationChannelsFacade._();

  static ChannelConfiguration tournament(String id) => ChannelConfiguration(
        channelName: 'tournament-$id',
        eventNames: {'fetch', 'participants-update', 'bracket-update', 'results-update', 'clear-lobby'},
      );

  static ChannelConfiguration tournamentCollection(String id) => ChannelConfiguration(
        channelName: 'tournament-collection-$id',
        eventNames: {'fetch', 'participants-update', 'bracket-update'},
      );

  static ChannelConfiguration privateUser(String id) => ChannelConfiguration(
        channelName: 'private-user-$id',
        eventNames: {
          'new-friend-request',
          'remove-friend',
          'set-org-permissions',
          'set-oa-permissions',
          'set-ta-permissions',
          'set-tac-permissions',
          'walkover-reversed',
          'end-match',
          'new-match',
          'left-matchmaking',
          'chat-message',
          'notification',
          'friend-status-update'
        },
      );

  static ChannelConfiguration privateMatch(String id) => ChannelConfiguration(
        channelName: 'private-match-$id',
        eventNames: {
          'match-chat-message',
          'evidence',
          'match-scores-confirm',
          'match-scores-submit',
          'match-scores-conflict'
        },
      );

  static ChannelConfiguration privateLobby(String id) => ChannelConfiguration(
        channelName: 'private-lobby-$id',
        eventNames: {'lobby-chat-message'},
      );

  static ChannelConfiguration lobby(String id) => ChannelConfiguration(
        channelName: 'lobby-$id',
        eventNames: {
          'walkover' //***int***//
          ,
          'deleted' //***null***//,
              'check-in'
          //  struct {
          // 				UserID      uint32      `json:"user_id"`
          // 				CheckInTime int64       `json:"check_in_time"`
          // 				MatchID     null.Uint64 `json:"match_id"`
          // 			}
        },
      );

  static ChannelConfiguration match(String id) => ChannelConfiguration(
        channelName: 'match-$id',
        eventNames: {'walkover-reversed'},
      );

  static ChannelConfiguration org(String id) => ChannelConfiguration(
        channelName: 'org-$id',
        eventNames: {'members-update', 'fetch'},
      );
}

/// Configuration of a realtime notification channel(or group) and its events.
///
/// The realtime notifications work as follows:
/// An user connects to the websocket, after that they can connect to different channels.
/// Each channel has a different set of[eventNames] that the user can receive which are just [String].
/// The [ChannelConfiguration] is nothing more than a configuration object in which the already specified
/// [channelName] and [eventNames] are stored.
/// An example of a channel could be as follows:
/// ```
/// // The user enters a lobby, the app subscribes the user to the channel `private-lobby-87` which identifies the lobby
/// // After that the app can receive different events such as `lobby-chat-message` to notify instantly the user of
/// // different events
///  EFotballChannel(channelName: 'private-lobby-87', events: {'lobby-chat-message'});
///
/// ```
/// This configuration is stored as an object namely a [ChannelConfiguration] with its corresponding [channelName] and
/// set of [eventNames] for convenience and for having a single source of truth where to store the different channel and
/// and event names; which in the end just are constants/Strings.
class ChannelConfiguration {
  final String channelName;
  final Set<String> eventNames;
  // final Set<EFotballEvent> events;

  const ChannelConfiguration({required this.channelName, required this.eventNames});
}

class EFotballEvent<T> {
  final String name;
  final T data;
  final EventCallback? onSubscribe;

  EFotballEvent(this.name, {required this.data, this.onSubscribe});
}
