import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const String _themeShPrefsKey = 'theme_preference';

  static Future<void> saveThemeModeInShPrefs(bool isDarkTheme) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_themeShPrefsKey, isDarkTheme);
  }

  static Future<bool> getThemeModeFromShPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool isDarkMode = prefs.getBool(_themeShPrefsKey) ?? false;
    return isDarkMode;
  }
}
