import 'package:flutter/material.dart';
import '../src/services/theme_service.dart';

class ThemeProvider extends ValueNotifier<ThemeMode> {
  final ThemeService _themeService = ThemeService();

  // Статичний екземпляр для зручного доступу
  static final ThemeProvider instance = ThemeProvider._internal();

  ThemeProvider._internal() : super(ThemeMode.system) {
    loadSettings();
  }

  Future<void> loadSettings() async {
    value = await _themeService.themeMode();
    notifyListeners();
  }

  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) return;
    if (newThemeMode == value) return;
    value = newThemeMode;
    notifyListeners();
    await _themeService.updateThemeMode(newThemeMode);
  }
}
