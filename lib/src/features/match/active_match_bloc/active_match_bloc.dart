import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fifa/src/app/dependency_injection.dart';
import 'package:fifa/src/common/domain/match/match.dart';
import 'package:fifa/src/common/extensions.dart';
import 'package:fifa/src/notifications/data/notification_events.dart';
import 'package:fifa/src/notifications/realtime_notifications_service/realtime_notifications_service.dart';

part 'active_match_event.dart';

part 'active_match_state.dart';
/// Hold different matches that are not finished, either lacking scores or waiting for dispute resolution
class ActiveMatchBloc extends Bloc<ActiveMatchEvent, ActiveMatchState> {
  final RealTimeClient _realTimeClient;

  ActiveMatchBloc({ActiveMatchState? initialState, RealTimeClient? realtimeClient})
      : _realTimeClient = realtimeClient ??= getIt<RealTimeClient>(),
        super(initialState ?? const ActiveMatchState([])) {
    on<AddMatch>((event, emit) {
      emit(ActiveMatchState([...state.activeMatches, event.match]));
    });
    on<RemoveMatch>((event, emit) {
      //build channel name
      final channelConfiguration = NotificationChannelsFacade.privateMatch('${event.matchId}');

      // unsubscribe removed match
      final client = _realTimeClient;
      client.activeChannels
          .where((element) => element.name.compareTo(channelConfiguration.channelName) == 0)
          .forEach((element) {
        log('<ActiveMatchBloc> unsubscribing from ${element.name}');
        client.unsubscribe(element.name);
      });

      emit(ActiveMatchState([...state.activeMatches.where((element) => element.matchId != event.matchId)]));
    });
    on<SetMatches>((event, emit) {
      emit(ActiveMatchState([...event.matches]));
    });
    on<UpdateMatches>((event, emit) {
      final unorderedEquals = const DeepCollectionEquality().equals;

      final currentActiveMatches = state.activeMatches;
      final remoteActiveMatches = event.matches;

      if (!unorderedEquals(currentActiveMatches, remoteActiveMatches)) {
        emit(ActiveMatchState([...event.matches]));
      }
    });
  }
}
