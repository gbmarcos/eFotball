import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fifa/src/common/domain/user/user.dart';
import 'package:fifa/src/common/services/shared_preferences.dart';
import 'package:flutter/material.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final Preferences preferences;

  SettingsCubit({required this.preferences}) : super(SettingsState.notLoaded()) {
    preferences.initPrefs().then((value) {
      emit(SettingsState(
        locale: preferences.locale,
      ));
    });
  }

  void updateLocale(String? newLocale) {
    if (newLocale == 'en' || newLocale == 'sv' || newLocale == null) {
      preferences.locale = newLocale;
      emit(SettingsState(locale: newLocale));
    }
  }

  void updateConsole(Console newConsole) {}
}
