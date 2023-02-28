import 'dart:async';
import 'dart:developer';

import 'package:fifa/src/app/dependency_injection.dart';
import 'package:fifa/src/notifications/scoped_updater/scoped_subscription.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Widget which binds a [ScopedSubscriptionsState] to the widget's lifecycle
///
/// If [updateDataOnResume] is true, then [ScopedSubscriptionsState.update] will be called to update state when the
/// app comes from the background.
///
/// When this widget gets disposed of the widget tree it will close [ScopedSubscriptionsState.closeSubscriptions] for
/// all [ScopedSubscription].
///
/// To implement polling of data it can be supplied an optional [pollingCycle] Duration.
/// If [pollingCycle] is not null the [ScopedSubscription] update callback will be executed for each sub in [scopedSubscriptionsState]
/// while the widget is mounted with intervals of [pollingCycle].
///
/// See [ScopedSubscription] for more details
///
class ScopedUpdater extends StatefulWidget {
  final ScopedSubscriptionsState scopedSubscriptionsState;
  final bool updateDataOnResume;
  final Duration? pollingCycle;

  final Widget child;

  ScopedUpdater({
    Key? key,
    required List<ScopedSubscription> scopedSubscriptions,
    this.updateDataOnResume = true,
    required this.child,
    this.pollingCycle,
  })  : scopedSubscriptionsState = ScopedSubscriptionsState(
          scopedSubscriptions: scopedSubscriptions,
          client: getIt(),
        ),
        super(key: key);

  @override
  _ScopedUpdaterState createState() => _ScopedUpdaterState();
}

class _ScopedUpdaterState extends State<ScopedUpdater> with WidgetsBindingObserver {
  AppLifecycleState appLifecycleState = AppLifecycleState.resumed;
  Timer? pollingTimer;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    log(widget.scopedSubscriptionsState.toString());
    pollingTimer = _initPollingTimer();
    super.initState();
  }

  Timer? _initPollingTimer() {
    return widget.pollingCycle != null
        ? Timer.periodic(widget.pollingCycle!, (_) {
            log('polling data for ${widget.scopedSubscriptionsState.toShortString()}');
            widget.scopedSubscriptionsState.update();
          })
        : null;
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    widget.scopedSubscriptionsState.closeSubscriptions();
    pollingTimer?.cancel();
    log('Disposing _ScopedUpdater for ${widget.scopedSubscriptionsState.toString()}');
    super.dispose();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<ScopedSubscriptionsState>('subscriptions', widget.scopedSubscriptionsState))
      ..add(DiagnosticsProperty<Timer>('polling_timer', pollingTimer));
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    appLifecycleState = state;
    switch (state) {
      case AppLifecycleState.resumed:
        if (mounted) {
          if (widget.updateDataOnResume) {
            // Manually trigger a refresh whenever the app is resumed
            widget.scopedSubscriptionsState.update();
          }
          if (widget.pollingCycle != null) {
            // Re-start polling while on foreground
            pollingTimer = _initPollingTimer();
          }
        }
        break;
      case AppLifecycleState.inactive:
        //Stop polling on background (to decrease battery consumption)
        pollingTimer?.cancel();
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
