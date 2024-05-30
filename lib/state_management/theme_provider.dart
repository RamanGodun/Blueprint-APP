import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get_it/get_it.dart';
import '../src/generated code/by easy_localization/locale_keys.g.dart';
import '../state_management/const_data/app_const.dart';

class ThemeProvider extends ValueNotifier<ThemeMode> {
  static final ThemeProvider _instance = ThemeProvider._internal();
  static ThemeProvider get instance => _instance;

  final FlutterSecureStorage secureStorage;

  ThemeProvider._internal()
      : secureStorage = GetIt.instance<FlutterSecureStorage>(),
        super(ThemeMode.system) {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final themeModeString =
        await secureStorage.read(key: AppConstants.themeModeKey) ?? 'system';
    value = _themeModeFromString(themeModeString);
  }

  Future<void> updateThemeMode(ThemeMode newThemeMode) async {
    value = newThemeMode;
    await secureStorage.write(
      key: AppConstants.themeModeKey,
      value: _themeModeToString(newThemeMode),
    );
  }

  String _themeModeToString(ThemeMode themeMode) {
    Map<ThemeMode, String> themeModeToString = {
      ThemeMode.light: LocaleKeys.lightTheme.tr(),
      ThemeMode.dark: LocaleKeys.darkTheme.tr(),
      ThemeMode.system: LocaleKeys.systemTheme.tr(),
    };
    return themeModeToString[themeMode] ?? LocaleKeys.systemTheme.tr();
  }

  ThemeMode _themeModeFromString(String themeModeString) {
    Map<String, ThemeMode> stringToThemeMode = {
      LocaleKeys.lightTheme.tr(): ThemeMode.light,
      LocaleKeys.darkTheme.tr(): ThemeMode.dark,
      LocaleKeys.systemTheme.tr(): ThemeMode.system,
    };
    return stringToThemeMode[themeModeString] ?? ThemeMode.system;
  }
}
