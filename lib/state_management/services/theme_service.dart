import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeService {
  late CupertinoThemeData _cupertinoTheme;
  late CupertinoTextThemeData _cupertinoTextTheme;
  late ThemeData _themeData;
  late ColorScheme _colorScheme;
  late TextTheme _textTheme;
  late bool _isDarkMode;

  void init(BuildContext context) {
    _cupertinoTheme = CupertinoTheme.of(context);
    _cupertinoTextTheme = _cupertinoTheme.textTheme;
    _themeData = Theme.of(context);
    _colorScheme = _themeData.colorScheme;
    _textTheme = _themeData.textTheme;
    _isDarkMode = _themeData.brightness == Brightness.dark;
  }

  CupertinoThemeData get cupertinoTheme => _cupertinoTheme;
  CupertinoTextThemeData get cupertinoTextTheme => _cupertinoTextTheme;
  ThemeData get themeData => _themeData;
  ColorScheme get colorScheme => _colorScheme;
  TextTheme get textTheme => _textTheme;
  bool get isDarkMode => _isDarkMode;
}
