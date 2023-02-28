import 'package:fifa/r.dart';
import 'package:fifa/src/common/extensions.dart';
import 'package:flutter/material.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
    Key? key,
    this.onChanged,
    this.maxWidth = 192,
    this.alignment = Alignment.topLeft,
    this.hintText = 'Search',
    required this.controller,
    this.focusNode,
  }) : super(key: key);

  final ValueChanged<String>? onChanged;
  final double maxWidth;
  final AlignmentGeometry alignment;
  final String hintText;
  final TextEditingController controller;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Theme(
        data: context.theme.copyWith(
          hintColor: R.colors.searchFieldUnderlineColor,
          inputDecorationTheme: InputDecorationTheme(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: R.colors.searchFieldUnderlineColor),
            ),
          ),
        ),
        child: TextField(
          controller: controller,
          focusNode: focusNode,
          textAlignVertical: TextAlignVertical.center,
          onChanged: onChanged,
          decoration: InputDecoration(
            prefixIcon: const Padding(
              padding: EdgeInsets.only(
                left: 3,
                right: 8,
              ),
              child: Icon(
                Icons.search,
                size: 20,
              ),
            ),
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.white, fontSize: 14),
            constraints: BoxConstraints(
              maxHeight: 40,
              maxWidth: maxWidth,
            ),
            prefixIconConstraints: const BoxConstraints(
              maxHeight: 40,
            ),
            isDense: true,
            contentPadding: const EdgeInsets.only(bottom: 3),
          ),
        ),
      ),
    );
  }
}
