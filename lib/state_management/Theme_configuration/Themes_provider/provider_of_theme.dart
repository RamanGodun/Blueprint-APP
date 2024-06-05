import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Const_data/app_const.dart';
import '../../Models/app_enums.dart';
import '../../Services/0.service_locator.dart';
import '../../Src/Helpers/theme_provider_helper.dart';

class ThemeProvider extends ValueNotifier<CustomThemeMode> {
  static final ThemeProvider _instance = ThemeProvider._internal();
  static ThemeProvider get instance => _instance;

  final SharedPreferences prefs;

  ThemeProvider._internal()
      : prefs = DIServiceLocator.instance.get<SharedPreferences>(),
        super(CustomThemeMode.system);

  // Ініціалізація themeProvider ліниво
  static ThemeProvider? _lazyInstance;
  static ThemeProvider get lazyInstance {
    _lazyInstance ??= ThemeProvider._internal();
    return _lazyInstance!;
  }

  Future<void> loadSettings() async {
    final themeModeString = prefs.getString(AppConstants.themeModeKey);
    if (themeModeString != null) {
      value = ThemeProviderHelper.customThemeModeFromString(themeModeString);
    } else {
      value = CustomThemeMode.system;
    }
  }

  Future<void> updateThemeMode(CustomThemeMode newThemeMode) async {
    value = newThemeMode;
    await prefs.setString(
      AppConstants.themeModeKey,
      ThemeProviderHelper.customThemeModeToString(newThemeMode),
    );
  }
}
