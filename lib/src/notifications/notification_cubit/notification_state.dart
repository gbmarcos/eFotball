part of 'notification_cubit.dart';

@immutable
class NotificationState with EquatableMixin {
  final List<Notification> notifications;
  final bool isExpanded;
  final double? loadingProgress;

  NotificationState(this.notifications, {this.isExpanded = false, this.loadingProgress = 0});

  int get unreadNotifications => notifications.where((element) => !element.seen).length;

  @override
  List<Object?> get props => [notifications, isExpanded, loadingProgress];
}
