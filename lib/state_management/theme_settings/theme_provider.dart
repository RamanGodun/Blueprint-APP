import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../src/services/0.service_locator.dart';
import '../const_data/app_const.dart';

enum CustomThemeMode { light, dark, system, glass, darkGlass1, darkGlass2 }

class ThemeProvider extends ValueNotifier<CustomThemeMode> {
  static final ThemeProvider _instance = ThemeProvider._internal();
  static ThemeProvider get instance => _instance;

  final SharedPreferences prefs;

  ThemeProvider._internal()
      : prefs = DIServiceLocator.instance.get<SharedPreferences>(),
        super(CustomThemeMode.system);

  Future<void> loadSettings() async {
    final themeModeString = prefs.getString(AppConstants.themeModeKey);
    if (themeModeString != null) {
      value = _customThemeModeFromString(themeModeString);
    } else {
      value = CustomThemeMode.system;
    }
  }

  Future<void> updateThemeMode(CustomThemeMode newThemeMode) async {
    value = newThemeMode;
    await prefs.setString(
      AppConstants.themeModeKey,
      _customThemeModeToString(newThemeMode),
    );
  }

  String _customThemeModeToString(CustomThemeMode themeMode) {
    switch (themeMode) {
      case CustomThemeMode.light:
        return 'light';
      case CustomThemeMode.dark:
        return 'dark';
      case CustomThemeMode.glass:
        return 'glass';
      case CustomThemeMode.darkGlass1:
        return 'darkGlass1';
      case CustomThemeMode.darkGlass2:
        return 'darkGlass2';
      case CustomThemeMode.system:
      default:
        return 'system';
    }
  }

  CustomThemeMode _customThemeModeFromString(String themeModeString) {
    switch (themeModeString) {
      case 'light':
        return CustomThemeMode.light;
      case 'dark':
        return CustomThemeMode.dark;
      case 'glass':
        return CustomThemeMode.glass;
      case 'darkGlass1':
        return CustomThemeMode.darkGlass1;
      case 'darkGlass2':
        return CustomThemeMode.darkGlass2;
      case 'system':
      default:
        return CustomThemeMode.system;
    }
  }
}
