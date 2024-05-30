import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../state_management/const_data/app_const.dart';
import '../generated code/by easy_localization/locale_keys.g.dart';

class ThemeService {
  late String lightThemeText;
  late String darkThemeText;
  late String systemThemeText;
  late SharedPreferences sharedPrefs;

  ThemeService() {
    _initialize();
  }

  Future<void> _initialize() async {
    sharedPrefs = GetIt.instance<SharedPreferences>();
    await loadLocaleTexts();
  }

  Future<void> loadLocaleTexts() async {
    lightThemeText = LocaleKeys.lightTheme.tr();
    darkThemeText = LocaleKeys.darkTheme.tr();
    systemThemeText = LocaleKeys.systemTheme.tr();
  }

  Future<ThemeMode> themeMode() async {
    final themeModeString =
        sharedPrefs.getString(AppConstants.themeModeKey) ?? 'system';
    return _themeModeFromString(themeModeString);
  }

  Future<void> updateThemeMode(ThemeMode theme) async {
    await sharedPrefs.setString(
        AppConstants.themeModeKey, _themeModeToString(theme));
  }

  String _themeModeToString(ThemeMode themeMode) {
    Map<ThemeMode, String> themeModeToString = {
      ThemeMode.light: lightThemeText,
      ThemeMode.dark: darkThemeText,
      ThemeMode.system: systemThemeText,
    };
    return themeModeToString[themeMode] ?? systemThemeText;
  }

  ThemeMode _themeModeFromString(String themeModeString) {
    Map<String, ThemeMode> stringToThemeMode = {
      lightThemeText: ThemeMode.light,
      darkThemeText: ThemeMode.dark,
      systemThemeText: ThemeMode.system,
    };
    return stringToThemeMode[themeModeString] ?? ThemeMode.system;
  }
}
