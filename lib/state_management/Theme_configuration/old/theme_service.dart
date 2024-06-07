// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class ThemeService extends ChangeNotifier {
//   late CupertinoThemeData _cupertinoTheme;
//   late CupertinoTextThemeData _cupertinoTextTheme;
//   late ThemeData _themeData;
//   late ColorScheme _colorScheme;
//   late TextTheme _textTheme;
//   late bool _isDarkMode;
//   late double _deviceWidth;
//   late double _deviceHeight;

//   void init(BuildContext context) {
//     _cupertinoTheme = CupertinoTheme.of(context);
//     _cupertinoTextTheme = _cupertinoTheme.textTheme;
//     _themeData = Theme.of(context);
//     _colorScheme = _themeData.colorScheme;
//     _textTheme = _themeData.textTheme;
//     _isDarkMode = _themeData.brightness == Brightness.dark;
//     final mediaQueryData = MediaQuery.of(context);
//     _deviceWidth = mediaQueryData.size.width;
//     _deviceHeight = mediaQueryData.size.height;
//     notifyListeners();
//   }

//   CupertinoThemeData get cupertinoTheme => _cupertinoTheme;
//   CupertinoTextThemeData get cupertinoTextTheme => _cupertinoTextTheme;
//   ThemeData get themeData => _themeData;
//   ColorScheme get colorScheme => _colorScheme;
//   TextTheme get textTheme => _textTheme;
//   bool get isDarkMode => _isDarkMode;
//   double get deviceWidth => _deviceWidth;
//   double get deviceHeight => _deviceHeight;
// }
