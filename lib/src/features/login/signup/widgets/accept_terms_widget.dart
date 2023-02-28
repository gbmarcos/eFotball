import 'package:fifa/r.dart';
import 'package:fifa/src/common/extensions.dart';
import 'package:fifa/src/common/widgets/switch_button.dart';
import 'package:fifa/src/features/login/signup/cubit/signup_form_cubit.dart';
import 'package:fifa/src/features/login/signup/cubit/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AcceptTermsWidget extends StatelessWidget {
  const AcceptTermsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: BlocSelector<SignupFormCubit, SignupState, bool>(
            selector: (state) => state.areTermsAccepted,
            builder: (context, activated) {
              return SwitchButton(
                activated: activated,
                onTap: () {
                  context.unfocusAll();
                  context.signupFormCubit.toggleTermsAccepted();
                },
              );
            },
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: TextButton(
            onPressed: () {
              context.unfocusAll();
              //todo(marcos) show terms
            },
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                text: context.l10n.agreedToTheTermsPart1,
                style: const TextStyle(color: Colors.white),
              ),
              TextSpan(
                text: context.l10n.agreedToTheTermsPart2,
                style: TextStyle(color: R.colors.orange),
              ),
            ])),
          ),
        ),
      ],
    );
  }
}
