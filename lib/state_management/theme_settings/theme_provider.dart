import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/0.service_locator.dart';
import '../const_data/app_const.dart';

enum CustomThemeMode {
  lightIOS,
  darkIOS,
  system,
  lightAndroid,
  darkAndroid,
  darkGlass
}

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
      case CustomThemeMode.lightIOS:
        return 'lightIOS';
      case CustomThemeMode.darkIOS:
        return 'darkIOS';
      case CustomThemeMode.lightAndroid:
        return 'lightAndroid';
      case CustomThemeMode.darkAndroid:
        return 'darkAndroid';
      case CustomThemeMode.darkGlass:
        return 'darkGlass';
      case CustomThemeMode.system:
      default:
        return 'system';
    }
  }

  CustomThemeMode _customThemeModeFromString(String themeModeString) {
    switch (themeModeString) {
      case 'lightIOS':
        return CustomThemeMode.lightIOS;
      case 'darkIOS':
        return CustomThemeMode.darkIOS;
      case 'lightAndroid':
        return CustomThemeMode.lightAndroid;
      case 'darkAndroid':
        return CustomThemeMode.darkAndroid;
      case 'darkGlass':
        return CustomThemeMode.darkGlass;
      case 'system':
      default:
        return CustomThemeMode.system;
    }
  }
}
