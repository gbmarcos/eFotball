import 'package:flutter/material.dart';

class FormTextButton extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const FormTextButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ));
  }
}
