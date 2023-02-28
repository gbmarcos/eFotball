import 'dart:async';
import 'dart:developer';
import 'dart:ui';

import 'package:fifa/r.dart';
import 'package:fifa/resources/resources.dart';
import 'package:fifa/src/app/keys.dart';
import 'package:fifa/src/common/dialogs.dart' as snack_bars;
import 'package:fifa/src/common/extensions.dart';
import 'package:fifa/src/common/widgets/custom_form_button.dart';
import 'package:fifa/src/common/widgets/custom_form_field.dart';
import 'package:fifa/src/common/widgets/form_text_button.dart';
import 'package:fifa/src/common/widgets/unveil.dart';
import 'package:fifa/src/features/login/login/credentials/model/credential.dart';
import 'package:fifa/src/features/login/login/cubit/login_form_cubit.dart';
import 'package:fifa/src/features/login/login/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:routemaster/routemaster.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginFormCubit(
        credentialRepository: context.userCredentialRepository,
      ),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  GlobalKey<FormState> formStateKey = GlobalKey<FormState>();
  late final FocusNode usernameFocusNode = FocusNode();

  late final TextEditingController usernameController = TextEditingController();
  late final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    usernameFocusNode.dispose();
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
                      child: SvgPicture.asset(Images.appLogoTitled),
                    )),
                Text(
                  context.l10n.signInToGetStartedText,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
                ),
                const SizedBox(
                  height: 19,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Form(
                      key: formStateKey,
                      child: BlocBuilder<LoginFormCubit, LoginState>(
                        buildWhen: (previous, current) => current.formState != previous.formState,
                        builder: (context, state) {
                          return Column(
                            children: [
                              CustomFormField<UserCredential>.autocomplete(
                                key: Keys.loginPageUserName,
                                textInputAction: TextInputAction.next,
                                focusNode: usernameFocusNode,
                                displayStringForOption: (selectedCredential) {
                                  return selectedCredential.username;
                                },
                                optionsViewBuilder: (context, onSelected, options, constraints) {
                                  return Align(
                                    alignment: Alignment.topLeft,
                                    child: Material(
                                      color: Colors.transparent,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: R.colors.boxBackground,
                                            borderRadius: R.shapes.radius_4,
                                            border: Border.all(
                                              color: R.colors.inputBoxStroke,
                                            )),
                                        height: 50.0 * options.length,
                                        width: constraints.biggest.width,
                                        child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          itemCount: options.length,
                                          itemBuilder: (BuildContext context, int index) {
                                            final credential = options.elementAt(index);

                                            return GestureDetector(
                                              onTap: () {
                                                onSelected(credential);
                                              },
                                              child: Container(
                                                height: 50,
                                                width: double.infinity,
                                                //if the container don't have color the
                                                // gesture detector only work in the Text widget
                                                color: Colors.transparent,
                                                alignment: Alignment.centerLeft,
                                                padding: const EdgeInsets.only(left: 20),
                                                child: Text(credential.username,
                                                    style: const TextStyle(color: Colors.white)),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                optionsBuilder: (textEditingValue) {
                                  return state.savedCredentialList
                                      .where(
                                        (credential) =>
                                            textEditingValue.text.isNotNullOrEmpty &&
                                            credential.username
                                                .toLowerCase()
                                                .startsWith(textEditingValue.text.toLowerCase()),
                                      )
                                      .toList();
                                },
                                onSelected: (credential) {
                                  usernameController.text = credential.username;
                                  passwordController.text = credential.password;
                                  context.loginFormCubit.updateCredentials(state.formState
                                      .copyWith(password: credential.password, username: credential.username));
                                },
                                controller: usernameController,
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
                                key: Keys.loginPagePassword,
                                textInputAction: TextInputAction.done,
                                keyboardType: TextInputType.visiblePassword,
                                controller: passwordController,
                                icon: Icons.lock,
                                hintText: context.l10n.passwordTextFieldLabel,
                                obscureText: true,
                                validator: (fieldCurrentText) {
                                  if (fieldCurrentText.isNullOrEmpty) {
                                    return context.l10n.fieldMustNotBeEmptyText;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: const [
                                  _RememberMe(),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              CustomFormButton.loading(
                                key: Keys.loginPageSignInButton,
                                buttonText: context.l10n.signInButtonText,
                                onTap: () async {
                                  await signInButtonTap(context);
                                },
                              ),
                              FormTextButton(
                                key: Keys.loginPageForgotPasswordButton,
                                text: context.l10n.forgotYourPasswordText,
                                onPressed: () {
                                  context.unfocusAll();
                                  Routemaster.of(context).push(R.routeNames.forgotPassPage);
                                },
                              ),
                              SizedBox(
                                height: R.dimen.fieldsAndButtonsHeight,
                              ),
                              CustomFormButton(
                                key: Keys.loginPageCreateAccountButton,
                                buttonText: context.l10n.createAnAccountButtonText,
                                onTap: () {
                                  context.unfocusAll();
                                  Routemaster.of(context).push(R.routeNames.signUpPage);
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          );
                        },
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signInButtonTap(BuildContext context) async {
    log('FormState valid=${formStateKey.currentState?.validate() ?? false}');
    if (formStateKey.currentState?.validate() ?? false) {
      context.unfocusAll();

      final authBloc = context.authenticationBloc;
      final loginResponse = await authBloc.logIn(
        userCredential: UserCredential(
          username: usernameController.text,
          password: passwordController.text,
        ),
        saveCredential: context.loginFormCubit.rememberCredentials,
      );

      loginResponse.fold(
        (error) {
          //show a snack bar with th error message
          snack_bars.showNetworkErrorMessage(error: error, context: context);
        },
        (user) {},
      );
    }
  }
}

class _RememberMe extends StatelessWidget {
  const _RememberMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<LoginFormCubit, LoginState, bool>(
      selector: (state) => state.rememberCredentials,
      builder: (context, rememberMe) {
        return TextButton(
          onPressed: () {
            context.read<LoginFormCubit>().toggleRememberCredentials();
          },
          style: TextButton.styleFrom(padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 18,
                width: 18,
                decoration: BoxDecoration(
                  color: R.colors.textBoxBG,
                  borderRadius: R.shapes.radius_4,
                ),
                child: Checkbox(
                  value: rememberMe,
                  onChanged: (value) {
                    context.read<LoginFormCubit>().toggleRememberCredentials(value);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: R.shapes.radius_4,
                  ),
                  side: BorderSide(color: R.colors.inputBoxStroke),
                ),
              ),
              const SizedBox(
                width: 9,
              ),
              Text(
                context.l10n.rememberMeText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
