import 'dart:math' as math;

import 'package:animations/animations.dart';
import 'package:fifa/src/common/exceptions.dart';
import 'package:fifa/src/common/extensions.dart';
import 'package:flutter/material.dart';

void showCustomMessage(
    {required BuildContext context,
    required String message,
    Duration duration = const Duration(milliseconds: 4000),
    Key? key}) {
  final snackBar = SnackBar(content: Text(message), duration: duration, key: key);
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void showNetworkErrorMessage(
    {required NetworkException error,
    required BuildContext context,
    Duration duration = const Duration(milliseconds: 4000),
    Key? key}) {
  showCustomMessage(
    key: key,
    context: context,
    message: error.responseMessage ?? context.l10n.unknownErrorText,
    duration: duration,
  );
}

///Shows a Dialog that animates from the top of the screen and its aligned at the top as well.
Future<T?> showDialogSlideFromTop<T extends Object?>({
  required BuildContext context,
  required Widget child,
  bool dismissOnTap = false,
}) {
  return showGeneralDialog<T>(
    barrierDismissible: dismissOnTap,
    barrierLabel: 'Barrier',
    useRootNavigator: false,
    barrierColor: Colors.black.withOpacity(0.4),
    transitionDuration: const Duration(milliseconds: 400),
    context: context,
    pageBuilder: (_, __, ___) {
      return Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints:
              BoxConstraints(minHeight: 420, maxHeight: math.max(450, MediaQuery.of(context).size.height * .6)),
          child: Center(child: child),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      return SlideTransition(
        position: Tween(begin: const Offset(0, -1), end: Offset.zero).animate(anim),
        child: child,
      );
    },
  );
}

Future<T?> showDialogFadeScale<T extends Object?>({
  required BuildContext context,
  required Widget child,
  bool dismissOnTap = false,
}) {
  return showGeneralDialog<T>(
    barrierDismissible: dismissOnTap,
    barrierLabel: 'Barrier',
    useRootNavigator: false,
    barrierColor: Colors.black.withOpacity(0.4),
    transitionDuration: const Duration(milliseconds: 400),
    context: context,
    pageBuilder: (_, __, ___) {
      return Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints:
              BoxConstraints(minHeight: 420, maxHeight: math.max(450, MediaQuery.of(context).size.height * .6)),
          child: Center(child: child),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      return FadeScaleTransition(
        animation: anim,
        child: child,
      );
    },
  );
}
