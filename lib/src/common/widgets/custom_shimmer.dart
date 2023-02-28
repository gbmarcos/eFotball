import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

///Shimmer that applies correct colors to its effect. Taken from the apps Theme.
class CustomShimmer extends StatelessWidget {
  final Duration period;
  final ShimmerDirection direction;
  final int loop;
  final bool enabled;
  final Widget? child;
  final Color? color;

  const CustomShimmer({
    Key? key,
    this.child,
    this.direction = ShimmerDirection.ltr,
    this.period = const Duration(milliseconds: 1500),
    this.loop = 0,
    this.enabled = true,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _color = color ?? CardTheme.of(context).color ?? Theme.of(context).cardColor;

    return Shimmer.fromColors(baseColor: _color, highlightColor: _color.withOpacity(.7), child: child ?? const Card());
  }
}
