import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fifa/src/common/extensions.dart';
import 'package:fifa/src/notifications/data/notification.dart';
import 'package:fifa/src/notifications/notification_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';

part 'notification_state.dart';

/// Handles pending [Notification] which can be of different [NotificationType].
class NotificationCubit extends Cubit<NotificationState> {
  final NotificationRepository _notificationRepository;

  NotificationCubit(this._notificationRepository, [NotificationState? initialState])
      : super(initialState ?? NotificationState(const []));

  void addNotification(Notification notification) {
    emit(NotificationState([notification, ...state.notifications], isExpanded: state.isExpanded));
  }

  ///Returns [Some](true) if the notifications were successfully updated in in the backend. None otherwise
  ///If all notifications were already seen it returns Some(false)
  Future<Option<bool>> markAllNotificationAsSeen() async {
    if (state.notifications.any((n) => !n.seen)) {
      final markAsSeen = await _notificationRepository.markNotificationRangeAsSeen(
          state.notifications.first.id, state.notifications.last.id);

      return markAsSeen.fold((l) => const None(), (dynamic r) {
        emit(NotificationState([
          for (final notification in state.notifications)
            Notification(
                seen: true,
                id: notification.id,
                data: notification.data,
                inserted: notification.inserted,
                type: notification.type,
                fromUser: notification.fromUser)
        ], isExpanded: state.isExpanded));
        return const Some(true);
      });
    }

    return const Some(false);
  }

  void toggleExpanded() {
    emit(NotificationState(state.notifications, isExpanded: !state.isExpanded));
  }

  /// Checks if the [notifications] are the same that in the cubit and updates only if different

  void updateNotifications(List<Notification> notifications) {
    final unorderedEquals = const DeepCollectionEquality().equals;

    if (!unorderedEquals(state.notifications, notifications)) {
      emit(NotificationState(notifications, isExpanded: state.isExpanded));
    }
  }

  set loading(double? value) {
    emit(NotificationState(state.notifications, isExpanded: state.isExpanded, loadingProgress: value));
  }

  bool get isLoading => state.loadingProgress != null && state.loadingProgress == 0;
}
