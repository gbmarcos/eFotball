import 'package:flutter/material.dart';

class AppScrollBehavior extends ScrollBehavior {
  const AppScrollBehavior({AndroidOverscrollIndicator? androidOverscrollIndicator})
      : super(androidOverscrollIndicator: androidOverscrollIndicator ?? AndroidOverscrollIndicator.stretch);

  static const _physics = ClampingScrollPhysics(parent: RangeMaintainingScrollPhysics());

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return _physics;
  }

  @override
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) {
    return StretchingOverscrollIndicator(
      axisDirection: axisDirection,
      child: child,
    );
  }
}
