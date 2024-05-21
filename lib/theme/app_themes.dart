import 'package:flutter/material.dart';
import 'app_colorscheme.dart';
import 'text_style.dart';

class ThisAppDarkTheme {
  static final ThemeData kDarkTheme = ThemeData.dark().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: ThisAppColors.kColorDarkScheme,
    textTheme: ThisAppTextStyles.kTextThemeData(true),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ThisAppColors.kColorDarkScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      color: ThisAppColors.kDarkBackground,
      iconTheme: IconThemeData(color: ThisAppColors.kColorDarkScheme.onSurface),
      titleTextStyle:
          ThisAppTextStyles.kTextThemeData(true).titleLarge?.copyWith(
                color: ThisAppColors.kColorDarkScheme.onSurface,
              ),
      toolbarTextStyle:
          ThisAppTextStyles.kTextThemeData(true).bodyMedium?.copyWith(
                color: ThisAppColors.kColorDarkScheme.onSurface,
              ),
    ),
  );
}

class FIAppLightTheme {
  static final ThemeData kLightTheme = ThemeData.light().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: ThisAppColors.kColorScheme,
    textTheme: ThisAppTextStyles.kTextThemeData(false),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ThisAppColors.kColorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      color: ThisAppColors.kLightBackground,
      iconTheme: IconThemeData(color: ThisAppColors.kColorScheme.onSurface),
      titleTextStyle:
          ThisAppTextStyles.kTextThemeData(false).titleLarge?.copyWith(
                color: ThisAppColors.kColorScheme.onSurface,
              ),
      toolbarTextStyle:
          ThisAppTextStyles.kTextThemeData(false).bodyMedium?.copyWith(
                color: ThisAppColors.kColorScheme.onSurface,
              ),
    ),
    cardColor: ThisAppColors.kSurface,
    scaffoldBackgroundColor: ThisAppColors.kLightBackground,
    buttonTheme: ButtonThemeData(
      buttonColor: ThisAppColors.kAppPrimaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}
