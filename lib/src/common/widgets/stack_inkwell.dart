import 'package:flutter/material.dart';

/// Stack that makes its whole surface react to [onTap].
/// Can be passed a [background] widget
class StackInkWell extends StatelessWidget {
  final List<Widget> children;
  final Widget? background;
  final BorderRadius borderRadius;
  final VoidCallback? onTap;

  const StackInkWell({
    Key? key,
    required this.children,
    this.background,
    this.onTap,
    this.borderRadius = BorderRadius.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        if (background != null) Positioned.fill(child: background!),
        ...children,
        if (onTap != null)
          Positioned.fill(
            child: InkWell(
              borderRadius: borderRadius,
              onTap: onTap,
            ),
          )
      ],
    );
  }
}
