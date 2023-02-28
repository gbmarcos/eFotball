import 'dart:async';
import 'dart:developer';

import 'package:fifa/r.dart';
import 'package:fifa/resources/resources.dart';
import 'package:fifa/src/authentication/bloc/authentication_bloc.dart';
import 'package:fifa/src/common/dialogs.dart' as snack_bars;
import 'package:fifa/src/common/extensions.dart';
import 'package:fifa/src/common/widgets/custom_form_button.dart';
import 'package:fifa/src/common/widgets/custom_form_field.dart';
import 'package:fifa/src/common/widgets/form_text_button.dart';
import 'package:fifa/src/common/widgets/unveil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class ResetYourPasswordPage extends StatefulWidget {
  const ResetYourPasswordPage({Key? key}) : super(key: key);

  @override
  _ResetYourPasswordPageState createState() => _ResetYourPasswordPageState();
}

class _ResetYourPasswordPageState extends State<ResetYourPasswordPage> {
  GlobalKey<FormState> formStateKey = GlobalKey<FormState>();

  late final TextEditingController passwordController = TextEditingController();
  late final TextEditingController rePasswordController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    rePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.background,
      body: KeyboardDismissOnTap(
        dismissOnDrag: true,
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                Unveil(
                    show: !context.isKeyboardVisible,
                    child: Container(
                      alignment: AlignmentDirectional.center,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 50),
                      child: Image.asset(Images.appLogo),
                    )),
                Text(
                  context.l10n.resetYourPasswordPageTitle,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
                ),
                const SizedBox(
                  height: 19,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Form(
                      key: formStateKey,
                      child: Column(
                        children: [
                          CustomFormField(
                            controller: passwordController,
                            icon: Icons.lock,
                            hintText: context.l10n.enterPasswordTextFieldLabel,
                            obscureText: true,
                            validator: (fieldCurrentText) {
                              if (fieldCurrentText.isNullOrEmpty) {
                                return context.l10n.fieldMustNotBeEmptyText;
                              }
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomFormField(
                            controller: rePasswordController,
                            icon: Icons.lock,
                            hintText: context.l10n.reEnterPasswordTextFieldLabel,
                            obscureText: true,
                            validator: (fieldCurrentText) {
                              if (fieldCurrentText.isNullOrEmpty) {
                                return context.l10n.fieldMustNotBeEmptyText;
                              }
                              if (passwordController.text != rePasswordController.text) {
                                return context.l10n.passwordsMustMatchText;
                              }
                            },
                          ),
                          const SizedBox(
                            height: 26,
                          ),
                          CustomFormButton.loading(
                            buttonText: context.l10n.resetPasswordButtonText,
                            onTap: resetPassword,
                          ),
                          FormTextButton(
                              text: context.l10n.backToLogin,
                              onPressed: () {
                                context.unfocusAll();
                                //to logOut
                                context.authenticationBloc.add(AuthenticationLogoutRequested());
                              }),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> resetPassword() async {
    log('FormState valid=${formStateKey.currentState?.validate() ?? false}');
    if (formStateKey.currentState?.validate() ?? false) {
      context.unfocusAll();

      final currentAuthState = context.currentAuthenticationState;

      final data = currentAuthState.resetPassData!;

      final resetPasswordResponse = await context.authenticationRepository.resetPassword(
        resetData: data,
        password: passwordController.text,
      );
      //handle each case
      resetPasswordResponse.fold(
        (error) {
          snack_bars.showNetworkErrorMessage(error: error, context: context);
        },
        (done) {
          snack_bars.showCustomMessage(
            context: context,
            message: context.l10n.passwordWasChangedSuccessfullyText,
          );

          context.authenticationBloc.add(AuthenticationLogoutRequested());
        },
      );
    }
  }
}
