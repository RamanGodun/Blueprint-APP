import 'package:flutter/material.dart';

abstract class ThisAppColors {
  static const Color kAppPrimaryColor = Color.fromARGB(255, 0, 138, 142);
  static const Color kSecondaryColor = Color.fromARGB(255, 45, 188, 220);
  static const Color kSecondaryDarkColor = Color(0xFF32D74B);
  static const Color kErrorColor = Color(0xFFFF3B30);
  static const Color kDarkBackground = Color(0xFF1C1C1E);
  static const Color kLightBackground = Color(0xFFF2F2F7);
  static const Color kOnTertiary = Colors.white;
  static const Color kOnBackgroundColor = Color(0xFF1C1C1E);
  static const Color kOnSurfaceColor = Color(0xFF1C1C1E);
  static const Color kSurface = Color(0xFFFFFFFF);
  static const Color kDarkSurface = Color.fromARGB(255, 30, 30, 30);
  static const Color kDarkOnSurface = Color(0xFFD1D1D6);
  static const Color kOnSecondary = Color(0xFFFFFFFF);
  static final Color dividerColor = Colors.grey[600]?.withOpacity(0.6) as Color;
  static final Color grey700 = Colors.grey[700] as Color;

  static MaterialColor createMaterialColor(Color color) {
    return MaterialColor(
      color.value,
      <int, Color>{
        50: color.withOpacity(0.1),
        100: color.withOpacity(0.2),
        200: color.withOpacity(0.3),
        300: color.withOpacity(0.4),
        400: color.withOpacity(0.5),
        500: color.withOpacity(0.6),
        600: color.withOpacity(0.7),
        700: color.withOpacity(0.8),
        800: color.withOpacity(0.9),
        900: color.withOpacity(0.95),
      },
    );
  }

  static final kColorScheme = const ColorScheme.light().copyWith(
    brightness: Brightness.light,
    error: kErrorColor,
    inversePrimary: Colors.white,
    inverseSurface: Colors.white,
    onError: kErrorColor,
    onPrimary: kAppPrimaryColor,
    onSurface: kOnSurfaceColor,
    primary: kAppPrimaryColor,
    secondary: kSecondaryColor,
    surface: kSurface,
    onSecondary: kOnSecondary,
    onTertiary: kOnTertiary,
  );

  static final kColorDarkScheme = const ColorScheme.dark().copyWith(
    brightness: Brightness.dark,
    error: kErrorColor,
    inversePrimary: Colors.white,
    inverseSurface: Colors.white,
    onError: kErrorColor,
    onPrimary: Colors.white,
    onSecondary: kOnSecondary,
    onSurface: kDarkOnSurface,
    onTertiary: kOnTertiary,
    primary: kAppPrimaryColor.withOpacity(0.9),
    secondary: kSecondaryDarkColor,
    surface: kDarkSurface,
  );
}
