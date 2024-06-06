import 'package:flutter/material.dart';
import 'this_app_color_schemes.dart';
import 'this_app_colors.dart';
import 'Themes_provider/theme_builder.dart';

class ThisAppThemes {
  // iOS Themes
  static final ThemeData kLightIOSTheme = ThisAppThemesBuilder.buildThemeData(
    isDark: false,
    colorScheme: ThisAppColorSchemes.kLightIOSColorScheme,
    scaffoldBackgroundColor: AppColors.kLightIOSBackground,
    appBarBackgroundColor: AppColors.kLightIOSBackground,
    barBackgroundColor:
        ThisAppColorSchemes.kLightIOSColorScheme.surface.withOpacity(0.3),
    dividerColor:
        ThisAppColorSchemes.kLightIOSColorScheme.onSurface.withOpacity(0.5),
    highlightColor: AppColors.kAppPrimaryColor.withOpacity(0.3),
    splashColor: AppColors.kAppPrimaryColor.withOpacity(0.2),
    tooltipColor: AppColors.kAppPrimaryColor.withOpacity(0.9),
    tabBarIndicatorColor: AppColors.kAppPrimaryColor,
    tabBarLabelColor: ThisAppColorSchemes.kLightIOSColorScheme.onPrimary,
    tabBarUnselectedLabelColor:
        ThisAppColorSchemes.kLightIOSColorScheme.onSurface,
  );

  static final ThemeData kDarkIOSTheme = ThisAppThemesBuilder.buildThemeData(
    isDark: true,
    colorScheme: ThisAppColorSchemes.kDarkIOSColorScheme,
    scaffoldBackgroundColor: AppColors.kDarkIOSBackground,
    appBarBackgroundColor: AppColors.kDarkIOSBackground,
    barBackgroundColor:
        ThisAppColorSchemes.kDarkIOSColorScheme.surface.withOpacity(0.5),
    dividerColor:
        ThisAppColorSchemes.kDarkIOSColorScheme.onSurface.withOpacity(0.5),
    highlightColor: AppColors.kAppPrimaryColor.withOpacity(0.3),
    splashColor: AppColors.kAppPrimaryColor.withOpacity(0.2),
    tooltipColor: AppColors.kAppPrimaryColor.withOpacity(0.9),
    tabBarIndicatorColor: AppColors.kAppPrimaryColor,
    tabBarLabelColor: ThisAppColorSchemes.kDarkIOSColorScheme.onPrimary,
    tabBarUnselectedLabelColor:
        ThisAppColorSchemes.kDarkIOSColorScheme.onSurface,
  );

  // Android Themes
  static final ThemeData kLightAndroidTheme =
      ThisAppThemesBuilder.buildThemeData(
    isDark: false,
    colorScheme: ThisAppColorSchemes.kLightAndroidColorScheme,
    scaffoldBackgroundColor: AppColors.kLightAndroidBackground,
    appBarBackgroundColor: ThisAppColorSchemes.kLightAndroidColorScheme.surface,
    barBackgroundColor:
        ThisAppColorSchemes.kLightAndroidColorScheme.surface.withOpacity(0.3),
    dividerColor:
        ThisAppColorSchemes.kLightAndroidColorScheme.onSurface.withOpacity(0.5),
    highlightColor: AppColors.kAppPrimaryColor.withOpacity(0.3),
    splashColor: AppColors.kAppPrimaryColor.withOpacity(0.2),
    tooltipColor: AppColors.kAppPrimaryColor.withOpacity(0.9),
    tabBarIndicatorColor: AppColors.kAppPrimaryColor,
    tabBarLabelColor: ThisAppColorSchemes.kLightAndroidColorScheme.onPrimary,
    tabBarUnselectedLabelColor:
        ThisAppColorSchemes.kLightAndroidColorScheme.onSurface,
  );

