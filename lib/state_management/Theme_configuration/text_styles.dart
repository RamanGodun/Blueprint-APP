import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Src/Helpers/helpers.dart';

abstract class TextStyles4ThisAppThemes {
  static TextTheme kTextThemeData(bool isDarkTheme) {
    return GoogleFonts.montserratTextTheme().copyWith(
      titleLarge: _getTextStyle(isDarkTheme, FontWeight.w600, 22),
      titleMedium: _getTextStyle(isDarkTheme, FontWeight.w500, 19),
      titleSmall: _getTextStyle(isDarkTheme, FontWeight.w400, 16),
      bodyLarge: _getTextStyle(isDarkTheme, FontWeight.w400, 16),
      bodyMedium: _getTextStyle(isDarkTheme, FontWeight.w400, 14),
      bodySmall: _getTextStyle(isDarkTheme, FontWeight.w400, 12),
      labelLarge: _getTextStyle(isDarkTheme, FontWeight.w500, 14),
      labelMedium: _getTextStyle(isDarkTheme, FontWeight.w400, 12),
      labelSmall: _getTextStyle(isDarkTheme, FontWeight.w400, 11),
      displayLarge: _getTextStyle(isDarkTheme, FontWeight.w700, 25),
      displayMedium: _getTextStyle(isDarkTheme, FontWeight.w600, 22),
      displaySmall: _getTextStyle(isDarkTheme, FontWeight.w500, 19),
    );
  }

  static TextStyle _getTextStyle(
      bool isDarkTheme, FontWeight fontWeight, double fontSize) {
    return TextStyle(
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: isDarkTheme ? Colors.white : Colors.black,
    );
  }

  static CupertinoTextThemeData getCupertinoTextStyle(BuildContext context) {
    final colorScheme = Helpers.colorScheme(context);
    return CupertinoTextThemeData(
      primaryColor: colorScheme.onSurface,
      navTitleTextStyle: TextStyle(
        color: colorScheme.onSurface,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
