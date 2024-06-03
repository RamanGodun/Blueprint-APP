import 'package:flutter/material.dart';

abstract class ThisAppColors {
/* */
/* Primary and secondary colors*/
  static const Color kAppPrimaryColor = Color.fromARGB(199, 14, 117, 91);
  static const Color kPrimaryVariant = Color.fromARGB(199, 14, 117, 91);
  static final MaterialColor kPrimarySwatch =
      createMaterialColor(kAppPrimaryColor);
  static const Color kSecondaryColor = Color.fromARGB(255, 69, 127, 155);
  static const Color kSecondaryDarkColor = Color.fromARGB(198, 124, 170, 194);
  static const Color kSecondaryVariant = Color.fromARGB(198, 124, 170, 194);
/* Error colors*/
  static const Color kErrorColor = Color(0xFFB00020);
  static const Color kError2Color = Color.fromARGB(255, 207, 129, 129);
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

  // iOS light theme colors
  static const Color kLightIOSBackground = Color.fromARGB(246, 236, 232, 232);
  static const Color kLightIOSSurface = Color.fromARGB(255, 240, 234, 234);
  static const Color kLightIOSOnSurface = Color(0xFF1C1C1E);
  static const Color kLightIOSOnPrimary = Color(0xFFFFFFFF);

  // iOS dark theme colors
  static const Color kDarkIOSBackground = Color(0xFF1C1C1E);
  static const Color kDarkIOSSurface = Color(0xFF2C2C2E);
  static const Color kDarkIOSOnSurface = Color(0xFFD1D1D6);
  static const Color kDarkIOSOnPrimary = Color(0xFFFFFFFF);
  static const Color kDarkIOSGrey = Color.fromARGB(255, 153, 153, 153);

  // Android light theme colors
  static const Color kLightAndroidBackground = Color(0xFFFFFFFF);
  static const Color kLightAndroidSurface = Color(0xFFFFFFFF);
  static const Color kLightAndroidOnSurface = Color(0xFF000000);
  static const Color kLightAndroidOnPrimary = Color(0xFFFFFFFF);

  // Android dark theme colors
  static const Color kDarkAndroidBackground = Color(0xFF121212);
  static const Color kDarkAndroidSurface = Color(0xFF1F1F1F);
  static const Color kDarkAndroidOnSurface = Color(0xFFFFFFFF);
  static const Color kDarkAndroidOnPrimary = Color(0xFFFFFFFF);

  // Dark Glass theme colors
  static const Color kDarkGlassBackground = Color(0xFF1E1E1E);
  static const Color kDarkGlassSurface = Color(0xFF2A2A2A);
  static const Color kDarkGlassOnSurface = Color(0xFFD1D1D6);
  static const Color kDarkGlassOnPrimary = Color(0xFFFFFFFF);

/*Added
 */

  static const Color green = Color.fromARGB(177, 15, 108, 91);
  static Color black54 = Colors.black54.withOpacity(0.6);
  static final Color grey200 = Colors.grey.shade200;
  static final Color grey300 = Colors.grey.shade300;
  static final Color grey500 = Colors.grey.shade500;
  static final Color grey600 = Colors.grey.shade600;
  static final fon = const Color.fromARGB(117, 5, 6, 6).withOpacity(0.75);
  static final Color fon2 =
      const Color.fromARGB(255, 45, 45, 45).withOpacity(0.99);

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
//

  static const Color kOnSurfaceColor = Color.fromARGB(255, 75, 86, 87);
  static const Color kTertiaryColor = Color.fromARGB(255, 198, 199, 200);
  static const Color kSurfaceColorLight = Color(0xFFF5F5F5);
  static const Color kErrorColorDark = Color.fromARGB(255, 255, 180, 180);
  static const Color kOnSurfaceColorDark = Color.fromARGB(255, 145, 152, 143);
  static const Color kSurfaceColorDark = Color.fromARGB(255, 62, 61, 61);
  static const Color kSurfaceContainerHighestDark =
      Color.fromARGB(255, 46, 46, 46);
  static const Color kTertiaryColorDark = Color.fromARGB(255, 100, 100, 100);
  static const Color kScrimColorDark = Color.fromARGB(117, 5, 6, 6);
  static const Color kShadowColorDark = Color.fromARGB(255, 10, 10, 10);
}
