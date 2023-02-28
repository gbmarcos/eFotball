import 'dart:developer';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:fifa/r.dart';
import 'package:fifa/resources/resources.dart';
import 'package:fifa/src/app/keys.dart';
import 'package:fifa/src/common/dialogs.dart' as snack_bars;
import 'package:fifa/src/common/extensions.dart';
import 'package:fifa/src/common/widgets/custom_form_field.dart';
import 'package:fifa/src/features/login/signup/widgets/dropdown_date_picker.dart';
import 'package:fifa/src/common/widgets/tab_manager_widget.dart';
import 'package:fifa/src/common/widgets/unveil.dart';
import 'package:fifa/src/features/login/signup/cubit/signup_form_cubit.dart';
import 'package:fifa/src/features/login/signup/cubit/signup_state.dart';
import 'package:fifa/src/features/login/signup/models/error_model.dart';
import 'package:fifa/src/features/login/signup/models/signup_model.dart';
import 'package:fifa/src/features/login/signup/utils/extensions.dart';
import 'package:fifa/src/features/login/signup/widgets/accept_terms_widget.dart';
import 'package:fifa/src/features/login/signup/widgets/console_selector_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignupFormCubit(),
      child: const SignUpView(),
    );
  }
}

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> with TickerProviderStateMixin {
  late final TabController tabController;
  GlobalKey<__SignUpPersonalInfoPageState> signUpPersonalInfoKey = GlobalKey<__SignUpPersonalInfoPageState>();
  GlobalKey<__SignUpUserInfoPageState> signUpUserInfoKey = GlobalKey<__SignUpUserInfoPageState>();

  late final SignupFormCubit signupFormCubit = context.signupFormCubit;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupFormCubit, SignupState>(
      listenWhen: (previous, current) => previous.progress != current.progress,
      listener: (context, state) {
        switch (state.progress) {
          case SignUpProgress.step1:
            tabController.animateTo(0);
            break;
          case SignUpProgress.step2:
            tabController.animateTo(1);
            break;
          default:
        }
      },
      child: WillPopScope(
        onWillPop: () async {
          final signupState = signupFormCubit.state;

          if (signupState.progress == SignUpProgress.step1) return true;
          signupFormCubit.updateState(signupState.copyWith(progress: SignUpProgress.step1));
          return false;
        },
        child: SafeArea(
          child: Scaffold(
            key: Keys.signUpPage,
            extendBodyBehindAppBar: true,
            appBar: AppBar(
                leading: const BackButton(color: Colors.white), elevation: 0, backgroundColor: Colors.transparent),
            backgroundColor: R.colors.background,
            body: KeyboardDismissOnTap(
              dismissOnDrag: true,
              child: Column(
                children: [
                  Expanded(
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: tabController,
                      children: [
                        _SignUpPersonalInfoPage(
                          key: signUpPersonalInfoKey,
                          isKeyboardVisible: context.isKeyboardVisible,
                        ),
                        _SignUpUserInfoPage(
                          key: signUpUserInfoKey,
                          isKeyboardVisible: context.isKeyboardVisible,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 60, right: 60, top: 20, bottom: 52),
                    alignment: AlignmentDirectional.topCenter,
                    child: TabManagerWidget(
                      controller: tabController,
                      buttonText: context.l10n.nextButtonText,
                      onTap: () async {
                        final signupState = signupFormCubit.state;
                        switch (signupState.progress) {
                          case SignUpProgress.step1:
                            {
                              final newStateData = signUpPersonalInfoKey.currentState?.submit(
                                signupState.model,
                              );
                              if (newStateData != null) {
                                context.unfocusAll();

                                final newState = signupState.copyWith(
                                  model: newStateData,
                                  progress: SignUpProgress.step2,
                                );

                                signupFormCubit.updateState(newState);
                              }
                            }
                            break;
                          case SignUpProgress.step2:
                            {
                              final newStateData = signUpUserInfoKey.currentState?.submit(
                                signupState.model,
                              );
                              if (newStateData != null) {
                                context.unfocusAll();

                                final signUpResponse = await context.authenticationRepository.signUp(
                                  signupData: newStateData,
                                );

                                signUpResponse.fold((error) {
                                  snack_bars.showNetworkErrorMessage(
                                      error: error, context: context, duration: const Duration(seconds: 7));

                                  //todo(marcos) detailed error handling
                                  final errors = SignupErrors();
                                  final newState = signupState.copyWith(
                                    model: newStateData,
                                    errors: errors,
                                  );
                                  signupFormCubit.updateState(newState);
                                }, (done) {
                                  snack_bars.showCustomMessage(
                                    context: context,
                                    message: context.l10n.accountCreatedSuccessfullyText,
                                  );
                                  context.routeMaster.push(R.routeNames.initial);
                                });

                                // await
                              }
                            }
                            break;
                          default:
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SignUpPersonalInfoPage extends StatefulWidget {
  final bool isKeyboardVisible;

  const _SignUpPersonalInfoPage({
    Key? key,
    required this.isKeyboardVisible,
  }) : super(key: key);

  @override
  __SignUpPersonalInfoPageState createState() => __SignUpPersonalInfoPageState();
}

class __SignUpPersonalInfoPageState extends State<_SignUpPersonalInfoPage> {
  GlobalKey<FormState> formStateKey = GlobalKey<FormState>();
  late final TextEditingController usernameController = TextEditingController();
  late final TextEditingController firstnameController = TextEditingController();
  late final TextEditingController lastnameController = TextEditingController();
  late final TextEditingController emailController = TextEditingController();
  late final TextEditingController passwordController = TextEditingController();
  late final TextEditingController rePasswordController = TextEditingController();
  late final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    usernameController.text = context.signupFormCubit.state.model.username ?? '';
    firstnameController.text = context.signupFormCubit.state.model.firstName ?? '';
    lastnameController.text = context.signupFormCubit.state.model.lastName ?? '';
    emailController.text = context.signupFormCubit.state.model.email ?? '';
    passwordController.text = context.signupFormCubit.state.model.password ?? '';
    rePasswordController.text = context.signupFormCubit.state.model.password ?? '';
  }

  @override
  void dispose() {
    usernameController.dispose();
    firstnameController.dispose();
    lastnameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();

    super.dispose();
  }

  @override
  void didUpdateWidget(covariant _SignUpPersonalInfoPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final signupState = context.signupFormCubit.state;

    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Unveil(
            show: !widget.isKeyboardVisible,
            child: Align(
              alignment: AlignmentDirectional.center,
              child: Container(
                alignment: AlignmentDirectional.center,
                padding: const EdgeInsets.only(top: 40, bottom: 19),
                width: 186,
                child: Image.asset(Images.appLogo),
              ),
            ),
          ),
          Text(
            context.l10n.signUp,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Form(
              key: formStateKey,
              child: Column(
                children: [
                  CustomFormField(
                    controller: usernameController,
                    maxLength: 20,
                    validator: (fieldCurrentText) {
                      if (!fieldCurrentText.isValidUsername) {
                        return context.l10n.thisUsernameIsNotValidText;
                      }

                      if (fieldCurrentText.isNumeric) {
                        return context.l10n.usernameCantOnlyBeNumbers;
                      }

                      return signupState.errors?.usernameError;
                    },
                    icon: Icons.person,
                    hintText: context.l10n.usernameTextFieldLabel,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomFormField(
                    maxLength: 50,
                    controller: firstnameController,
                    validator: (fieldCurrentText) {
                      if (fieldCurrentText.isNullOrEmpty) {
                        return context.l10n.fieldMustNotBeEmptyText;
                      }
                    },
                    icon: Icons.person,
                    hintText: context.l10n.firstnameTextFieldLabel,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomFormField(
                    maxLength: 50,
                    controller: lastnameController,
                    validator: (fieldCurrentText) {
                      if (fieldCurrentText.isNullOrEmpty) {
                        return context.l10n.fieldMustNotBeEmptyText;
                      }
                    },
                    icon: Icons.person,
                    hintText: context.l10n.lastnameTextFieldLabel,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomFormField(
                    controller: emailController,
                    maxLength: 254,
                    icon: Icons.email,
                    hintText: context.l10n.emailTextFieldLabel,
                    validator: (fieldCurrentText) {
                      if (!fieldCurrentText.isValidEmail) {
                        return context.l10n.thisEmailIsNotValidText;
                      }
                      return signupState.errors?.emailError;
                    },
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  CustomFormField(
                    controller: passwordController,
                    validator: (fieldCurrentText) {
                      if (fieldCurrentText.isNullOrEmpty) {
                        return context.l10n.fieldMustNotBeEmptyText;
                      }
                      if (fieldCurrentText!.length < 8) {
                        return context.l10n.passMustHaveMoreThan8Characters;
                      }
                      if (fieldCurrentText.isNumeric) {
                        return context.l10n.passCantOnlyBeNumbers;
                      }
                    },
                    maxLength: 55,
                    icon: Icons.lock,
                    hintText: context.l10n.enterPasswordTextFieldLabel,
                    obscureText: true,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomFormField(
                    maxLength: 55,
                    controller: rePasswordController,
                    icon: Icons.lock,
                    validator: (fieldCurrentText) {
                      if (fieldCurrentText.isNullOrEmpty) {
                        return context.l10n.fieldMustNotBeEmptyText;
                      }
                      if (passwordController.text != rePasswordController.text) {
                        return context.l10n.passwordsMustMatchText;
                      }
                    },
                    hintText: context.l10n.reEnterPasswordTextFieldLabel,
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      context.l10n.dateOfBirthText,
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  DropdownDatePicker(
                    maxYear: R.dateSpecifications.maxDateOfBirthAllowed.year,
                    minYear: R.dateSpecifications.maxDateOfBirthAllowed.year - 100,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  SignupModel? submit(SignupModel currentData) {
    log('FormState valid=${formStateKey.currentState?.validate() ?? false}');
    if (formStateKey.currentState?.validate() ?? false) {
      final birthDate = context.signupFormCubit.state.formDate;
      return currentData.copyWith(
        username: usernameController.text.isNotNullOrEmpty ? usernameController.text : null,
        lastName: lastnameController.text.isNotNullOrEmpty ? lastnameController.text : null,
        firstName: firstnameController.text.isNotNullOrEmpty ? firstnameController.text : null,
        email: emailController.text.isNotNullOrEmpty ? emailController.text : null,
        password: passwordController.text.isNotNullOrEmpty ? passwordController.text : null,
        birthDay: birthDate.day,
        birthMonth: birthDate.month,
        birthYear: birthDate.year,
      );
    }
  }
}

class _SignUpUserInfoPage extends StatefulWidget {
  final bool isKeyboardVisible;

  const _SignUpUserInfoPage({
    Key? key,
    required this.isKeyboardVisible,
  }) : super(key: key);

  @override
  __SignUpUserInfoPageState createState() => __SignUpUserInfoPageState();
}

class __SignUpUserInfoPageState extends State<_SignUpUserInfoPage> {
  GlobalKey<FormState> formStateKey = GlobalKey<FormState>();
  GlobalKey<CountryCodePickerState> countryCodePickerKey = GlobalKey<CountryCodePickerState>();
  late final TextEditingController gamerTagController = TextEditingController();

  @override
  void dispose() {
    gamerTagController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant _SignUpUserInfoPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Unveil(
            show: !widget.isKeyboardVisible,
            child: Align(
              alignment: AlignmentDirectional.center,
              child: Container(
                alignment: AlignmentDirectional.center,
                padding: const EdgeInsets.only(top: 40, bottom: 19),
                width: 186,
                child: Image.asset(Images.appLogo),
              ),
            ),
          ),
          Text(
            context.l10n.signUp,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Form(
              key: formStateKey,
              child: Column(
                children: [
                  CountryPicker(
                    countryCodePickerKey: countryCodePickerKey,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomFormField(
                    controller: gamerTagController,
                    icon: Icons.videogame_asset_rounded,
                    validator: (value) {
                      if (!value.isValidGamerTag) return context.l10n.thisGamerTagIsNotValidText;
                    },
                    hintText: context.l10n.nicknameTextFieldLabel,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      context.l10n.chooseYourGameConsoleText,
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const ConsoleSelectorWidget(),
                  const SizedBox(
                    height: 25,
                  ),
                  const AcceptTermsWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  SignupModel? submit(SignupModel currentData) {
    final acceptedTerms = context.signupFormCubit.state.areTermsAccepted;
    final countryId = countryCodePickerKey.currentState?.selectedItem?.id;

    if (!acceptedTerms) {
      snack_bars.showCustomMessage(
        context: context,
        message: context.l10n.youMustAgreeToTermsAndConditions,
      );
    } else if (countryId == null) {
      snack_bars.showCustomMessage(
        context: context,
        message: context.l10n.countryIdCouldNotBeFound,
      );
    } else {
      log('FormState valid=${formStateKey.currentState?.validate() ?? false}');
      if (formStateKey.currentState?.validate() ?? false) {
        return currentData.copyWith(
          gamerTag: gamerTagController.text.isNotNullOrEmpty ? gamerTagController.text : null,
          countryId: countryId,
          console: context.signupFormCubit.state.selectedConsole.index,
        );
      }
    }
  }
}

class CountryPicker extends StatelessWidget {
  final GlobalKey<CountryCodePickerState> countryCodePickerKey;

  const CountryPicker({Key? key, required this.countryCodePickerKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CountryCodePicker(
      key: countryCodePickerKey,
      // Initial an favorite selection is Sweden
      showCountryOnly: true,
      initialSelection: 'SE',
      favorite: const ['SE'],
      builder: (code) {
        return InkWell(
          borderRadius: R.shapes.radius_4,
          onTap: () {
            context.unfocusAll();
            countryCodePickerKey.currentState?.showCountryCodePickerDialog();
          },
          child: TextFormField(
            enabled: false,
            decoration: const InputDecoration().applyDefaults(R.appDecorations.commonFieldDecoration).copyWith(
                  labelText: code!.name,
                  suffixIcon: const Icon(
                    Icons.arrow_drop_down,
                    color: Color(0xFFC4C4C4),
                  ),
                  prefixIcon: Image.asset(
                    code.flagUri!,
                    package: 'country_code_picker',
                    width: 20,
                    height: 12,
                    cacheWidth: 20,
                    cacheHeight: 12,
                  ),
                ),
          ),
        );
      },
      dialogBackgroundColor: R.colors.textBoxBG,
      dialogTextStyle: TextStyle(
        fontSize: 13,
        color: R.colors.inputBoxTextInitiative,
      ),
      barrierColor: R.colors.background,
      dialogSize: Size(
        context.mediaQuery.size.width * 0.9,
        context.mediaQuery.size.height * 0.9,
      ),
      closeIcon: const Icon(
        Icons.close,
        color: Color(0xFFC4C4C4),
      ),
      onInit: print,
      searchStyle: const TextStyle(
        fontSize: 16,
        color: Color(0xFFC4C4C4),
      ),
      searchDecoration: const InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          color: Color(0xFFC4C4C4),
        ),
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFC4C4C4))),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFC4C4C4))),
      ),
      emptySearchBuilder: (context) {
        return Center(
          child: Text(
            context.l10n.noCountryFoundText,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFFC4C4C4),
            ),
          ),
        );
      },
    );
  }
}
