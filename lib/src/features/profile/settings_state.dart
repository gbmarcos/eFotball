part of 'settings_cubit.dart';

class SettingsState with EquatableMixin {
  final String? locale;

  SettingsState({this.locale});

  factory SettingsState.notLoaded() => SettingsState();

  Locale? get localeFromLanguageCode {
    if (locale != null) return Locale(locale!);
    return null;
  }

  @override
  List<Object?> get props => [locale];
}
