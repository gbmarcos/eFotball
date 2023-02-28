import 'dart:async';

import 'package:fifa/r.dart';
import 'package:fifa/src/common/extensions.dart';
import 'package:flutter/material.dart';

enum _ButtonType {
  normal,
  loading,
}

class CustomFormButton extends StatefulWidget {
  final VoidCallback? onTap;
  final String buttonText;
  final Color? textColor;
  final _ButtonType type;
  final bool outlined;
  final EdgeInsetsGeometry? margin;

  const CustomFormButton(
      {Key? key,
      required this.onTap,
      required this.buttonText,
      this.outlined = false,
      this.margin,
      this.textColor})
      : type = _ButtonType.normal,
        super(key: key);

  /// Button That displays a Widget while waiting for [onTap] to finish
  const CustomFormButton.loading(
      {Key? key,
      required this.onTap,
      required this.buttonText,
      this.outlined = false,
      this.textColor})
      : type = _ButtonType.loading,
        margin = null,
        super(key: key);

  @override
  _CustomFormButtonState createState() => _CustomFormButtonState();
}

class _CustomFormButtonState extends State<CustomFormButton> {
  bool loading = false;
  final animationDuration = const Duration(milliseconds: 250);

  @override
  Widget build(BuildContext context) {
    return widget.type == _ButtonType.loading
        ? _AnimatedFormButton(
            text: widget.buttonText,
            onPressed: widget.onTap,
            outlined: widget.outlined,
            textColor: widget.textColor,
          )
        : _FifaFormButton(
            text: widget.buttonText,
            onPressed: widget.onTap,
            outlined: widget.outlined,
            margin: widget.margin,
            textColor: widget.textColor,
          );
  }
}

class _FifaFormButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool outlined;
  final EdgeInsetsGeometry? margin;
  final Color? textColor;

  const _FifaFormButton({
    Key? key,
    required this.text,
    required this.outlined,
    this.onPressed,
    this.margin,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonStyle = ElevatedButton.styleFrom(
      padding: EdgeInsets.zero,
      fixedSize: Size.fromHeight(R.dimen.fieldsAndButtonsHeight),
      side: outlined ? BorderSide(color: context.theme.colorScheme.primary) : null,
      shape: RoundedRectangleBorder(
        borderRadius: R.shapes.radius_4,
      ),
    ).copyWith(
      backgroundColor: MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return R.colors.orange.withOpacity(0.6);
          }
        },
      ),
    );
    //This default zero margin can be changed, and would make more sense for it to have a non zero value to be more aestethically pleasing
    //but as to not subtly break its current usages `zero` will be used to maintain behavior
    final child = Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Center(
          child: Text(
            text,
            softWrap: false,
            overflow: TextOverflow.fade,
            style: TextStyle(
                fontSize: 13,
                color: textColor ??
                    (outlined ? context.theme.colorScheme.secondary : R.colors.background),
                fontWeight: FontWeight.w500),
          ),
        ));

    return outlined
        ? OutlinedButton(
            onPressed: onPressed,
            style: buttonStyle,
            child: child,
          )
        : ElevatedButton(
            onPressed: onPressed,
            style: buttonStyle,
            child: child,
          );
  }
}

class _AnimatedFormButton extends StatefulWidget {
  final String text;
  final FutureOr<void> Function()? onPressed;
  final bool outlined;
  final Color? textColor;

  const _AnimatedFormButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.outlined,
    this.textColor,
  }) : super(key: key);

  @override
  __AnimatedFormButtonState createState() => __AnimatedFormButtonState();
}

class __AnimatedFormButtonState extends State<_AnimatedFormButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 250),
  );

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final opacityAnimation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(animationController);

    final buttonBorderRadiusAnimation = BorderRadiusTween(
      begin: R.shapes.radius_4,
      end: BorderRadius.circular(R.dimen.fieldsAndButtonsHeight),
    ).animate(animationController);

    return AnimatedBuilder(
      animation: animationController.view,
      builder: (context, child) {
        return Stack(
          alignment: AlignmentDirectional.center,
          children: [
            if (opacityAnimation.value < 1)
              Opacity(
                opacity: 1.0 - opacityAnimation.value,
                child: const SizedBox(
                  height: 40,
                  width: 40,
                  child: CircularProgressIndicator(),
                ),
              ),
            Opacity(
              opacity: opacityAnimation.value,
              child: Container(
                padding: EdgeInsets.zero,
                height: R.dimen.fieldsAndButtonsHeight,
                clipBehavior: Clip.hardEdge,

                decoration: BoxDecoration(
                  borderRadius: buttonBorderRadiusAnimation.value,
                ),
                child: _FifaFormButton(
                  text: widget.text,
                  outlined: widget.outlined,
                  textColor: widget.textColor,
                  onPressed: widget.onPressed == null
                      ? null
                      : () {
                    if (animationController.status == AnimationStatus.dismissed) {
                      animationController.forward();
                      Completer<void>()
                        ..complete(widget.onPressed!.call())
                        ..future.whenComplete(
                                () async => await animationController.reverse());
                    }
                  },
                ),
              ),
            ),
          ],
        );
      },

    );
  }
}
