import 'package:fifa/r.dart';
import 'package:fifa/src/app/keys.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

const double kAppBarSize = 70.0;
const double kAppBarBorderRadius = 23;
const double kExpandedAppBarSize = 350;

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final bool hideBackButton;
  final Widget? trailing;
  final bool isExpanded;
  final Widget? showOnExpanded;
  final VoidCallback? onBackPressed;

  const CustomAppBar({
    Key? key,
    this.hideBackButton = false,
    required this.title,
    this.trailing,
    this.isExpanded = false,
    this.showOnExpanded,
    this.onBackPressed,
  }) : super(key: key);

  double expandedHeight(bool expanded) => expanded ? kExpandedAppBarSize : 0;

  @override
  Size get preferredSize => const Size.fromHeight(kAppBarSize + kExpandedAppBarSize);

  @override
  Widget build(BuildContext context) {
    final canPop = ModalRoute.of(context)?.canPop ?? false;
    Widget? leading;

    if (canPop) {
      leading = IconButton(
        key: Keys.backButton,
        padding: const EdgeInsets.only(left: 16),
        icon: const Icon(Icons.chevron_left),
        onPressed: onBackPressed ?? Routemaster.of(context).pop,
        highlightColor: Colors.transparent,
      );
    }

    return SafeArea(
      bottom: false,
      child: AnimatedContainer(
        height: kAppBarSize + expandedHeight(isExpanded),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: R.colors.menuBarBackground,
          boxShadow: const [BoxShadow(blurRadius: 1, spreadRadius: 2, color: Colors.black12, offset: Offset(1, 2))],
        ),
        duration: const Duration(milliseconds: 220),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Align(
                alignment: AlignmentDirectional.topCenter,
                child: SizedBox(
                  height: 30,
                  child: NavigationToolbar(
                      leading: leading,
                      middle: DefaultTextStyle.merge(
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        maxLines: 1,
                        softWrap: false,
                        overflow: TextOverflow.fade,
                        child: title,
                      ),
                      centerMiddle: false,
                      trailing: trailing),
                ),
              ),
            ),
            if (isExpanded && showOnExpanded != null) Flexible(child: showOnExpanded!)
          ],
        ),
      ),
    );
  }
}
