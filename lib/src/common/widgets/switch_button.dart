import 'package:fifa/r.dart';
import 'package:flutter/material.dart';

class SwitchButton extends StatelessWidget {
  final bool activated;
  final Function()? onTap;

  const SwitchButton({
    Key? key,
    this.activated = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(50);
    final color = activated ? R.colors.orange : Colors.white;

    return InkWell(
      onTap: onTap,
      borderRadius: borderRadius,
      child: Container(
        width: 37,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          border: Border.all(color: color),
        ),
        child: AnimatedAlign(
          alignment: activated ? Alignment.centerRight : Alignment.centerLeft,
          duration: const Duration(milliseconds: 200),
          child: Container(
            height: 14,
            width: 14,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
