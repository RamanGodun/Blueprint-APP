import 'package:flutter/material.dart';
import 'App_colors_schemes/this_app_color_schemes.dart';
import 'Themes_provider/theme_builder.dart';
import 'App_colors_schemes/this_app_colors.dart';

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
}

/*
1. проаналізуй свій останній код 
2. Проаналізуй дизайнерські патерни топових сучасних, стильних, мінімалістих додатків (і якщо потрібно підкоригуй код), щоб максимально відповідати вказаним критеріям:
1.  світла та темна теми IOS мають бути стильними, елегантними, повітряними, мінімалістичними, легкими, нативними-природними для IOS
2. світла та темна теми андроїд мають бути сучасними, молодіжними, обʼємними, глибокими, агресивними, чіткими
3. тема kDarkGlassTheme має бути ідентична як остання темна операційна темна система на айфонах (тобто легка, стильна, трішечки прозоро-скляна, мінімалістична, сучасна)
 */

