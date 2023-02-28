import 'dart:async';

import 'package:fifa/r.dart';
import 'package:fifa/src/common/widgets/custom_form_button.dart';
import 'package:flutter/material.dart';

class TabManagerWidget extends StatefulWidget {
  final TabController controller;
  final FutureOr<void> Function()? onTap;
  final String buttonText;

  const TabManagerWidget({
    Key? key,
    required this.controller,
    required this.buttonText,
    this.onTap,
  }) : super(key: key);

  @override
  _TabManagerWidgetState createState() => _TabManagerWidgetState();
}

class _TabManagerWidgetState extends State<TabManagerWidget> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final pageCount = widget.controller.length;
    final selectedPageIndex = widget.controller.index;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _PageIndicator(
          pageCount: pageCount,
          selectedPageIndex: selectedPageIndex,
        ),
        const SizedBox(

          height: 15,
        ),
        CustomFormButton.loading(
          buttonText: widget.buttonText,
          onTap: widget.onTap ?? () {},
        )
      ],
    );
  }
}

class _PageIndicator extends StatelessWidget {
  final int pageCount;
  final int selectedPageIndex;

  const _PageIndicator({
    Key? key,
    required this.pageCount,
    required this.selectedPageIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.min,
      children: [
        ...List<AnimatedContainer>.generate(
          pageCount,
          (index) {
            return AnimatedContainer(
              margin: const EdgeInsets.symmetric(horizontal: 2.5),
              duration: const Duration(milliseconds: 250),
              height: 11,
              width: 11,
              decoration: BoxDecoration(
                color: index == selectedPageIndex ? R.colors.orange : R.colors.textBoxBG,
                shape: BoxShape.circle,
              ),
            );
          },
        )
      ],
    );
  }
}
