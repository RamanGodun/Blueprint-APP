import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color kAppPrimaryColor = Color.fromARGB(255, 15, 90, 71);
  static final MaterialColor kPrimarySwatch =
      createMaterialColor(kAppPrimaryColor);

  static const Color kSecondaryColor = Color.fromARGB(255, 69, 127, 155);
  static const Color kSecondaryDarkColor = Color.fromARGB(255, 124, 170, 194);
  static const Color kSecondaryVariant = Color.fromARGB(255, 124, 170, 194);

  static const Color green = Colors.green;
  static const Color kErrorColor = CupertinoColors.destructiveRed;
  static const Color kErrorColorDark = Color.fromARGB(255, 231, 122, 122);
  static const Color kOnErrorColor = Color.fromARGB(255, 3, 40, 34);

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

  static const Color buttonsColor = Color.fromARGB(255, 18, 55, 36);

  static const Color cupertinoBlackColor = CupertinoColors.black;
  static const Color transparent = Colors.transparent;
  static const Color inactiveGray = CupertinoColors.inactiveGray;

  static const Color kLightIOSBackground = Color.fromARGB(246, 236, 232, 232);
  static const Color kLightIOSSurface = Color.fromARGB(255, 240, 234, 234);
  static const Color kLightIOSOnSurface = Color(0xFF1C1C1E);
  static const Color kLightIOSOnPrimary = Color(0xFFFFFFFF);

  static const Color kDarkIOSBackground = Color(0xFF1C1C1E);
  static const Color kDarkIOSSurface = Color(0xFF2C2C2E);
  static const Color kDarkIOSOnSurface = Color(0xFFD1D1D6);
  static const Color kDarkIOSOnPrimary = Color(0xFFFFFFFF);
  static const Color kDarkIOSGrey = Color.fromARGB(255, 153, 153, 153);

  static const Color kLightAndroidBackground = Color(0xFFFFFFFF);
  static const Color kLightAndroidSurface = Color(0xFFFFFFFF);
  static const Color kLightAndroidOnSurface = Color(0xFF000000);
  static const Color kLightAndroidOnPrimary = Color(0xFFFFFFFF);

  static const Color kDarkAndroidBackground = Color(0xFF121212);
  static const Color kDarkAndroidSurface = Color(0xFF1F1F1F);
  static const Color kDarkAndroidOnSurface = Color(0xFFFFFFFF);
  static const Color kDarkAndroidOnPrimary = Color(0xFFFFFFFF);

  static const Color kDarkGlassBackground = Color(0xFF1E1E1E);
  static const Color kDarkGlassSurface = Color(0xFF2A2A2A);
  static const Color kDarkGlassOnSurface = Color(0xFFD1D1D6);
  static const Color kDarkGlassOnPrimary = Color(0xFFFFFFFF);

  static const List<Color> categoriesColors = [
    Color.fromARGB(198, 15, 108, 91),
    Color.fromARGB(167, 224, 132, 12),
    Color.fromARGB(255, 105, 130, 255),
    Color.fromARGB(255, 41, 148, 167),
    Color.fromARGB(245, 165, 67, 246),
    Color.fromARGB(255, 37, 113, 9),
    Color.fromARGB(255, 87, 179, 29),
    Color.fromARGB(240, 120, 56, 10),
    Color.fromARGB(255, 114, 110, 107)
  ];

  static const Color kSurfaceColorDark = Color.fromARGB(255, 62, 61, 61);

  static const Color white = Color(0xFFFFFFFF);
  static const Color silver = Color(0xFF999A9B);
  static const Color lightGrey = Color(0xFF777777);
  static const Color grey1 = Color(0xFF242424);
  static const Color grey2 = Color(0xFF666666);
  static const Color darkGrey1 = Color(0xFF3A3A3A);
  static const Color darkGrey2 = Color(0xFF454545);
  static const Color darkGrey3 = Color(0xFF343434);
  static const Color darkGrey4 = Color(0xFF1F1F1F);
  static const Color black1 = Color(0xFF000000);
  static const Color black = Color(0xFF1B1B1B);
  static const Color shadow = Color(0xFF999A9B);
  static const Color hover = Color(0xFF525559);
  static const Color black54 = Colors.black54;
  static final Color grey200 = Colors.grey.shade200;
  static final Color grey300 = Colors.grey.shade300;
  static final Color grey500 = Colors.grey.shade500;
  static final Color grey600 = Colors.grey.shade600;

  // Light custom iOS theme colors
  static const Color kLightCustomPrimaryContainer =
      Color.fromARGB(255, 90, 250, 167);
  static const Color kLightCustomSecondary = Color(0xFF34C759);
  static const Color kLightCustomSecondaryContainer = Color(0xFF4CD964);
  static const Color kLightCustomSurface = Color(0xFFFFFFFF);
  static const Color kLightCustomBackground = Color(0xFFF2F2F2);
  static const Color kLightCustomOnPrimary = Color(0xFFFFFFFF);
  static const Color kLightCustomOnSecondary = Color(0xFFFFFFFF);
  static const Color kLightCustomOnSurface = Color(0xFF1C1C1E);
  static const Color kLightCustomOnBackground = Color(0xFF1C1C1E);
  static const Color kLightCustomOnError = Color(0xFFFFFFFF);

  // Dark custom iOS theme colors
  static const Color kDarkCustomPrimaryContainer =
      Color.fromARGB(255, 85, 240, 155);
  static const Color kDarkCustomSecondary = Color(0xFF32D74B);
  static const Color kDarkCustomSecondaryContainer = Color(0xFF30D158);
  static const Color kDarkCustomSurface = Color(0xFF1C1C1E);
  static const Color kDarkCustomBackground = Color(0xFF2C2C2E);
  static const Color kDarkCustomOnPrimary = Color(0xFFFFFFFF);
  static const Color kDarkCustomOnSecondary = Color(0xFFFFFFFF);
  static const Color kDarkCustomOnSurface = Color(0xFFD1D1D6);
  static const Color kDarkCustomOnBackground = Color(0xFFD1D1D6);
  static const Color kDarkCustomOnError = Color(0xFFFFFFFF);
}
