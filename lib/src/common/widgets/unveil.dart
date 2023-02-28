import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Unveil extends StatefulWidget {
  final bool preDraw;
  final bool show;
  final Widget child;
  final Duration duration;
  final Curve curve;

  const Unveil({
    Key? key,
    required this.show,
    required this.child,
    this.duration = const Duration(milliseconds: 400),
    this.curve = Curves.easeInOut,
    this.preDraw = true,
  }) : super(key: key);

  @override
  _UnveilState createState() => _UnveilState();
}

class _UnveilState extends State<Unveil> with SingleTickerProviderStateMixin {
  late final animation =
      AnimationController(duration: widget.duration, value: widget.show ? 1 : 0, vsync: this);

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(Unveil oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.show != widget.show) {
      if (widget.show) {
        animation.forward();
      } else {
        animation.reverse();
      }
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('show', widget.show));
  }

  @override
  Widget build(BuildContext context) {
    return ShowHideTransition(
      animation: CurvedAnimation(curve: widget.curve, parent: animation),
      child: widget.child,
    );
  }
}

class ShowHideTransition extends StatelessWidget {
  final Animation<double> animation;
  final Animation<double> sizeAnimation;
  final Widget child;

  ShowHideTransition({
    Key? key,
    required this.animation,
    required this.child,
  })  : sizeAnimation = Tween<double>(begin: 0.1, end: 1).animate(animation),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final fadeTween = CurveTween(curve: const Interval(0.5, 1, curve: Curves.easeInOut));
    final sizeTween = CurveTween(curve: const Interval(0, 0.5, curve: Curves.easeInOut));

    return FadeTransition(
      opacity: animation.drive(fadeTween),
      child: SizeTransition(
        sizeFactor: sizeAnimation.drive(sizeTween),
        child: child,
      ),
    );
  }
}
