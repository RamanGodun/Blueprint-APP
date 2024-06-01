import 'package:flutter/material.dart';
import 'theme_builder.dart';
import 'themes_color_schemes.dart';

class ThisAppThemes {
// iOS Themes
  static final ThemeData kLightIOSTheme = ThisAppThemesBuilder.buildThemeData(
    isDark: false,
    colorScheme: ThisAppColors.kLightIOSColorScheme,
    scaffoldBackgroundColor: ThisAppColors.kLightIOSBackground,
    appBarBackgroundColor: ThisAppColors.kLightIOSBackground,
    barBackgroundColor:
        ThisAppColors.kLightIOSColorScheme.surface.withOpacity(0.3),
    dividerColor: ThisAppColors.kLightIOSColorScheme.onSurface.withOpacity(0.5),
    highlightColor: ThisAppColors.kPrimaryColor.withOpacity(0.3),
    splashColor: ThisAppColors.kPrimaryColor.withOpacity(0.2),
    tooltipColor: ThisAppColors.kPrimaryColor.withOpacity(0.9),
    tabBarIndicatorColor: ThisAppColors.kPrimaryColor,
    tabBarLabelColor: ThisAppColors.kLightIOSColorScheme.onPrimary,
    tabBarUnselectedLabelColor: ThisAppColors.kLightIOSColorScheme.onSurface,
  );

  static final ThemeData kDarkIOSTheme = ThisAppThemesBuilder.buildThemeData(
    isDark: true,
    colorScheme: ThisAppColors.kDarkIOSColorScheme,
    scaffoldBackgroundColor: ThisAppColors.kDarkIOSBackground,
    appBarBackgroundColor: ThisAppColors.kDarkIOSBackground,
    barBackgroundColor:
        ThisAppColors.kDarkIOSColorScheme.surface.withOpacity(0.5),
    dividerColor: ThisAppColors.kDarkIOSColorScheme.onSurface.withOpacity(0.5),
    highlightColor: ThisAppColors.kPrimaryColor.withOpacity(0.3),
    splashColor: ThisAppColors.kPrimaryColor.withOpacity(0.2),
    tooltipColor: ThisAppColors.kPrimaryColor.withOpacity(0.9),
    tabBarIndicatorColor: ThisAppColors.kPrimaryColor,
    tabBarLabelColor: ThisAppColors.kDarkIOSColorScheme.onPrimary,
    tabBarUnselectedLabelColor: ThisAppColors.kDarkIOSColorScheme.onSurface,
  );

  // Android Themes
  static final ThemeData kLightAndroidTheme =
      ThisAppThemesBuilder.buildThemeData(
    isDark: false,
    colorScheme: ThisAppColors.kLightAndroidColorScheme,
    scaffoldBackgroundColor: ThisAppColors.kLightAndroidBackground,
    appBarBackgroundColor: ThisAppColors.kLightAndroidColorScheme.surface,
    barBackgroundColor:
        ThisAppColors.kLightAndroidColorScheme.surface.withOpacity(0.3),
    dividerColor:
        ThisAppColors.kLightAndroidColorScheme.onSurface.withOpacity(0.5),
    highlightColor: ThisAppColors.kPrimaryColor.withOpacity(0.3),
    splashColor: ThisAppColors.kPrimaryColor.withOpacity(0.2),
    tooltipColor: ThisAppColors.kPrimaryColor.withOpacity(0.9),
    tabBarIndicatorColor: ThisAppColors.kPrimaryColor,
    tabBarLabelColor: ThisAppColors.kLightAndroidColorScheme.onPrimary,
    tabBarUnselectedLabelColor:
        ThisAppColors.kLightAndroidColorScheme.onSurface,
  );

  static final ThemeData kDarkAndroidTheme =
      ThisAppThemesBuilder.buildThemeData(
    isDark: true,
    colorScheme: ThisAppColors.kDarkAndroidColorScheme,
    scaffoldBackgroundColor: ThisAppColors.kDarkAndroidBackground,
    appBarBackgroundColor: ThisAppColors.kDarkAndroidColorScheme.surface,
    barBackgroundColor:
        ThisAppColors.kDarkAndroidColorScheme.surface.withOpacity(0.5),
    dividerColor:
        ThisAppColors.kDarkAndroidColorScheme.onSurface.withOpacity(0.5),
    highlightColor: ThisAppColors.kPrimaryColor.withOpacity(0.3),
    splashColor: ThisAppColors.kPrimaryColor.withOpacity(0.2),
    tooltipColor: ThisAppColors.kPrimaryColor.withOpacity(0.9),
    tabBarIndicatorColor: ThisAppColors.kPrimaryColor,
    tabBarLabelColor: ThisAppColors.kDarkAndroidColorScheme.onPrimary,
    tabBarUnselectedLabelColor: ThisAppColors.kDarkAndroidColorScheme.onSurface,
  );

  // Dark Glass Theme
  static final ThemeData kDarkGlassTheme = ThisAppThemesBuilder.buildThemeData(
    isDark: true,
    colorScheme: ThisAppColors.kDarkGlassColorScheme,
    scaffoldBackgroundColor:
        ThisAppColors.kDarkGlassBackground.withOpacity(0.9),
    appBarBackgroundColor: ThisAppColors.kDarkIOSBackground,
    barBackgroundColor:
        ThisAppColors.kDarkGlassColorScheme.surface.withOpacity(0.5),
    dividerColor:
        ThisAppColors.kDarkGlassColorScheme.onSurface.withOpacity(0.5),
    highlightColor: ThisAppColors.kPrimaryColor.withOpacity(0.3),
    splashColor: ThisAppColors.kPrimaryColor.withOpacity(0.2),
    tooltipColor: ThisAppColors.kPrimaryColor.withOpacity(0.9),
    tabBarIndicatorColor: ThisAppColors.kPrimaryColor,
    tabBarLabelColor: ThisAppColors.kDarkGlassColorScheme.onPrimary,
    tabBarUnselectedLabelColor: ThisAppColors.kDarkGlassColorScheme.onSurface,
  );
}

/*
1. проаналізуй свій останній код 
2. Проаналізуй дизайнерські патерни топових сучасних, стильних, мінімалістих додатків (і якщо потрібно підкоригуй код), щоб максимально відповідати вказаним критеріям:
1.  світла та темна теми IOS мають бути стильними, елегантними, повітряними, мінімалістичними, легкими, нативними-природними для IOS
2. світла та темна теми андроїд мають бути сучасними, молодіжними, обʼємними, глибокими, агресивними, чіткими
3. тема kDarkGlassTheme має бути ідентична як остання темна операційна темна система на айфонах (тобто легка, стильна, трішечки прозоро-скляна, мінімалістична, сучасна)
 */

