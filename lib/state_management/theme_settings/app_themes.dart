import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'app_colorscheme.dart';
import 'text_style.dart';

class ThisAppThemes {
  // Загальна функція для налаштувань теми
  static ThemeData _buildThemeData({
    required bool isDark,
    required ColorScheme colorScheme,
    required Color scaffoldBackgroundColor,
    required Color appBarBackgroundColor,
    required Color barBackgroundColor,
    required Color dividerColor,
    required Color highlightColor,
    required Color splashColor,
    required Color tooltipColor,
    required Color tabBarIndicatorColor,
    required Color tabBarLabelColor,
    required Color tabBarUnselectedLabelColor,
  }) {
    return ThemeData(
      brightness: isDark ? Brightness.dark : Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primarySwatch: ThisAppColors.kPrimarySwatch,
      colorScheme: colorScheme,
      textTheme: ThisAppTextStyles.kTextThemeData(isDark),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: appBarBackgroundColor,
        iconTheme: IconThemeData(color: colorScheme.onSurface),
        titleTextStyle:
            ThisAppTextStyles.kTextThemeData(isDark).titleLarge?.copyWith(
                  color: colorScheme.onSurface,
                ),
        toolbarTextStyle:
            ThisAppTextStyles.kTextThemeData(isDark).bodyMedium?.copyWith(
                  color: colorScheme.onSurface,
                ),
      ),
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      cupertinoOverrideTheme: NoDefaultCupertinoThemeData(
        primaryColor: ThisAppColors.kPrimaryColor,
        barBackgroundColor: barBackgroundColor,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.onSurface),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: ThisAppColors.kPrimaryColor),
        ),
      ),
      dividerColor: dividerColor,
      highlightColor: highlightColor,
      splashColor: splashColor,
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: tooltipColor,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      tabBarTheme: TabBarTheme(
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: tabBarIndicatorColor,
        ),
        labelColor: tabBarLabelColor,
        unselectedLabelColor: tabBarUnselectedLabelColor,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: appBarBackgroundColor,
        selectedItemColor: ThisAppColors.kPrimaryColor,
        unselectedItemColor: colorScheme.onSurface,
      ),
    );
  }

  // iOS Themes
  static final ThemeData kLightIOSTheme = _buildThemeData(
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

  static final ThemeData kDarkIOSTheme = _buildThemeData(
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
  static final ThemeData kLightAndroidTheme = _buildThemeData(
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

  static final ThemeData kDarkAndroidTheme = _buildThemeData(
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
  static final ThemeData kDarkGlassTheme = _buildThemeData(
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

