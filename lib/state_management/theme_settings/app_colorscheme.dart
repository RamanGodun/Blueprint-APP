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

class OftenUsedInIOSColorsForApp {
  static const Color lightSnackBar = Color.fromARGB(255, 225, 225, 225);
  static const Color silver = Color(0xFF999A9B);
  static const Color lightGrey = Color(0xFF777777);
  static const Color shadow = Color(0xFF999A9B);
  static const Color grey = Color(0xFF666666);
  static const Color hover = Color(0xFF525559);
  static const Color lightHover = Color.fromARGB(255, 224, 227, 207);
  static const Color darkGrey1 = Color(0xFF3A3A3A);
  static const Color darkGrey2 = Color(0xFF454545);
  static const Color darkGrey3 = Color(0xFF343434);
  static const Color bottomNavBarUnselectedLight =
      Color.fromARGB(255, 193, 193, 193);
  static const Color black1 = Color(0xFF242424);
  static const Color black2 = Color(0xFF1F1F1F);
  static const Color black3 = Color(0xFF000000);
  static const Color black4 = Color(0xFF1B1B1B);

  static const Color alert = Color.fromARGB(255, 201, 76, 76);
  static const Color error = Colors.red;
}
