import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../src/services/0.service_locator.dart';
import '../const_data/app_const.dart';

class ThemeProvider extends ValueNotifier<ThemeMode> {
  static final ThemeProvider _instance = ThemeProvider._internal();
  static ThemeProvider get instance => _instance;

  final SharedPreferences prefs;

  ThemeProvider._internal()
      : prefs = DIServiceLocator.instance.get<SharedPreferences>(),
        super(ThemeMode.system);

  Future<void> loadSettings() async {
    final themeModeString = prefs.getString(AppConstants.themeModeKey);
    if (themeModeString != null) {
      value = _themeModeFromString(themeModeString);
    } else {
      value = ThemeMode.system;
    }
  }

  Future<void> updateThemeMode(ThemeMode newThemeMode) async {
    value = newThemeMode;
    await prefs.setString(
      AppConstants.themeModeKey,
      _themeModeToString(newThemeMode),
    );
  }

  String _themeModeToString(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.light:
        return 'light';
      case ThemeMode.dark:
        return 'dark';
      case ThemeMode.system:
      default:
        return 'system';
    }
  }

  ThemeMode _themeModeFromString(String themeModeString) {
    switch (themeModeString) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
      default:
        return ThemeMode.system;
    }
  }
}
