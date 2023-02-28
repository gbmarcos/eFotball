import 'dart:async';
import 'dart:developer';

import 'package:async_data_bloc/async_data_bloc.dart';
import 'package:fifa/r.dart';
import 'package:fifa/resources/resources.dart';
import 'package:fifa/src/app/dependency_injection.dart';
import 'package:fifa/src/app/keys.dart';
import 'package:fifa/src/authentication/authentication.dart';
import 'package:fifa/src/authentication/authentication_repository.dart';
import 'package:fifa/src/common/dialogs.dart' as snack_bars;
import 'package:fifa/src/common/domain/user/user.dart';
import 'package:fifa/src/common/environment.dart';
import 'package:fifa/src/common/exceptions.dart';
import 'package:fifa/src/common/extensions.dart';
import 'package:fifa/src/common/widgets/custom_form_button.dart';
import 'package:fifa/src/common/widgets/custom_form_field.dart';
import 'package:fifa/src/common/widgets/exception_widget.dart';
import 'package:fifa/src/features/login/login/credentials/credential_repository.dart';
import 'package:fifa/src/features/login/login/credentials/model/credential.dart';
import 'package:fifa/src/features/profile/models/user_profile.dart';
import 'package:fifa/src/features/profile/profile_page.dart';
import 'package:fifa/src/features/profile/profile_page_cubit.dart';
import 'package:fifa/src/features/profile/profile_repository.dart';
import 'package:fifa/src/features/profile/settings_cubit.dart';
import 'package:fifa/src/features/profile/twitch/twitch_modal_connect.dart';
import 'package:fifa/src/notifications/notification_app_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class ProfileSettingsPage extends StatefulWidget {
  const ProfileSettingsPage({Key? key}) : super(key: key);

  @override
  State<ProfileSettingsPage> createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  late final emailController = TextEditingController();
  late final newPass1Controller = TextEditingController();
  late final newPass2Controller = TextEditingController();
  late final currentPassController = TextEditingController();
  late final scrollController = ScrollController();

  late ValueNotifier<bool> isTheSameEmail = ValueNotifier(
    emailController.text == pageState.profile.state.valueOrNull?.email,
  );

  late final ProfilePageCubit pageState = context.fromSacco<ProfilePageCubit>() ??
      ProfilePageCubit(
        matchRepository: getIt(),
        profileRepository: getIt(),
        friendRepository: getIt(),
        userId: context.currentUser.id,
      );
  late final ProfileRepository profileRepository = getIt();
  late final AuthenticationBloc authenticationBloc = context.read<AuthenticationBloc>();

  @override
  void initState() {
    emailController.addListener(updateEmailIsTheSame);
    super.initState();
  }

  void updateEmailIsTheSame() {
    isTheSameEmail.value = emailController.text == pageState.profile.state.valueOrNull?.email;
  }

  @override
  void dispose() {
    emailController
      ..removeListener(updateEmailIsTheSame)
      ..dispose();
    scrollController.dispose();
    currentPassController.dispose();
    newPass1Controller.dispose();
    newPass2Controller.dispose();
    isTheSameEmail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Keys.profileSettingsPage,
      appBar: NotificationAppBar(title: Text(context.l10n.profileLabel)),
      body: ListView(
        controller: scrollController,
        key: const PageStorageKey<String>('profile-settings'),
        padding: const EdgeInsets.symmetric(horizontal: 17),
        children: [
          const SizedBox(height: 32),
          AsyncCubitBuilder<UserProfile>(
            bloc: pageState.profile,
            builder: (_, state) {
              return state.maybeMap(
                orElse: () => const SizedBox.shrink(),
                data: (profile) {
                  emailController.text = profile.value.email ?? '';

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        children: [
                          ProfileAvatarWidget(profile: profile.value),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: InkWell(
                              onTap: chooseProfileImage,
                              borderRadius: BorderRadius.circular(50),
                              child: Container(
                                height: 43,
                                width: 43,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: R.colors.textBoxBG,
                                ),
                                child: Icon(
                                  FontAwesomeIcons.solidImage,
                                  size: 21,
                                  color: context.theme.colorScheme.secondary,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      ProfileSettingsGroup(
                        groupName: context.l10n.changeEmail,
                        children: <Widget>[
                          CustomFormField(
                            controller: emailController,
                            icon: Icons.email,
                            hintText: context.l10n.emailTextFieldLabel,
                          ),
                          ValueListenableBuilder<bool>(
                            valueListenable: isTheSameEmail,
                            builder: (context, isTheSameEmail, _) {
                              return CustomFormButton.loading(
                                key: Keys.profileSettingsPageEmailButton,
                                onTap: isTheSameEmail ? null : changeEmail,
                                buttonText: context.l10n.changeEmail,
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      ProfileSettingsGroup(
                        groupName: context.l10n.changePassword,
                        children: <Widget>[
                          CustomFormField(
                            controller: currentPassController,
                            icon: Icons.lock,
                            hintText: context.l10n.enterCurrentPasswordTextFieldLabel,
                            obscureText: true,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          CustomFormField(
                            controller: newPass1Controller,
                            icon: Icons.lock,
                            hintText: context.l10n.enterNewPasswordTextFieldLabel,
                            obscureText: true,
                          ),
                          CustomFormField(
                            controller: newPass2Controller,
                            icon: Icons.lock,
                            hintText: context.l10n.reEnterNewPasswordTextFieldLabel,
                            obscureText: true,
                          ),
                          CustomFormButton.loading(
                            onTap: () => updatePassword(profile.value),
                            buttonText: context.l10n.changePassword,
                          ),
                        ],
                      ),
                      const SizedBox(height: 17),
                      ProfileSettingsGroup(
                        key: Keys.profileSettingsPageLanguageGroup,
                        alternativeGroupNameColor: Colors.white,
                        groupName: context.l10n.language,
                        children: <Widget>[
                          DropdownButtonFormField<String?>(
                            key: Keys.profileSettingsPageLanguageDropdown,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: 15),
                            ),
                            value: getIt<SettingsCubit>().state.locale,
                            onChanged: getIt<SettingsCubit>().updateLocale,
                            items: [
                              DropdownMenuItem(
                                value: null,
                                child: Text(
                                  context.l10n.automatic,
                                  style: const TextStyle(fontSize: 13),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'en',
                                child: Text(
                                  context.l10n.english,
                                  style: const TextStyle(fontSize: 13),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'sv',
                                child: Text(
                                  context.l10n.swedish,
                                  style: const TextStyle(fontSize: 13),
                                ),
                              ),
                            ],
                            dropdownColor: R.colors.textBoxBG,
                            elevation: 0,
                          ),
                        ],
                      ),
                      const SizedBox(height: 17),
                      InkWell(
                        key: Keys.profileSettingsPageSignOutButton,
                        onTap: () async {
                          await showDialog<dynamic>(
                            context: context,
                            builder: (context) => const SignOutDialog(),
                          );
                        },
                        borderRadius: R.shapes.radius_4,
                        child: ProfileSettingsGroup(
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 17),
                          children: <Widget>[
                            Row(
                              children: [
                                const Icon(
                                  Icons.logout,
                                  color: Colors.white,
                                  size: 18,
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  context.l10n.signOut,
                                  style: TextStyle(
                                    color: context.theme.colorScheme.secondary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 17),
                      ProfileSettingsGroup(
                        alternativeGroupNameColor: Colors.white,
                        groupName: 'Twitch',
                        children: [
                          TextButton(
                            key: Keys.twitchAccount,
                            onPressed:
                                isTwitchConnected(context.currentUser) ? _handleTwitchDisconnect : _handleTwitchConnect,
                            child: Row(
                              children: [
                                const FaIcon(FontAwesomeIcons.twitch, color: Colors.white),
                                const SizedBox.square(dimension: 15),
                                if (isTwitchConnected(context.currentUser))
                                  Text(context.l10n.disconnect)
                                else
                                  Text(context.l10n.connect)
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  );
                },
                loading: (_) => const ProfileInfoLoading(),
                error: (e) {
                  final error = e.error;
                  if (error is NetworkException) {
                    return error.map(
                      (value) => const NetworkExceptionWidget(),
                      noDataException: (value) => NoElementsExceptionWidget(
                        text: context.l10n.profileCouldNotBeLoaded,
                      ),
                    );
                  } else {
                    if (kReleaseMode) {
                      Sentry.captureException(error, stackTrace: e.stackTrace);
                    } else {
                      log('${e.stackTrace}');
                      log('${e.error}');
                    }
                    return const UnexpectedExceptionWidget();
                  }
                },
              );
            },
          )
        ],
      ),
    );
  }

//todo refactor to cubit
  Future<void> _handleTwitchConnect() async {
    final code = await showDialog<String?>(
      context: context,
      builder: (_) => TwitchModalConnect(connectionSettings: getIt<Environment>().twitchConnectionSettings),
    );
    if (code != null && code is bool && !(code as bool)) {
      snack_bars.showCustomMessage(context: context, message: context.l10n.networkError);
    } else if (code != null) {
      final twitchConnection = await getIt<ProfileRepository>().connectTwitch(code: code);
      twitchConnection.fold(
        (l) => snack_bars.showCustomMessage(context: context, message: context.l10n.networkError),
        (r) {
          snack_bars.showCustomMessage(context: context, message: context.l10n.success);
          authenticationBloc.add(
            AuthenticationStatusChanged(
              AuthenticationStatus.authenticated,
              authenticationBloc.state.user!.copyWith(twitchUsername: r),
            ),
          );
        },
      );
    }
  }

  Future<void> _handleTwitchDisconnect() async {
    final twitchConnection = await getIt<ProfileRepository>().disconnectTwitch();
    twitchConnection.fold(
      (l) => snack_bars.showCustomMessage(context: context, message: context.l10n.networkError),
      (dynamic r) {
        snack_bars.showCustomMessage(context: context, message: context.l10n.success);
        authenticationBloc.add(
          AuthenticationStatusChanged(
            AuthenticationStatus.authenticated,
            authenticationBloc.state.user!.copyWith(twitchUsername: null),
          ),
        );
      },
    );
  }

  Future<void> updatePassword(UserProfile profile) async {
    if (currentPassController.text.isNullOrEmpty) {
      snack_bars.showCustomMessage(
        context: context,
        message: context.l10n.currentPasswordIsRequired,
      );
    } else if (newPass1Controller.text != newPass2Controller.text) {
      snack_bars.showCustomMessage(
        context: context,
        message: context.l10n.passwordsMustMatchText,
      );
    } else if (newPass1Controller.text.isNullOrEmpty) {
      snack_bars.showCustomMessage(
        context: context,
        message: context.l10n.newPasswordIsRequired,
      );
    } else {
      final response = await profileRepository.changePassword(
        userId: authenticationBloc.state.user!.id,
        currentPass: currentPassController.text,
        newPass: newPass1Controller.text,
      );

      await response.fold(
        (error) {
          snack_bars.showNetworkErrorMessage(
            error: error,
            context: context,
          );
        },
        (newToken) async {
          //update user token
          authenticationBloc.add(
            AuthenticationStatusChanged(
              AuthenticationStatus.authenticated,
              authenticationBloc.state.user!.copyWith(token: newToken),
            ),
          );

          //update saved credential
          await getIt<UserCredentialRepository>().addCredential(
            UserCredential(
              username: profile.username,
              password: newPass1Controller.text,
            ),
          );

          snack_bars.showCustomMessage(context: context, message: 'Your password was changes successful');
        },
      );
    }
  }

  Future<void> chooseProfileImage() async {
    final imageSource = await showDialog<ImageSource>(
      context: context,
      builder: (context) => const PickImageDialog(),
    );

    if (imageSource != null) {
      final image = await ImagePicker().pickImage(
        source: imageSource,
      );

      if (image != null) {
        final response = await profileRepository.changePhoto(
          userId: authenticationBloc.state.user!.id,
          photoPath: image.path,
        );

        response.fold(
          (error) {
            snack_bars.showNetworkErrorMessage(
              error: error,
              context: context,
            );
          },
          (done) {
            pageState.profile.refresh();
            snack_bars.showCustomMessage(
              message: context.l10n.yourProfilePhotoWasChangedSuccessfully,
              context: context,
            );
          },
        );
      }
    }
  }

  FutureOr<void> changeEmail() async {
    if (!emailController.text.isValidEmail) {
      snack_bars.showCustomMessage(
        context: context,
        message: context.l10n.thisEmailIsNotValidText,
      );
    } else {
      final response = await profileRepository.changeEmail(
        user: authenticationBloc.state.user!,
        profile: pageState.profile.state.valueOrNull!,
        newEmail: emailController.text,
      );

      response.fold(
        (error) {
          snack_bars.showNetworkErrorMessage(
            error: error,
            context: context,
          );
        },
        (done) {
          authenticationBloc.add(
            AuthenticationStatusChanged(
              AuthenticationStatus.authenticated,
              authenticationBloc.state.user!.copyWith(email: emailController.text),
            ),
          );
          pageState.profile.refresh();
          snack_bars.showCustomMessage(
            message: context.l10n.yourEmailWasChangedSuccessfully,
            context: context,
          );
        },
      );
    }
  }

  FutureOr<void> changeConsole(Console? console) async {
    if (console == null) {
      return;
    } else if (authenticationBloc.state.user!.console != console) {
      final response = await profileRepository.changeConsole(
          user: authenticationBloc.state.user!, profile: pageState.profile.state.valueOrNull!, console: console);

      response.fold(
        (error) {
          snack_bars.showNetworkErrorMessage(
            error: error,
            context: context,
          );
        },
        (done) {
          authenticationBloc.add(
            AuthenticationStatusChanged(
              AuthenticationStatus.authenticated,
              authenticationBloc.state.user!.copyWith(console: console),
            ),
          );
          pageState.profile.refresh();
          snack_bars.showCustomMessage(
            message: context.l10n.yourConsoleWasChangedSuccessfully,
            context: context,
          );
        },
      );
    }
  }
}

class ProfileSettingsGroup extends StatelessWidget {
  const ProfileSettingsGroup({
    Key? key,
    this.groupName,
    required this.children,
    this.alternativeGroupNameColor,
    this.padding = const EdgeInsets.symmetric(vertical: 24, horizontal: 19),
  }) : super(key: key);

  final String? groupName;
  final List<Widget> children;
  final Color? alternativeGroupNameColor;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: R.shapes.radius_4,
        color: R.colors.cardBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (groupName != null)
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: Text(
                  groupName!,
                  style: TextStyle(
                    color: alternativeGroupNameColor ?? context.theme.colorScheme.secondary,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ...children
        ],
      ),
    );
  }
}

class SignOutDialog extends StatelessWidget {
  const SignOutDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: Keys.signOutDialog,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            Images.appLogo,
            height: 120,
            width: 120,
          ),
          const SizedBox(height: 10),
          Text(
            context.l10n.areYouSureYouWantToSignOut,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 25),
          CustomFormButton(
            key: Keys.signOutDialogAcceptButton,
            onTap: () {
              context.read<AuthenticationBloc>().add(AuthenticationLogoutRequested());
            },
            buttonText: context.l10n.signOut,
          ),
          const SizedBox(height: 10),
          CustomFormButton(
            key: Keys.signOutDialogCancelButton,
            onTap: Navigator.of(context).pop,
            buttonText: context.l10n.cancel,
            outlined: true,
          ),
        ],
      ),
    );
  }
}

class PickImageDialog extends StatelessWidget {
  const PickImageDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            FontAwesomeIcons.solidImage,
            size: 105,
            color: Colors.grey,
          ),
          const SizedBox(height: 15),
          Text(
            context.l10n.profilePhotoUpload,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 25),
          CustomFormButton(
            onTap: () {
              Navigator.of(context).pop(ImageSource.gallery);
            },
            buttonText: context.l10n.chooseFromGallery,
          ),
          const SizedBox(height: 10),
          CustomFormButton(
            onTap: () {
              Navigator.of(context).pop(ImageSource.camera);
            },
            buttonText: context.l10n.chooseFromCamera,
          ),
        ],
      ),
    );
  }
}

extension SettingsPresentationX on SettingsState {
  String localeToPrettyString(BuildContext context) {
    if (locale == 'en') return context.l10n.english;
    if (locale == 'sv') return context.l10n.swedish;
    return context.l10n.automatic;
  }
}
