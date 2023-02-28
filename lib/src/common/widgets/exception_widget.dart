import 'package:fifa/r.dart';
import 'package:fifa/src/common/extensions.dart';

import 'package:flutter/material.dart';

const _divider = SizedBox(height: 3);

class NetworkExceptionWidget extends StatelessWidget {
  final VoidCallback? refresh;
  final EdgeInsets? padding;
  final String? text;

  const NetworkExceptionWidget({
    Key? key,
    this.refresh,
    this.padding,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _ExceptionWidget(
      refresh: refresh,
      padding: padding,
      icon: const Icon(Icons.cloud_off_sharp),
      text: text??context.l10n.networkError,
    );
  }
}

class UnexpectedExceptionWidget extends StatelessWidget {
  final VoidCallback? refresh;
  final EdgeInsets? padding;

  const UnexpectedExceptionWidget({
    Key? key,
    this.refresh,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _ExceptionWidget(
      refresh: refresh,
      padding: padding,
      icon: const Icon(Icons.error_outline),
      text: context.l10n.unknownErrorText,
    );
  }
}

class NoElementsExceptionWidget extends StatelessWidget {
  final String? text;
  final VoidCallback? refresh;
  final EdgeInsets? padding;

  const NoElementsExceptionWidget({
    Key? key,
    this.refresh,
    this.padding,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _ExceptionWidget(
      padding: padding,
      refresh: refresh,
      icon: const Icon(Icons.search_off),
      text: text ?? context.l10n.noData,
    );
  }
}

class _ExceptionWidget extends StatelessWidget {
  const _ExceptionWidget({
    Key? key,
    this.refresh,
    this.padding,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final VoidCallback? refresh;
  final EdgeInsets? padding;
  final Icon icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: refresh,
      child: SafeArea(
        child: Padding(
          padding: padding ?? EdgeInsets.zero,
          child: Center(
            child: Column(
              children: [
                icon,
                _divider,
                Text(text, style: TextStyles.h2Bold),
                _divider,
                if (refresh != null) const Icon(Icons.refresh)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UnderConstruction extends StatelessWidget {
  const UnderConstruction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Icon(
        Icons.construction,
        color: context.theme.colorScheme.secondary,
        size: context.mediaQuery.size.width * .4,
      )
    ]);
  }
}
