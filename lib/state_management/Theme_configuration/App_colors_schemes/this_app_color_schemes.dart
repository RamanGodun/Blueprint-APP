import 'package:flutter/material.dart';

import 'this_app_colors.dart';

abstract class ThisAppColorSchemes {
/* */
  /* IOS LIGHT color Scheme */
  static final kLightIOSColorScheme = ColorScheme.fromSwatch(
    primarySwatch: ThisAppColors.kPrimarySwatch,
    accentColor: ThisAppColors.kSecondaryVariant,
    backgroundColor: ThisAppColors.kLightIOSBackground,
    errorColor: ThisAppColors.kErrorColor,
  ).copyWith(
    primaryContainer: ThisAppColors.kAppPrimaryColor.withOpacity(0.2),
    secondaryContainer: ThisAppColors.kSecondaryColor.withOpacity(0.2),
    surface: ThisAppColors.kLightIOSSurface,
    onPrimary: ThisAppColors.kLightIOSOnPrimary,
    onSecondary: ThisAppColors.kLightIOSOnPrimary,
    onSurface: ThisAppColors.kLightIOSOnSurface,
    onError: ThisAppColors.kLightIOSOnPrimary,
  );

  /* IOS DARK color Scheme */
  static final kDarkIOSColorScheme = ColorScheme.fromSwatch(
    brightness: Brightness.dark,
    primarySwatch: ThisAppColors.kPrimarySwatch,
    accentColor: ThisAppColors.kSecondaryVariant,
    backgroundColor: ThisAppColors.kDarkIOSBackground,
    errorColor: ThisAppColors.kErrorColor,
  ).copyWith(
    primaryContainer: ThisAppColors.kAppPrimaryColor.withOpacity(0.2),
    secondaryContainer: ThisAppColors.kSecondaryColor.withOpacity(0.2),
    surface: ThisAppColors.kDarkIOSSurface,
    onPrimary: ThisAppColors.kDarkIOSOnPrimary,
    onSecondary: ThisAppColors.kDarkIOSOnPrimary,
    onSurface: ThisAppColors.kDarkIOSOnSurface,
    onError: ThisAppColors.kDarkIOSOnPrimary,
    inverseSurface: ThisAppColors.kDarkIOSGrey,
  );

  /* ANDROID LIGHT color Scheme */
  static final kLightAndroidColorScheme = ColorScheme.fromSwatch(
    brightness: Brightness.light,
    primarySwatch: ThisAppColors.kPrimarySwatch,
    accentColor: ThisAppColors.kSecondaryVariant,
    backgroundColor: ThisAppColors.kLightAndroidBackground,
    errorColor: ThisAppColors.kErrorColor,
  ).copyWith(
    primaryContainer: ThisAppColors.kAppPrimaryColor.withOpacity(0.2),
    secondaryContainer: ThisAppColors.kSecondaryColor.withOpacity(0.2),
    surface: ThisAppColors.kLightAndroidSurface,
    onPrimary: ThisAppColors.kLightAndroidOnPrimary,
    onSecondary: ThisAppColors.kLightAndroidOnPrimary,
    onSurface: ThisAppColors.kLightAndroidOnSurface,
    onError: ThisAppColors.kLightAndroidOnPrimary,
  );

  /* ANDROID DARK color Scheme */
  static final kDarkAndroidColorScheme = ColorScheme.fromSwatch(
    brightness: Brightness.dark,
    primarySwatch: ThisAppColors.kPrimarySwatch,
    accentColor: ThisAppColors.kSecondaryVariant,
    backgroundColor: ThisAppColors.kDarkAndroidBackground,
    errorColor: ThisAppColors.kErrorColor,
  ).copyWith(
    primaryContainer: ThisAppColors.kAppPrimaryColor.withOpacity(0.2),
    secondaryContainer: ThisAppColors.kSecondaryColor.withOpacity(0.2),
    surface: ThisAppColors.kDarkAndroidSurface,
    onPrimary: ThisAppColors.kDarkAndroidOnPrimary,
    onSecondary: ThisAppColors.kDarkAndroidOnPrimary,
    onSurface: ThisAppColors.kDarkAndroidOnSurface,
    onError: ThisAppColors.kDarkAndroidOnPrimary,
  );

