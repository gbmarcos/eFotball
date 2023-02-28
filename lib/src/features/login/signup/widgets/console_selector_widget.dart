import 'package:fifa/r.dart';
import 'package:fifa/src/common/domain/user/user.dart';
import 'package:fifa/src/common/extensions.dart';
import 'package:fifa/src/features/login/signup/cubit/signup_form_cubit.dart';
import 'package:fifa/src/features/login/signup/cubit/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ConsoleSelectorWidget extends StatefulWidget {
  const ConsoleSelectorWidget({Key? key}) : super(key: key);

  @override
  _ConsoleSelectorWidgetState createState() => _ConsoleSelectorWidgetState();
}

class _ConsoleSelectorWidgetState extends State<ConsoleSelectorWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocSelector<SignupFormCubit, SignupState, Console>(
      selector: (state) => state.selectedConsole,
      builder: (context, selectedConsole) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _ConsoleSelectorButton(
              iconData: FontAwesomeIcons.playstation,
              buttonText: context.l10n.playstationConsoleName,
              selected: selectedConsole == Console.playstation,
              onTap: () {
                context.unfocusAll();
                context.signupFormCubit.changeSelectedGameConsole(Console.playstation);
              },
            ),
            _ConsoleSelectorButton(
              iconData: FontAwesomeIcons.xbox,
              buttonText: context.l10n.xboxConsoleName,
              selected: selectedConsole == Console.xbox,
              onTap: () {
                context.unfocusAll();
                context.signupFormCubit.changeSelectedGameConsole(Console.xbox);
              },
            )
          ],
        );
      },
    );
  }
}

class _ConsoleSelectorButton extends StatelessWidget {
  final bool selected;
  final IconData iconData;
  final String buttonText;
  final Function()? onTap;

  const _ConsoleSelectorButton({
    Key? key,
    this.selected = false,
    required this.iconData,
    required this.buttonText,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = selected ? R.colors.orange : Colors.white;

    return InkWell(
      onTap: onTap,
      borderRadius: R.shapes.radius_4,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: color),
          borderRadius: R.shapes.radius_4,
        ),
        child: SizedBox(
          height: 120,
          width: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                iconData,
                color: color,
                size: 54,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                buttonText,
                style: TextStyle(color: color, fontSize: 12),
              )
            ],
          ),
        ),
      ),
    );
  }
}
