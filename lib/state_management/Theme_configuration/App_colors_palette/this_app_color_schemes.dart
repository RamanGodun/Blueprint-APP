import 'package:flutter/material.dart';
import 'this_app_colors.dart';

abstract class ThisAppColorSchemes {
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
    errorColor: ThisAppColors.kErrorColorDark,
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
    errorColor: ThisAppColors.kErrorColorDark,
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
    backgroundColor: ThisAppColors.kLightIOSBackground,
    errorColor: ThisAppColors.kErrorColor,
  ).copyWith(
    primary: ThisAppColors.kAppPrimaryColor,
    primaryContainer: ThisAppColors.kLightCustomPrimaryContainer,
    secondary: ThisAppColors.kLightCustomSecondary,
    secondaryContainer: ThisAppColors.kLightCustomSecondaryContainer,
    surface: ThisAppColors.kLightCustomSurface,
    onPrimary: ThisAppColors.kLightCustomOnPrimary,
    onSecondary: ThisAppColors.kLightCustomOnSecondary,
    onSurface: ThisAppColors.kLightCustomOnSurface,
    onError: ThisAppColors.kLightCustomOnError,
    brightness: Brightness.light,
  );

  /* MY CUSTOM DARK color Scheme */
  static final kColorDarkScheme = ColorScheme.fromSwatch(
    brightness: Brightness.dark,
    primarySwatch: ThisAppColors.kPrimarySwatch,
    accentColor: ThisAppColors.kSecondaryDarkColor,
    backgroundColor: ThisAppColors.kDarkCustomBackground,
    errorColor: ThisAppColors.kErrorColorDark,
  ).copyWith(
    primary: ThisAppColors.kAppPrimaryColor,
    primaryContainer: ThisAppColors.kDarkCustomPrimaryContainer,
    secondary: ThisAppColors.kDarkCustomSecondary,
    secondaryContainer: ThisAppColors.kDarkCustomSecondaryContainer,
    surface: ThisAppColors.kDarkCustomSurface,
    onPrimary: ThisAppColors.kDarkCustomOnPrimary,
    onSecondary: ThisAppColors.kDarkCustomOnSecondary,
    onSurface: ThisAppColors.kDarkCustomOnSurface,
    onError: ThisAppColors.kDarkCustomOnError,
    brightness: Brightness.dark,
  );
}
