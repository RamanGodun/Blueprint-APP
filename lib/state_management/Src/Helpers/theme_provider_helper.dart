import '../../Models/app_enums.dart';

class ThemeProviderHelper {
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
