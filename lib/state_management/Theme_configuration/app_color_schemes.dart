import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract class ThisAppColorSchemes {
  /* IOS LIGHT color Scheme */
  static final kLightIOSColorScheme = ColorScheme.fromSwatch(
    primarySwatch: AppColors.kPrimarySwatch,
    accentColor: AppColors.kSecondaryVariant,
    backgroundColor: AppColors.kLightIOSBackground,
    errorColor: AppColors.kErrorColor,
  ).copyWith(
    primaryContainer: AppColors.kAppPrimaryColor.withOpacity(0.2),
    secondaryContainer: AppColors.kSecondaryColor.withOpacity(0.2),
    surface: AppColors.kLightIOSSurface,
    onPrimary: AppColors.kLightIOSOnPrimary,
    onSecondary: AppColors.kLightIOSOnPrimary,
    onSurface: AppColors.kLightIOSOnSurface,
    onError: AppColors.kLightIOSOnPrimary,
  );

  /* IOS DARK color Scheme */
  static final kDarkIOSColorScheme = ColorScheme.fromSwatch(
    brightness: Brightness.dark,
    primarySwatch: AppColors.kPrimarySwatch,
    accentColor: AppColors.kSecondaryVariant,
    backgroundColor: AppColors.kDarkIOSBackground,
    errorColor: AppColors.kErrorColorDark,
  ).copyWith(
    primaryContainer: AppColors.kAppPrimaryColor.withOpacity(0.2),
    secondaryContainer: AppColors.kSecondaryColor.withOpacity(0.2),
    surface: AppColors.kDarkIOSSurface,
    onPrimary: AppColors.kDarkIOSOnPrimary,
    onSecondary: AppColors.kDarkIOSOnPrimary,
    onSurface: AppColors.kDarkIOSOnSurface,
    onError: AppColors.kDarkIOSOnPrimary,
    inverseSurface: AppColors.kDarkIOSGrey,
  );

  /* ANDROID LIGHT color Scheme */
  static final kLightAndroidColorScheme = ColorScheme.fromSwatch(
    brightness: Brightness.light,
    primarySwatch: AppColors.kPrimarySwatch,
    accentColor: AppColors.kSecondaryVariant,
    backgroundColor: AppColors.kLightAndroidBackground,
    errorColor: AppColors.kErrorColor,
  ).copyWith(
    primaryContainer: AppColors.kAppPrimaryColor.withOpacity(0.2),
    secondaryContainer: AppColors.kSecondaryColor.withOpacity(0.2),
    surface: AppColors.kLightAndroidSurface,
    onPrimary: AppColors.kLightAndroidOnPrimary,
    onSecondary: AppColors.kLightAndroidOnPrimary,
    onSurface: AppColors.kLightAndroidOnSurface,
    onError: AppColors.kLightAndroidOnPrimary,
  );

  /* ANDROID DARK color Scheme */
  static final kDarkAndroidColorScheme = ColorScheme.fromSwatch(
    brightness: Brightness.dark,
    primarySwatch: AppColors.kPrimarySwatch,
    accentColor: AppColors.kSecondaryVariant,
    backgroundColor: AppColors.kDarkAndroidBackground,
    errorColor: AppColors.kErrorColor,
  ).copyWith(
    primaryContainer: AppColors.kAppPrimaryColor.withOpacity(0.2),
    secondaryContainer: AppColors.kSecondaryColor.withOpacity(0.2),
    surface: AppColors.kDarkAndroidSurface,
    onPrimary: AppColors.kDarkAndroidOnPrimary,
    onSecondary: AppColors.kDarkAndroidOnPrimary,
    onSurface: AppColors.kDarkAndroidOnSurface,
    onError: AppColors.kDarkAndroidOnPrimary,
    error: AppColors.kErrorColor,
  );

  /* HALF-GLASSY IOS DARK color Scheme */
  static final kDarkGlassColorScheme = ColorScheme.fromSwatch(
    brightness: Brightness.dark,
    primarySwatch: AppColors.kPrimarySwatch,
    accentColor: AppColors.kSecondaryVariant,
    backgroundColor: AppColors.kDarkGlassBackground,
    errorColor: AppColors.kErrorColorDark,
  ).copyWith(
    primaryContainer: AppColors.kAppPrimaryColor.withOpacity(0.2),
    secondaryContainer: AppColors.kSecondaryColor.withOpacity(0.2),
    surface: AppColors.kDarkGlassSurface,
    onPrimary: AppColors.kDarkGlassOnPrimary,
    onSecondary: AppColors.kDarkGlassOnPrimary,
    onSurface: AppColors.kDarkGlassOnSurface,
    onError: AppColors.kDarkGlassOnPrimary,
  );

  /* MY CUSTOM LIGHT color Scheme */
  static final kColorScheme = ColorScheme.fromSwatch(
    brightness: Brightness.light,
    primarySwatch: AppColors.kPrimarySwatch,
    accentColor: AppColors.kSecondaryColor,
    backgroundColor: AppColors.kLightIOSBackground,
    errorColor: AppColors.kErrorColor,
  ).copyWith(
    primary: AppColors.kAppPrimaryColor,
    primaryContainer: AppColors.kLightCustomPrimaryContainer,
    secondary: AppColors.kLightCustomSecondary,
    secondaryContainer: AppColors.kLightCustomSecondaryContainer,
    surface: AppColors.kLightCustomSurface,
    onPrimary: AppColors.kLightCustomOnPrimary,
    onSecondary: AppColors.kLightCustomOnSecondary,
    onSurface: AppColors.kLightCustomOnSurface,
    onError: AppColors.kLightCustomOnError,
    brightness: Brightness.light,
  );

  /* MY CUSTOM DARK color Scheme */
  static final kColorDarkScheme = ColorScheme.fromSwatch(
    brightness: Brightness.dark,
    primarySwatch: AppColors.kPrimarySwatch,
    accentColor: AppColors.kSecondaryDarkColor,
    backgroundColor: AppColors.kDarkCustomBackground,
    errorColor: AppColors.kErrorColorDark,
  ).copyWith(
    primary: AppColors.kAppPrimaryColor,
    primaryContainer: AppColors.kDarkCustomPrimaryContainer,
    secondary: AppColors.kDarkCustomSecondary,
    secondaryContainer: AppColors.kDarkCustomSecondaryContainer,
    surface: AppColors.kDarkCustomSurface,
    onPrimary: AppColors.kDarkCustomOnPrimary,
    onSecondary: AppColors.kDarkCustomOnSecondary,
    onSurface: AppColors.kDarkCustomOnSurface,
    onError: AppColors.kDarkCustomOnError,
    brightness: Brightness.dark,
  );
}
