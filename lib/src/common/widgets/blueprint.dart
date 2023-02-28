import 'package:flutter/material.dart';

///Widget that can be used to fine tune a design. Pass the design [assetName]
///and have it placed as background of your current widget/[child] .
class Blueprint extends StatelessWidget {
  final Widget child;
  final String assetName;
  final double opacity;

  const Blueprint({Key? key, required this.child, this.opacity = .7, required this.assetName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned.fill(
        child: Image.asset(
          'assets/images/$assetName',
          fit: BoxFit.contain,
        ),
      ),
      Opacity(opacity: opacity, child: child)
    ]);
  }
}
