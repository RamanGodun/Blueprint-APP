import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colorscheme.dart';

abstract class ThisAppTextStyles {
  static final darkScheme = ThisAppColors.kColorDarkScheme;
  static final lightScheme = ThisAppColors.kColorScheme;

  static TextTheme kTextThemeData(bool isDarkTheme) {
    return GoogleFonts.montserratTextTheme().copyWith(
      titleLarge: _getTextStyle(isDarkTheme, FontWeight.w700, 22),
      titleMedium: _getTextStyle(isDarkTheme, FontWeight.w600, 19),
      titleSmall: _getTextStyle(isDarkTheme, FontWeight.w600, 16),
      bodyLarge: _getTextStyle(isDarkTheme, FontWeight.w400, 16),
      bodyMedium: _getTextStyle(isDarkTheme, FontWeight.w400, 14),
      bodySmall: _getTextStyle(isDarkTheme, FontWeight.w400, 12),
      labelLarge: _getTextStyle(isDarkTheme, FontWeight.w400, 14),
      labelMedium: _getTextStyle(isDarkTheme, FontWeight.w400, 12),
      labelSmall: _getTextStyle(isDarkTheme, FontWeight.w400, 11),
      displayLarge: _getTextStyle(isDarkTheme, FontWeight.w400, 25),
      displayMedium: _getTextStyle(isDarkTheme, FontWeight.w400, 22),
      displaySmall: _getTextStyle(isDarkTheme, FontWeight.w300, 19),
    );
  }

  static TextStyle _getTextStyle(
      bool isDarkTheme, FontWeight fontWeight, double fontSize) {
    return TextStyle(
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: _getTextColor(isDarkTheme, fontSize),
    );
  }

  static Color _getTextColor(bool isDarkTheme, double fontSize) {
    if (isDarkTheme) {
      return fontSize > 20 ? darkScheme.onSurface : darkScheme.onSurface;
    } else {
      return fontSize > 20 ? lightScheme.onSurface : lightScheme.onSurface;
    }
  }

  static TextStyle buttonTextStyle() {
    return const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 15,
      color: ThisAppColors.kAppPrimaryColor,
    );
  }
}
