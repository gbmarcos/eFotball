import 'package:fifa/r.dart';
import 'package:flutter/material.dart';

/// Custom Tab bar widget which displays an unselected indicator on tabs.
class CustomTabBar extends StatelessWidget with PreferredSizeWidget {
  final List<Tab> tabs;
  final EdgeInsetsGeometry? padding;

  const CustomTabBar({Key? key, required this.tabs, this.padding}) : super(key: key);
  static const height = 50.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Stack(fit: StackFit.passthrough, alignment: Alignment.bottomCenter, children: <Widget>[
        Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: R.colors.tabBarUnselected, width: 2)),
          ),
        ),
        TabBar(tabs: tabs)
      ]),
    );
  }

  @override
  Size get preferredSize => TabBar(tabs: tabs).preferredSize;
}
