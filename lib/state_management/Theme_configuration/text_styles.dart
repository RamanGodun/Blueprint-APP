import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Src/Helpers/helpers.dart';

abstract class ThisAppTextStyles {
  static TextTheme kTextThemeData(bool isDarkTheme) {
    return GoogleFonts.montserratTextTheme().copyWith(
      titleLarge: _getTextStyle(isDarkTheme, FontWeight.w400, 22),
      titleMedium: _getTextStyle(isDarkTheme, FontWeight.w400, 19),
      titleSmall: _getTextStyle(isDarkTheme, FontWeight.w400, 16),
      bodyLarge: _getTextStyle(isDarkTheme, FontWeight.w400, 16),
      bodyMedium: _getTextStyle(isDarkTheme, FontWeight.w400, 14),
      bodySmall: _getTextStyle(isDarkTheme, FontWeight.w400, 12),
      labelLarge: _getTextStyle(isDarkTheme, FontWeight.w400, 14),
      labelMedium: _getTextStyle(isDarkTheme, FontWeight.w400, 12),
      labelSmall: _getTextStyle(isDarkTheme, FontWeight.w400, 11),
      displayLarge: _getTextStyle(isDarkTheme, FontWeight.w400, 25),
      displayMedium: _getTextStyle(isDarkTheme, FontWeight.w400, 22),
      displaySmall: _getTextStyle(isDarkTheme, FontWeight.w400, 19),
    );
  }

  static TextStyle _getTextStyle(
      bool isDarkTheme, FontWeight fontWeight, double fontSize) {
    return TextStyle(
      fontWeight: fontWeight,
      fontSize: fontSize,
    );
  }

  static TextStyle? bodyMedium(BuildContext context) {
    final textTheme = Helpers.textTheme(context);
    final colorScheme = Helpers.colorScheme(context);
    return textTheme.bodyMedium?.copyWith(
      color: colorScheme.onSurface,
      fontSize: 16.0,
    );
  }
}
