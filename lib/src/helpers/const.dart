import 'package:flutter/material.dart';
import '../localization/gen by easy_localization/locale_keys.g.dart';

class AppConstants {
  static final List<ThemeMode> themeModes = [
    ThemeMode.system,
    ThemeMode.light,
    ThemeMode.dark,
  ];

  static final List<String> themeModeTexts = [
    LocaleKeys.systemTheme,
    LocaleKeys.lightTheme,
    LocaleKeys.darkTheme,
  ];

  static const String translationsPath = 'assets/translations/';
  static const String themeModeKey = 'themeMode';
}


/*
SHA1: B4:B8:74:26:A4:86:04:3A:74:B6:30:22:B8:83:A2:95:8F:2E:40:89
SHA256: 31:75:61:7C:77:FA:74:94:E3:9A:B2:47:6A:4C:DF:50:48:0A:07:83:E9:D3:42:C9:EF:F6:51:18:FC:A9:FE:BA

Platform  Firebase App Id
web       1:120549187583:web:e7834fb833f547cf8591ca
android   1:120549187583:android:3ac2d7a1758ad0ba8591ca
ios       1:120549187583:ios:b0f35ed7a2f8cc8a8591ca
macos     1:120549187583:ios:b9b99ff954a431f98591ca
 */