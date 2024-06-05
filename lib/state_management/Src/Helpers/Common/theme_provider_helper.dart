import 'package:flutter/material.dart';

import '../../../Models/app_enums.dart';
import '../../../Theme_configuration/configurations_of_themes.dart';

class ThemeProviderHelper {
  static ThemeData? getSelectedTheme(CustomThemeMode themeMode) {
    switch (themeMode) {
      case CustomThemeMode.lightIOS:
        return ThisAppThemes.kLightIOSTheme;
      case CustomThemeMode.darkIOS:
        return ThisAppThemes.kDarkIOSTheme;
      case CustomThemeMode.lightAndroid:
        return ThisAppThemes.kLightAndroidTheme;
      case CustomThemeMode.darkAndroid:
        return ThisAppThemes.kDarkAndroidTheme;
      case CustomThemeMode.darkGlass:
        return ThisAppThemes.kDarkGlassTheme;
      case CustomThemeMode.customLight:
        return ThisAppThemes.kLightCustomIOSTheme;
      case CustomThemeMode.customDark:
        return ThisAppThemes.kDarkGlassTheme;
      case CustomThemeMode.system:
      default:
        return ThisAppThemes.kLightIOSTheme;
    }
  }

  static String customThemeModeToString(CustomThemeMode themeMode) {
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
      case CustomThemeMode.customDark:
        return 'customDark';
      case CustomThemeMode.customLight:
        return 'customLight';
      case CustomThemeMode.system:
      default:
        return 'system';
    }
  }

  static CustomThemeMode customThemeModeFromString(String themeModeString) {
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
      case 'customDark':
        return CustomThemeMode.customDark;
      case 'customLight':
        return CustomThemeMode.customLight;
      case 'system':
      default:
        return CustomThemeMode.system;
    }
  }
}
