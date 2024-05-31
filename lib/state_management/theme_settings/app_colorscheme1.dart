import 'package:flutter/material.dart';

abstract class ThisAppColors {
  // Primary and secondary colors
  static const Color kPrimaryColor = Color.fromARGB(255, 7, 131, 143);
  static const Color kSecondaryColor = Color.fromARGB(255, 69, 127, 155);
  static const Color kSecondaryDarkColor = Color.fromARGB(198, 124, 170, 194);

  static const Color kPrimaryVariant = Color.fromARGB(199, 14, 117, 91);
  static const Color kSecondaryVariant = Color.fromARGB(198, 124, 170, 194);
  static const Color kErrorColor = Color(0xFFB00020);

  static MaterialColor createMaterialColor(Color color) {
    List<double> strengths = <double>[.05];
    final swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }

  static final MaterialColor kPrimarySwatch =
      createMaterialColor(kPrimaryColor);

  // iOS light theme colors
  static const Color kLightIOSBackground = Color(0xFFFFFFFF);
  static const Color kLightIOSSurface = Color(0xFFF0F0F0);
  static const Color kLightIOSOnSurface = Color(0xFF1C1C1E);
  static const Color kLightIOSOnPrimary = Color(0xFFFFFFFF);

  // iOS dark theme colors
  static const Color kDarkIOSBackground = Color(0xFF1C1C1E);
  static const Color kDarkIOSSurface = Color(0xFF2C2C2E);
  static const Color kDarkIOSOnSurface = Color(0xFFD1D1D6);
  static const Color kDarkIOSOnPrimary = Color(0xFFFFFFFF);
  static const Color kDarkIOSGrey = Color(0xFF8E8E93);

  // Android light theme colors
  static const Color kLightAndroidBackground = Color(0xFFFFFFFF);
  static const Color kLightAndroidSurface = Color(0xFFF5F5F5);
  static const Color kLightAndroidOnSurface = Color(0xFF000000);
  static const Color kLightAndroidOnPrimary = Color(0xFFFFFFFF);

  // Android dark theme colors
  static const Color kDarkAndroidBackground = Color(0xFF121212);
  static const Color kDarkAndroidSurface = Color(0xFF1F1F1F);
  static const Color kDarkAndroidOnSurface = Color(0xFFFFFFFF);
  static const Color kDarkAndroidOnPrimary = Color(0xFFFFFFFF);

  // Dark Glass theme colors
  static const Color kDarkGlassBackground = Color(0xFF1E1E1E);
  static final Color kDarkGlassSurface =
      const Color(0xFF2A2A2A).withOpacity(0.7);
  static const Color kDarkGlassOnSurface = Color(0xFFD1D1D6);
  static const Color kDarkGlassOnPrimary = Color(0xFFFFFFFF);

  // Color Schemes
  static final kLightIOSColorScheme = ColorScheme.fromSwatch(
    primarySwatch: kPrimarySwatch,
    accentColor: kSecondaryVariant,
    backgroundColor: ThisAppColors.kLightIOSBackground,
    errorColor: kErrorColor,
  ).copyWith(
    primaryContainer: kPrimaryColor.withOpacity(0.2),
    secondaryContainer: kSecondaryColor.withOpacity(0.2),
    surface: ThisAppColors.kLightIOSSurface,
    onPrimary: ThisAppColors.kLightIOSOnPrimary,
    onSecondary: ThisAppColors.kLightIOSOnPrimary,
    onSurface: ThisAppColors.kLightIOSOnSurface,
    onError: ThisAppColors.kLightIOSOnPrimary,
  );

  static final kDarkIOSColorScheme = ColorScheme.fromSwatch(
    brightness: Brightness.dark,
    primarySwatch: kPrimarySwatch,
    accentColor: kSecondaryVariant,
    backgroundColor: ThisAppColors.kDarkIOSBackground,
    errorColor: kErrorColor,
  ).copyWith(
    primaryContainer: kPrimaryColor.withOpacity(0.2),
    secondaryContainer: kSecondaryColor.withOpacity(0.2),
    surface: ThisAppColors.kDarkIOSSurface,
    onPrimary: ThisAppColors.kDarkIOSOnPrimary,
    onSecondary: ThisAppColors.kDarkIOSOnPrimary,
    onSurface: ThisAppColors.kDarkIOSOnSurface,
    onError: ThisAppColors.kDarkIOSOnPrimary,
    inverseSurface: ThisAppColors.kDarkIOSGrey,
  );

  static final kLightAndroidColorScheme = ColorScheme.fromSwatch(
    brightness: Brightness.light,
    primarySwatch: kPrimarySwatch,
    accentColor: kSecondaryVariant,
    backgroundColor: ThisAppColors.kLightAndroidBackground,
    errorColor: kErrorColor,
  ).copyWith(
    primaryContainer: kPrimaryColor.withOpacity(0.2),
    secondaryContainer: kSecondaryColor.withOpacity(0.2),
    surface: ThisAppColors.kLightAndroidSurface,
    onPrimary: ThisAppColors.kLightAndroidOnPrimary,
    onSecondary: ThisAppColors.kLightAndroidOnPrimary,
    onSurface: ThisAppColors.kLightAndroidOnSurface,
    onError: ThisAppColors.kLightAndroidOnPrimary,
  );

  static final kDarkAndroidColorScheme = ColorScheme.fromSwatch(
    brightness: Brightness.dark,
    primarySwatch: kPrimarySwatch,
    accentColor: kSecondaryVariant,
    backgroundColor: ThisAppColors.kDarkAndroidBackground,
    errorColor: kErrorColor,
  ).copyWith(
    primaryContainer: kPrimaryColor.withOpacity(0.2),
    secondaryContainer: kSecondaryColor.withOpacity(0.2),
    surface: ThisAppColors.kDarkAndroidSurface,
    onPrimary: ThisAppColors.kDarkAndroidOnPrimary,
    onSecondary: ThisAppColors.kDarkAndroidOnPrimary,
    onSurface: ThisAppColors.kDarkAndroidOnSurface,
    onError: ThisAppColors.kDarkAndroidOnPrimary,
  );

  static final kDarkGlassColorScheme = ColorScheme.fromSwatch(
    brightness: Brightness.dark,
    primarySwatch: kPrimarySwatch,
    accentColor: kSecondaryVariant,
    backgroundColor: ThisAppColors.kDarkGlassBackground,
    errorColor: kErrorColor,
  ).copyWith(
    primaryContainer: kPrimaryColor.withOpacity(0.2),
    secondaryContainer: kSecondaryColor.withOpacity(0.2),
    surface: ThisAppColors.kDarkGlassSurface,
    onPrimary: ThisAppColors.kDarkGlassOnPrimary,
    onSecondary: ThisAppColors.kDarkGlassOnPrimary,
    onSurface: ThisAppColors.kDarkGlassOnSurface,
    onError: ThisAppColors.kDarkGlassOnPrimary,
  );
}
