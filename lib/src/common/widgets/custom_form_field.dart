import 'package:fifa/r.dart';
import 'package:flutter/material.dart';

enum _FieldType {
  normal,
  autocomplete,
}

class CustomFormField<T extends Object> extends StatelessWidget {
  final String hintText;
  final IconData? icon;
  final bool obscureText;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final FormFieldValidator<String>? validator;
  final AutocompleteOptionsBuilder<T>? optionsBuilder;
  final Widget Function(
    BuildContext context,
    AutocompleteOnSelected<T> onSelected,
    Iterable<T> options,
    BoxConstraints constraints,
  )? optionsViewBuilder;
  final AutocompleteOptionToString<T>? displayStringForOption;
  final AutocompleteOnSelected<T>? onSelected;
  final _FieldType type;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final int? maxLength;

  const CustomFormField({
    Key? key,
    required this.hintText,
    this.icon,
    this.obscureText = false,
    required this.controller,
    this.validator,
    this.textInputAction,
    this.keyboardType,
    this.maxLength,
  })  : optionsBuilder = null,
        optionsViewBuilder = null,
        displayStringForOption = null,
        focusNode = null,
        onSelected = null,
        type = _FieldType.normal,
        super(key: key);

  const CustomFormField.autocomplete({
    Key? key,
    required this.hintText,
    required this.icon,
    this.obscureText = false,
    required this.controller,
    required this.focusNode,
    this.validator,
    this.textInputAction,
    required this.optionsBuilder,
    required this.optionsViewBuilder,
    required this.displayStringForOption,
    this.onSelected,
    this.keyboardType,
    this.maxLength,
  })  : type = _FieldType.autocomplete,
        super(key: key);

  bool get _isAutocomplete {
    return type == _FieldType.autocomplete;
  }

  @override
  Widget build(BuildContext context) {
    return _isAutocomplete
        ? LayoutBuilder(
            builder: (context, constraints) {
              return RawAutocomplete<T>(
                focusNode: focusNode,
                textEditingController: controller,
                optionsBuilder: optionsBuilder ??
                    (textEditingValue) {
                      return [];
                    },
                optionsViewBuilder: (context, onSelected, options) {
                  return optionsViewBuilder != null
                      ? optionsViewBuilder!(context, onSelected, options, constraints)
                      : Container();
                },
                displayStringForOption: displayStringForOption ?? (option) => '',
                onSelected: onSelected,
                fieldViewBuilder: (context, textEditingController, focusNode, onFieldSubmitted) {
                  return _FifaTextField(
                    controller: controller,
                    focusNode: focusNode,
                    maxLength: maxLength,
                    validator: validator,
                    obscureText: obscureText,
                    icon: icon,
                    hintText: hintText,
                    textInputAction: textInputAction,
                    keyboardType: keyboardType,
                  );
                },
              );
            },
          )
        : _FifaTextField(
            controller: controller,
            focusNode: focusNode,
            maxLength: maxLength,
            validator: validator,
            obscureText: obscureText,
            icon: icon,
            hintText: hintText,
            textInputAction: textInputAction,
            keyboardType: keyboardType,
          );
  }
}

class _FifaTextField extends StatelessWidget {
  final String hintText;
  final IconData? icon;
  final bool obscureText;
  final int? maxLength;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final FormFieldValidator<String>? validator;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;

  const _FifaTextField({
    Key? key,
    required this.hintText,
    this.icon,
    required this.obscureText,
    required this.controller,
    required this.focusNode,
    required this.validator,
    this.textInputAction,
    this.keyboardType,
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        focusNode: focusNode,
        maxLength: maxLength,
        buildCounter: (
          context, {
          required currentLength,
          required isFocused,
          maxLength,
        }) =>
            const SizedBox.shrink(),
        keyboardType: keyboardType,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        style: const TextStyle(color: Colors.white, fontSize: 13),
        cursorColor: Colors.white,
        obscureText: obscureText,
        textInputAction: textInputAction,
        decoration:
            const InputDecoration().applyDefaults(R.appDecorations.commonFieldDecoration).copyWith(
                  prefixIcon: icon != null
                      ? Icon(
                          icon,
                          color: R.colors.iconColourOff,
                        )
                      : null,
                  hintText: hintText,
                  contentPadding: icon == null ?const EdgeInsets.only(left: 14) : null,
                ));
  }
}

class CommentFormField extends StatelessWidget {
  final String hintText;
  final int? maxLength;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final FormFieldValidator<String>? validator;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;

  const CommentFormField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.focusNode,
    this.validator,
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.multiline,
    this.maxLength = 1000,
  }) : super(key: key);

  static late final roundedInputBorder = OutlineInputBorder(
      borderRadius: R.shapes.radius_15,
      gapPadding: 0,
      borderSide: const BorderSide(color: Colors.transparent));

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        maxLines: 40,
        minLines: 1,
        focusNode: focusNode,
        maxLength: maxLength,
        keyboardType: keyboardType,
        buildCounter: (
          context, {
          required currentLength,
          required isFocused,
          maxLength,
        }) {
          if (maxLength == null || maxLength - currentLength >= 50) {
            return const SizedBox.shrink();
            // return child;
          } else if (maxLength - currentLength <= 50) {
            return AnimatedSize(
                key: const ValueKey('wordCounter'),
                duration: const Duration(milliseconds: 200),
                child: DefaultTextStyle.merge(child: Text('$currentLength/$maxLength')));
          }
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        style: const TextStyle(color: Colors.white, fontSize: 13),
        cursorColor: Colors.white,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          focusedBorder: roundedInputBorder,
          disabledBorder: roundedInputBorder,
          enabledBorder: roundedInputBorder,
          errorBorder: roundedInputBorder,
          border: roundedInputBorder,
          focusedErrorBorder: roundedInputBorder,
          hintText: hintText,
          contentPadding: const EdgeInsets.only(top: 16, bottom: 16, left: 17, right: 8),
          //Change this value to custom as you like
          isDense: true, // and add this line
        ));
  }
}
