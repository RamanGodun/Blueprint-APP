import 'package:flutter/material.dart';
import 'App_colors_palette/this_app_color_schemes.dart';
import 'App_colors_palette/this_app_colors.dart';
import 'Themes_provider/theme_builder.dart';

class ThisAppThemes {
// iOS Themes
  static final ThemeData kLightIOSTheme = ThisAppThemesBuilder.buildThemeData(
    isDark: false,
    colorScheme: ThisAppColorSchemes.kLightIOSColorScheme,
    scaffoldBackgroundColor: ThisAppColors.kLightIOSBackground,
    appBarBackgroundColor: ThisAppColors.kLightIOSBackground,
    barBackgroundColor:
        ThisAppColorSchemes.kLightIOSColorScheme.surface.withOpacity(0.3),
    dividerColor:
        ThisAppColorSchemes.kLightIOSColorScheme.onSurface.withOpacity(0.5),
    highlightColor: ThisAppColors.kAppPrimaryColor.withOpacity(0.3),
    splashColor: ThisAppColors.kAppPrimaryColor.withOpacity(0.2),
    tooltipColor: ThisAppColors.kAppPrimaryColor.withOpacity(0.9),
    tabBarIndicatorColor: ThisAppColors.kAppPrimaryColor,
    tabBarLabelColor: ThisAppColorSchemes.kLightIOSColorScheme.onPrimary,
    tabBarUnselectedLabelColor:
        ThisAppColorSchemes.kLightIOSColorScheme.onSurface,
  );

  static final ThemeData kDarkIOSTheme = ThisAppThemesBuilder.buildThemeData(
    isDark: true,
    colorScheme: ThisAppColorSchemes.kDarkIOSColorScheme,
    scaffoldBackgroundColor: ThisAppColors.kDarkIOSBackground,
    appBarBackgroundColor: ThisAppColors.kDarkIOSBackground,
    barBackgroundColor:
        ThisAppColorSchemes.kDarkIOSColorScheme.surface.withOpacity(0.5),
    dividerColor:
        ThisAppColorSchemes.kDarkIOSColorScheme.onSurface.withOpacity(0.5),
    highlightColor: ThisAppColors.kAppPrimaryColor.withOpacity(0.3),
    splashColor: ThisAppColors.kAppPrimaryColor.withOpacity(0.2),
    tooltipColor: ThisAppColors.kAppPrimaryColor.withOpacity(0.9),
    tabBarIndicatorColor: ThisAppColors.kAppPrimaryColor,
    tabBarLabelColor: ThisAppColorSchemes.kDarkIOSColorScheme.onPrimary,
    tabBarUnselectedLabelColor:
        ThisAppColorSchemes.kDarkIOSColorScheme.onSurface,
  );

  // Android Themes
  static final ThemeData kLightAndroidTheme =
      ThisAppThemesBuilder.buildThemeData(
    isDark: false,
    colorScheme: ThisAppColorSchemes.kLightAndroidColorScheme,
    scaffoldBackgroundColor: ThisAppColors.kLightAndroidBackground,
    appBarBackgroundColor: ThisAppColorSchemes.kLightAndroidColorScheme.surface,
    barBackgroundColor:
        ThisAppColorSchemes.kLightAndroidColorScheme.surface.withOpacity(0.3),
    dividerColor:
        ThisAppColorSchemes.kLightAndroidColorScheme.onSurface.withOpacity(0.5),
    highlightColor: ThisAppColors.kAppPrimaryColor.withOpacity(0.3),
    splashColor: ThisAppColors.kAppPrimaryColor.withOpacity(0.2),
    tooltipColor: ThisAppColors.kAppPrimaryColor.withOpacity(0.9),
    tabBarIndicatorColor: ThisAppColors.kAppPrimaryColor,
    tabBarLabelColor: ThisAppColorSchemes.kLightAndroidColorScheme.onPrimary,
    tabBarUnselectedLabelColor:
        ThisAppColorSchemes.kLightAndroidColorScheme.onSurface,
  );