  /* HALF-GLASSY IOS DARK color Scheme */
  static final kDarkGlassColorScheme = ColorScheme.fromSwatch(
    brightness: Brightness.dark,
    primarySwatch: ThisAppColors.kPrimarySwatch,
    accentColor: ThisAppColors.kSecondaryVariant,
    backgroundColor: ThisAppColors.kDarkGlassBackground,
    errorColor: ThisAppColors.kErrorColor,
  ).copyWith(
    primaryContainer: ThisAppColors.kAppPrimaryColor.withOpacity(0.2),
    secondaryContainer: ThisAppColors.kSecondaryColor.withOpacity(0.2),
    surface: ThisAppColors.kDarkGlassSurface,
    onPrimary: ThisAppColors.kDarkGlassOnPrimary,
    onSecondary: ThisAppColors.kDarkGlassOnPrimary,
    onSurface: ThisAppColors.kDarkGlassOnSurface,
    onError: ThisAppColors.kDarkGlassOnPrimary,
  );

/* MY CUSTOM LIGHT color Scheme */
  static final kColorScheme = ColorScheme.fromSwatch(
    brightness: Brightness.light,
    primarySwatch: ThisAppColors.kPrimarySwatch,
    accentColor: ThisAppColors.kSecondaryColor,
    backgroundColor: ThisAppColors.kSurfaceColorLight,
    errorColor: ThisAppColors.kError2Color,
  ).copyWith(
    primary: ThisAppColors.kAppPrimaryColor,
    primaryContainer: ThisAppColors.kAppPrimaryColor,
    secondary: ThisAppColors.kSecondaryColor,
    secondaryContainer: ThisAppColors.kSecondaryColor,
    surface: ThisAppColors.kSurfaceColorLight,
    surfaceTint: Colors.white,
    surfaceContainerHighest: Colors.white,
    error: ThisAppColors.kError2Color,
    errorContainer: ThisAppColors.kErrorColor,
    onError: ThisAppColors.kOnErrorColor,
    onErrorContainer: ThisAppColors.kOnErrorColor,
    onPrimary: Colors.white,
    onPrimaryContainer: Colors.white,
    onSecondary: Colors.white,
    onSurface: ThisAppColors.kOnSurfaceColor,
    onSurfaceVariant: ThisAppColors.kOnSurfaceColor,
    tertiary: ThisAppColors.kTertiaryColor,
    tertiaryContainer: ThisAppColors.kTertiaryColor,
    inversePrimary: Colors.white,
    inverseSurface: Colors.white,
    onInverseSurface: const Color.fromARGB(255, 255, 255, 255),
  );

/* MY CUSTOM DARK color Scheme */
  static final kColorDarkScheme = ColorScheme.fromSwatch(
    brightness: Brightness.dark,
    primarySwatch: ThisAppColors.kPrimarySwatch,
    accentColor: ThisAppColors.kSecondaryDarkColor,
    backgroundColor: ThisAppColors.kSurfaceColorDark,
    errorColor: ThisAppColors.kErrorColorDark,
  ).copyWith(
    primary: ThisAppColors.kAppPrimaryColor.withOpacity(0.9),
    primaryContainer: ThisAppColors.kAppPrimaryColor.withOpacity(0.8),
    secondary: ThisAppColors.kSecondaryDarkColor,
    secondaryContainer: ThisAppColors.kSecondaryDarkColor.withOpacity(0.8),
    surface: ThisAppColors.kSurfaceColorDark.withOpacity(0.95),
    surfaceTint: Colors.white,
    surfaceContainerHighest: ThisAppColors.kSurfaceContainerHighestDark,
    error: ThisAppColors.kErrorColorDark,
    errorContainer: ThisAppColors.kErrorColorDark,
    onError: ThisAppColors.kOnErrorColor,
    onErrorContainer: ThisAppColors.kOnErrorColor,
    onPrimary: Colors.white,
    onPrimaryContainer: Colors.white,
    onSecondary: const Color.fromARGB(255, 192, 192, 192),
    onSecondaryContainer: const Color.fromARGB(255, 192, 192, 192),
    onSurface: ThisAppColors.kOnSurfaceColorDark,
    onSurfaceVariant: const Color.fromARGB(255, 115, 115, 115),
    tertiary: ThisAppColors.kTertiaryColorDark,
    tertiaryContainer: ThisAppColors.kTertiaryColorDark,
    inversePrimary: Colors.white,
    inverseSurface: Colors.white,
    onInverseSurface: const Color.fromARGB(255, 115, 115, 115),
    outline: const Color.fromARGB(255, 192, 192, 192),
    outlineVariant: const Color.fromARGB(255, 192, 192, 192),
    scrim: ThisAppColors.kScrimColorDark,
    shadow: ThisAppColors.kShadowColorDark,
  );
}
