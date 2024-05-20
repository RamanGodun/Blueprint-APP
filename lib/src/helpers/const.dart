import 'package:flutter/material.dart';
import '../gen by easy_localization/locale_keys.g.dart';

class AppConstants {
  static final List<ThemeMode> themeModes = [
    ThemeMode.system,
    ThemeMode.light,
    ThemeMode.dark,
  ];

  static final List<String> themeModeTexts = [
    LocaleKeys.systemTheme,
    LocaleKeys.lightTheme,
    LocaleKeys.darkTheme,
  ];

  static const String translationsPath = 'assets/translations/';
  static const String themeModeKey = 'themeMode';
}
