import 'package:flutter/material.dart';
import 'app_colorscheme.dart';
import 'text_style.dart';

class ThisAppThemes {
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

  static final ThemeData kGlassTheme = ThemeData.light().copyWith(
    primaryColor: ColorsForApp.black,
    colorScheme: const ColorScheme.light(),
    scaffoldBackgroundColor: ColorsForApp.white,
    indicatorColor: AdditionalColorsForApp.amber1,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: ColorsForApp.black,
        unselectedItemColor: AdditionalColorsForApp.bottomNavBarUnselectedLight,
        backgroundColor: Color.fromARGB(255, 255, 255, 255)),
    appBarTheme: const AppBarTheme(
      color: ColorsForApp.white,
      iconTheme: IconThemeData(color: ColorsForApp.black),
      elevation: 0,
    ),
    snackBarTheme: const SnackBarThemeData(
        backgroundColor: AdditionalColorsForApp.lightSnackBar,
        contentTextStyle:
            TextStyle(color: ColorsForApp.black, fontFamily: 'MA')),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontFamily: 'MA', color: ColorsForApp.black),
    ),
  );

  static final ThemeData kDarkGlassTheme1 = ThemeData.dark().copyWith(
    primaryColor: ColorsForApp.white,
    colorScheme: const ColorScheme.dark(),
    scaffoldBackgroundColor: ColorsForApp.background,
    indicatorColor: AdditionalColorsForApp.amber1,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: ColorsForApp.white,
        unselectedItemColor: AdditionalColorsForApp.hover,
        backgroundColor: ColorsForApp.background),
    appBarTheme: const AppBarTheme(
        elevation: 0, backgroundColor: ColorsForApp.background),
    snackBarTheme: const SnackBarThemeData(
        backgroundColor: Color.fromARGB(255, 51, 51, 51),
        contentTextStyle:
            TextStyle(color: ColorsForApp.white, fontFamily: 'MA')),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontFamily: 'MA', color: ColorsForApp.white),
    ),
  );

  static final ThemeData kDarkGlassTheme2 = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black.withOpacity(0.6),
    // Додайте інші налаштування для темної скляної теми 2
  );
}

class ColorsForApp {
  static const Color white = Colors.white;
  static const Color primary = Color(0xFFFFB100);
  static const Color background = Color(0xFF1B1B1B);
  static const Color black = Colors.black;
}
