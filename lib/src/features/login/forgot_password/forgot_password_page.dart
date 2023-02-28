import 'dart:developer';

import 'package:fifa/r.dart';
import 'package:fifa/resources/resources.dart';
import 'package:fifa/src/app/keys.dart';
import 'package:fifa/src/common/dialogs.dart' as snack_bars;
import 'package:fifa/src/common/extensions.dart';
import 'package:fifa/src/common/widgets/custom_form_button.dart';
import 'package:fifa/src/common/widgets/custom_form_field.dart';
import 'package:fifa/src/common/widgets/form_text_button.dart';
import 'package:fifa/src/common/widgets/unveil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:routemaster/routemaster.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  GlobalKey<FormState> formStateKey = GlobalKey<FormState>();

  late final TextEditingController usernameController = TextEditingController();
  late final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Keys.forgotPassPage,
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
                  context.l10n.forgotYourPasswordText,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
                ),
                const SizedBox(
                  height: 19,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    context.l10n.forgotPassIndicationText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
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
                            controller: usernameController,
                            textInputAction: TextInputAction.next,
                            icon: Icons.person,
                            hintText: context.l10n.usernameTextFieldLabel,
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
                            controller: emailController,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.emailAddress,
                            icon: Icons.email,
                            hintText: context.l10n.emailTextFieldLabel,
                            validator: (fieldCurrentText) {
                              if (!fieldCurrentText.isValidEmail) {
                                return context.l10n.thisEmailIsNotValidText;
                              }
                            },
                          ),
                          const SizedBox(
                            height: 26,
                          ),
                          CustomFormButton.loading(
                            buttonText: context.l10n.resetPasswordButtonText,
                            onTap: sendEmail,
                          ),
                          FormTextButton(
                              key: Keys.forgotPasswordPageBackButton,
                              text: context.l10n.backToLogin,
                              onPressed: () {
                                context.unfocusAll();
                                Routemaster.of(context).pop();
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

  Future<void> sendEmail() async {
    log('FormState valid=${formStateKey.currentState?.validate() ?? false}');
    if (formStateKey.currentState?.validate() ?? false) {
      context.unfocusAll();
      final sendEmailResponse = await context.authenticationRepository.sendEmailToResetPass(
        username: usernameController.text,
        email: emailController.text,
      );

      sendEmailResponse.fold(
        (error) {
          snack_bars.showNetworkErrorMessage(
            error: error,
            context: context,
          );
        },
        (done) {
          Routemaster.of(context).push(R.routeNames.checkYourInboxPage);
          snack_bars.showCustomMessage(context: context, message: context.l10n.emailSentText);
        },
      );
    }
  }
}