  static final ThemeData kDarkAndroidTheme =
      ThisAppThemesBuilder.buildThemeData(
    isDark: true,
    colorScheme: ThisAppColorSchemes.kDarkAndroidColorScheme,
    scaffoldBackgroundColor: ThisAppColors.kDarkAndroidBackground,
    appBarBackgroundColor: ThisAppColorSchemes.kDarkAndroidColorScheme.surface,
    barBackgroundColor:
        ThisAppColorSchemes.kDarkAndroidColorScheme.surface.withOpacity(0.5),
    dividerColor:
        ThisAppColorSchemes.kDarkAndroidColorScheme.onSurface.withOpacity(0.5),
    highlightColor: ThisAppColors.kAppPrimaryColor.withOpacity(0.3),
    splashColor: ThisAppColors.kAppPrimaryColor.withOpacity(0.2),
    tooltipColor: ThisAppColors.kAppPrimaryColor.withOpacity(0.9),
    tabBarIndicatorColor: ThisAppColors.kAppPrimaryColor,
    tabBarLabelColor: ThisAppColorSchemes.kDarkAndroidColorScheme.onPrimary,
    tabBarUnselectedLabelColor:
        ThisAppColorSchemes.kDarkAndroidColorScheme.onSurface,
  );

  // Dark Glass Theme
  static final ThemeData kDarkGlassTheme = ThisAppThemesBuilder.buildThemeData(
    isDark: true,
    colorScheme: ThisAppColorSchemes.kDarkGlassColorScheme,
    scaffoldBackgroundColor:
        ThisAppColors.kDarkGlassBackground.withOpacity(0.9),
    appBarBackgroundColor: ThisAppColors.kDarkIOSBackground,
    barBackgroundColor:
        ThisAppColorSchemes.kDarkGlassColorScheme.surface.withOpacity(0.5),
    dividerColor:
        ThisAppColorSchemes.kDarkGlassColorScheme.onSurface.withOpacity(0.5),
    highlightColor: ThisAppColors.kAppPrimaryColor.withOpacity(0.3),
    splashColor: ThisAppColors.kAppPrimaryColor.withOpacity(0.2),
    tooltipColor: ThisAppColors.kAppPrimaryColor.withOpacity(0.9),
    tabBarIndicatorColor: ThisAppColors.kAppPrimaryColor,
    tabBarLabelColor: ThisAppColorSchemes.kDarkGlassColorScheme.onPrimary,
    tabBarUnselectedLabelColor:
        ThisAppColorSchemes.kDarkGlassColorScheme.onSurface,
  );

/*MY Custom themes
 */
  static final ThemeData customDarkTheme = ThemeData(
    primaryColor: ThisAppColors.black1,
    canvasColor: ThisAppColors.black,
    hoverColor: ThisAppColors.hover,
    focusColor: ThisAppColors.white,
    shadowColor: ThisAppColors.shadow,
    indicatorColor: ThisAppColors.yellow1,
    primaryColorLight: ThisAppColors.yellow2.withOpacity(0.5),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: ThisAppColors.grey2,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: ThisAppColors.white,
      selectedIconTheme: IconThemeData(color: ThisAppColors.white),
      unselectedIconTheme: IconThemeData(color: ThisAppColors.hover),
      unselectedLabelStyle: TextStyle(color: ThisAppColors.lightGrey),
      selectedLabelStyle: TextStyle(color: ThisAppColors.white),
      showUnselectedLabels: false,
      backgroundColor: ThisAppColors.silver,
      elevation: 0,
    ),
    fontFamily: 'Montserrat',
    // тут можна додати інші параметри для цієї теми
  );

  static final ThemeData customLightTheme = ThemeData(
    primaryColor: ThisAppColors.amber2,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: ThisAppColors.grey1,
    ),
    fontFamily: 'Montserrat',
    focusColor: ThisAppColors.grey1.withOpacity(0.5),
    hoverColor: const Color.fromARGB(255, 224, 227, 207),
    indicatorColor: ThisAppColors.amber2,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: ThisAppColors.amber2,
    ),
    // тут можна додати інші параметри для цієї теми
  );

  // деякі константи для оформлення
  static const textInputDecoration = InputDecoration(
    labelStyle: TextStyle(
      color: ThisAppColors.white,
      fontWeight: FontWeight.w300,
    ),
    hintStyle: TextStyle(
      color: ThisAppColors.white,
      fontWeight: FontWeight.w300,
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: ThisAppColors.amber1,
        width: 0.5,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: ThisAppColors.amber1,
        width: 0.5,
      ),
    ),
  );
}

/*
1. проаналізуй свій останній код 
2. Проаналізуй дизайнерські патерни топових сучасних, стильних, мінімалістих додатків (і якщо потрібно підкоригуй код), щоб максимально відповідати вказаним критеріям:
1.  світла та темна теми IOS мають бути стильними, елегантними, повітряними, мінімалістичними, легкими, нативними-природними для IOS
2. світла та темна теми андроїд мають бути сучасними, молодіжними, обʼємними, глибокими, агресивними, чіткими
3. тема kDarkGlassTheme має бути ідентична як остання темна операційна темна система на айфонах (тобто легка, стильна, трішечки прозоро-скляна, мінімалістична, сучасна)
 */

