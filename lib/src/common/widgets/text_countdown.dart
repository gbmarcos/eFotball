import 'package:flutter/material.dart';

class TextCountDown extends StatefulWidget {
  final Duration duration;
  final VoidCallback? onFinish;
  const TextCountDown({Key? key, required this.duration, this.onFinish}) : super(key: key);

  @override
  State<TextCountDown> createState() => _TextCountDownState();
}

class _TextCountDownState extends State<TextCountDown> {
  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: TweenAnimationBuilder<int>(
          duration: widget.duration,
          tween: StepTween(begin: widget.duration.inSeconds, end: 0),
          onEnd: widget.onFinish,
          builder: (BuildContext context, int value, Widget? child) {
            final minutes = value ~/ 60;
            final seconds = value % 60;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: DefaultTextStyle.merge(
                child: Text(
                  ' $minutes: $seconds',
                  textAlign: TextAlign.center,
                ),
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
            );
          }),
    );
  }
}