  static final ThemeData kDarkAndroidTheme =
      ThisAppThemesBuilder.buildThemeData(
    isDark: true,
    colorScheme: ThisAppColorSchemes.kDarkAndroidColorScheme,
    scaffoldBackgroundColor: AppColors.kDarkAndroidBackground,
    appBarBackgroundColor: ThisAppColorSchemes.kDarkAndroidColorScheme.surface,
    barBackgroundColor:
        ThisAppColorSchemes.kDarkAndroidColorScheme.surface.withOpacity(0.5),
    dividerColor:
        ThisAppColorSchemes.kDarkAndroidColorScheme.onSurface.withOpacity(0.5),
    highlightColor: AppColors.kAppPrimaryColor.withOpacity(0.3),
    splashColor: AppColors.kAppPrimaryColor.withOpacity(0.2),
    tooltipColor: AppColors.kAppPrimaryColor.withOpacity(0.9),
    tabBarIndicatorColor: AppColors.kAppPrimaryColor,
    tabBarLabelColor: ThisAppColorSchemes.kDarkAndroidColorScheme.onPrimary,
    tabBarUnselectedLabelColor:
        ThisAppColorSchemes.kDarkAndroidColorScheme.onSurface,
  );

  // Dark Glass Theme
  static final ThemeData kDarkGlassTheme = ThisAppThemesBuilder.buildThemeData(
    isDark: true,
    colorScheme: ThisAppColorSchemes.kDarkGlassColorScheme,
    scaffoldBackgroundColor: AppColors.kDarkGlassBackground.withOpacity(0.9),
    appBarBackgroundColor: AppColors.kDarkIOSBackground,
    barBackgroundColor:
        ThisAppColorSchemes.kDarkGlassColorScheme.surface.withOpacity(0.5),
    dividerColor:
        ThisAppColorSchemes.kDarkGlassColorScheme.onSurface.withOpacity(0.5),
    highlightColor: AppColors.kAppPrimaryColor.withOpacity(0.3),
    splashColor: AppColors.kAppPrimaryColor.withOpacity(0.2),
    tooltipColor: AppColors.kAppPrimaryColor.withOpacity(0.9),
    tabBarIndicatorColor: AppColors.kAppPrimaryColor,
    tabBarLabelColor: ThisAppColorSchemes.kDarkGlassColorScheme.onPrimary,
    tabBarUnselectedLabelColor:
        ThisAppColorSchemes.kDarkGlassColorScheme.onSurface,
  );

  // Custom themes
  static final ThemeData kLightCustomIOSTheme =
      ThisAppThemesBuilder.buildThemeData(
    isDark: false,
    colorScheme: ThisAppColorSchemes.kColorScheme,
    scaffoldBackgroundColor: AppColors.kLightCustomBackground,
    appBarBackgroundColor: AppColors.kLightCustomBackground,
    barBackgroundColor:
        ThisAppColorSchemes.kColorScheme.surface.withOpacity(0.3),
    dividerColor: ThisAppColorSchemes.kColorScheme.onSurface.withOpacity(0.5),
    highlightColor: AppColors.kAppPrimaryColor.withOpacity(0.3),
    splashColor: AppColors.kAppPrimaryColor.withOpacity(0.2),
    tooltipColor: AppColors.kAppPrimaryColor.withOpacity(0.9),
    tabBarIndicatorColor: AppColors.kAppPrimaryColor,
    tabBarLabelColor: ThisAppColorSchemes.kColorScheme.onPrimary,
    tabBarUnselectedLabelColor: ThisAppColorSchemes.kColorScheme.onSurface,
  );

  static final ThemeData kDarkCustomIOSTheme =
      ThisAppThemesBuilder.buildThemeData(
    isDark: true,
    colorScheme: ThisAppColorSchemes.kColorDarkScheme,
    scaffoldBackgroundColor: AppColors.kDarkCustomBackground,
    appBarBackgroundColor: AppColors.kDarkCustomBackground,
    barBackgroundColor:
        ThisAppColorSchemes.kColorDarkScheme.surface.withOpacity(0.5),
    dividerColor:
        ThisAppColorSchemes.kColorDarkScheme.onSurface.withOpacity(0.5),
    highlightColor: AppColors.kAppPrimaryColor.withOpacity(0.3),
    splashColor: AppColors.kAppPrimaryColor.withOpacity(0.2),
    tooltipColor: AppColors.kAppPrimaryColor.withOpacity(0.9),
    tabBarIndicatorColor: AppColors.kAppPrimaryColor,
    tabBarLabelColor: ThisAppColorSchemes.kColorDarkScheme.onPrimary,
    tabBarUnselectedLabelColor: ThisAppColorSchemes.kColorDarkScheme.onSurface,
  );
}
