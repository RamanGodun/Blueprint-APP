import 'package:flutter/material.dart';
import 'App_colors_palette/my_first_top_design.dart';
import 'App_colors_palette/this_app_color_schemes.dart';
import 'Themes_provider/theme_builder.dart';
import 'App_colors_palette/this_app_colors.dart';

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
    primaryColor: IOSDarkThemeColors.black1,
    canvasColor: IOSDarkThemeColors.black,
    hoverColor: IOSDarkThemeColors.hover,
    focusColor: IOSDarkThemeColors.white,
    shadowColor: IOSDarkThemeColors.shadow,
    indicatorColor: IOSDarkThemeColors.yellow1,
    primaryColorLight: IOSDarkThemeColors.yellow2.withOpacity(0.5),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: IOSDarkThemeColors.grey2,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: IOSDarkThemeColors.white,
      selectedIconTheme: IconThemeData(color: IOSDarkThemeColors.white),
      unselectedIconTheme: IconThemeData(color: IOSDarkThemeColors.hover),
      unselectedLabelStyle: TextStyle(color: IOSDarkThemeColors.lightGrey),
      selectedLabelStyle: TextStyle(color: IOSDarkThemeColors.white),
      showUnselectedLabels: false,
      backgroundColor: IOSDarkThemeColors.silver,
      elevation: 0,
    ),
    fontFamily: 'Montserrat',
    // тут можна додати інші параметри для цієї теми
  );

  static final ThemeData customLightTheme = ThemeData(
    primaryColor: IOSLightThemeColors.amber1,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: IOSLightThemeColors.grey1,
    ),
    fontFamily: 'Montserrat',
    focusColor: IOSLightThemeColors.grey1.withOpacity(0.5),
    hoverColor: const Color.fromARGB(255, 224, 227, 207),
    indicatorColor: IOSLightThemeColors.amber1,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: IOSLightThemeColors.amber1,
    ),
    // тут можна додати інші параметри для цієї теми
  );

  // деякі константи для оформлення
  static const textInputDecoration = InputDecoration(
    labelStyle: TextStyle(
      color: IOSDarkThemeColors.white,
      fontWeight: FontWeight.w300,
    ),
    hintStyle: TextStyle(
      color: IOSDarkThemeColors.white,
      fontWeight: FontWeight.w300,
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: IOSDarkThemeColors.amber1,
        width: 0.5,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: IOSDarkThemeColors.amber1,
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

