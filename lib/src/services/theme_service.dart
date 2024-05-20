import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../gen by easy_localization/locale_keys.g.dart';
import '../helpers/const.dart';

class ThemeService {
  late String lightThemeText;
  late String darkThemeText;
  late String systemThemeText;

  Future<void> loadLocaleTexts() async {
    lightThemeText = LocaleKeys.lightTheme.tr();
    darkThemeText = LocaleKeys.darkTheme.tr();
    systemThemeText = LocaleKeys.systemTheme.tr();
  }

  Future<ThemeMode> themeMode() async {
    await loadLocaleTexts();
    final prefs = await SharedPreferences.getInstance();
    final themeModeString =
        prefs.getString(AppConstants.themeModeKey) ?? 'system';
    return _themeModeFromString(themeModeString);
  }

  Future<void> updateThemeMode(ThemeMode theme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppConstants.themeModeKey, _themeModeToString(theme));
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
