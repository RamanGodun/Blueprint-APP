// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> uk_UA = {
    "appTitle": "Цей додаток",
    "darkIOSTheme": "Темна IOS тема",
    "darkAndroidTheme": "Темна андроїд тема",
    "darkGlassTheme": "Темна скляна тема",
    "lightAndroidTheme": "Світла андроїд тема",
    "goToTextfield": "До сторінки текст філда",
    "goToHiveBox": "До сторінки Hive",
    "lightIOSTheme": "світла IOS тема",
    "startScreen": "стартовий екран",
    "systemTheme": "Тема девайсу",
    "thisIsStartScreen": "Це стартовий екран"
  };
  static const Map<String, dynamic> en_US = {
    "appTitle": "This app",
    "darkIOSTheme": "Dark IOS theme",
    "darkAndroidTheme": "Dark android theme",
    "darkGlassTheme": "Dark-glassy theme2",
    "lightAndroidTheme": "Light android theme",
    "goToTextfield": "To textfield page",
    "goToHiveBox": "To Hive page",
    "lightIOSTheme": "Light IOS theme",
    "startScreen": "Start screen",
    "systemTheme": "System Theme",
    "thisIsStartScreen": "This is start screen"
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {
    "uk_UA": uk_UA,
    "en_US": en_US
  };
}
