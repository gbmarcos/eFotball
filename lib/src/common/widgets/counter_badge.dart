import 'package:fifa/r.dart';
import 'package:fifa/src/common/extensions.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class CounterBadge extends StatelessWidget {
  final int? count;
  final Color? color;

  ///Rectangular Counter. If count is null the Counter is transparent and will animate its color when a non null
  ///value is provided
  const CounterBadge({Key? key, this.count, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final displayCounter = count == null || count == 0;
    late final String counterText;

    if (displayCounter) {
      counterText = '';
    } else if (count! > 99) {
      counterText = '∞';
    } else {
      counterText = '$count';
    }
    return AnimatedContainer(
      constraints: BoxConstraints.loose(const Size(24, 20)),
      decoration: BoxDecoration(
        color: displayCounter ? Colors.transparent : context.theme.colorScheme.secondary,
        borderRadius: R.shapes.radius_4,
      ),
      curve: Curves.decelerate,
      duration: const Duration(milliseconds: 120),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 3),
          child: AutoSizeText(
            counterText,
            maxLines: 1,
            style: TextStyles.tab.copyWith(
              color: context.theme.scaffoldBackgroundColor,
            ),
          ),
        ),
      ),
    );
  }
}
