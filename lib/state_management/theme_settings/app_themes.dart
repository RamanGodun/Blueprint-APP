import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'app_colorscheme.dart';
import 'text_style.dart';

class ThisAppThemes {
  // iOS Themes
  static final ThemeData kLightIOSTheme = ThemeData(
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primarySwatch: ThisAppColors.kPrimarySwatch,
    colorScheme: ThisAppColors.kLightIOSColorScheme,
    textTheme: ThisAppTextStyles.kTextThemeData(false),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ThisAppColors.kLightIOSColorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: ThisAppColors.kLightIOSBackground,
      iconTheme:
          IconThemeData(color: ThisAppColors.kLightIOSColorScheme.onSurface),
      titleTextStyle:
          ThisAppTextStyles.kTextThemeData(false).titleLarge?.copyWith(
                color: ThisAppColors.kLightIOSColorScheme.onSurface,
              ),
      toolbarTextStyle:
          ThisAppTextStyles.kTextThemeData(false).bodyMedium?.copyWith(
                color: ThisAppColors.kLightIOSColorScheme.onSurface,
              ),
    ),
    scaffoldBackgroundColor: ThisAppColors.kLightIOSBackground,
    cupertinoOverrideTheme: NoDefaultCupertinoThemeData(
      primaryColor: ThisAppColors.kPrimaryColor,
      barBackgroundColor: ThisAppColors.kLightIOSColorScheme.surface,
      scaffoldBackgroundColor: ThisAppColors.kLightIOSBackground,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide:
            BorderSide(color: ThisAppColors.kLightIOSColorScheme.onSurface),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: ThisAppColors.kPrimaryColor),
      ),
    ),
    dividerColor: ThisAppColors.kLightIOSColorScheme.onSurface.withOpacity(0.5),
    highlightColor: ThisAppColors.kPrimaryColor.withOpacity(0.3),
    splashColor: ThisAppColors.kPrimaryColor.withOpacity(0.2),
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: ThisAppColors.kPrimaryColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(4),
      ),
    ),
    tabBarTheme: TabBarTheme(
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: ThisAppColors.kPrimaryColor,
      ),
      labelColor: ThisAppColors.kLightIOSColorScheme.onPrimary,
      unselectedLabelColor: ThisAppColors.kLightIOSColorScheme.onSurface,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ThisAppColors.kLightIOSBackground,
      selectedItemColor: ThisAppColors.kPrimaryColor,
      unselectedItemColor: ThisAppColors.kLightIOSColorScheme.onSurface,
    ),
  );

  static final ThemeData kDarkIOSTheme = ThemeData(
    brightness: Brightness.dark,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primarySwatch: ThisAppColors.kPrimarySwatch,
    colorScheme: ThisAppColors.kDarkIOSColorScheme,
    textTheme: ThisAppTextStyles.kTextThemeData(true),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ThisAppColors.kDarkIOSColorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: ThisAppColors.kDarkIOSBackground,
      iconTheme:
          IconThemeData(color: ThisAppColors.kDarkIOSColorScheme.onSurface),
      titleTextStyle:
          ThisAppTextStyles.kTextThemeData(true).titleLarge?.copyWith(
                color: ThisAppColors.kDarkIOSColorScheme.onSurface,
              ),
      toolbarTextStyle:
          ThisAppTextStyles.kTextThemeData(true).bodyMedium?.copyWith(
                color: ThisAppColors.kDarkIOSColorScheme.onSurface,
              ),
    ),
    scaffoldBackgroundColor: ThisAppColors.kDarkIOSBackground,
    cupertinoOverrideTheme: NoDefaultCupertinoThemeData(
      primaryColor: ThisAppColors.kPrimaryColor,
      barBackgroundColor: ThisAppColors.kDarkIOSColorScheme.surface,
      scaffoldBackgroundColor: ThisAppColors.kDarkIOSBackground,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide:
            BorderSide(color: ThisAppColors.kDarkIOSColorScheme.onSurface),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: ThisAppColors.kPrimaryColor),
      ),
    ),
    dividerColor: ThisAppColors.kDarkIOSColorScheme.onSurface.withOpacity(0.5),
    highlightColor: ThisAppColors.kPrimaryColor.withOpacity(0.3),
    splashColor: ThisAppColors.kPrimaryColor.withOpacity(0.2),
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: ThisAppColors.kPrimaryColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(4),
      ),
    ),
    tabBarTheme: TabBarTheme(
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: ThisAppColors.kPrimaryColor,
      ),
      labelColor: ThisAppColors.kDarkIOSColorScheme.onPrimary,
      unselectedLabelColor: ThisAppColors.kDarkIOSColorScheme.onSurface,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ThisAppColors.kDarkIOSBackground,
      selectedItemColor: ThisAppColors.kPrimaryColor,
      unselectedItemColor: ThisAppColors.kDarkIOSColorScheme.onSurface,
    ),
  );

  // Android Themes
  static final ThemeData kLightAndroidTheme = ThemeData(
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primarySwatch: ThisAppColors.kPrimarySwatch,
    colorScheme: ThisAppColors.kLightAndroidColorScheme,
    textTheme: ThisAppTextStyles.kTextThemeData(false),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ThisAppColors.kLightAndroidColorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: ThisAppColors.kLightAndroidColorScheme.surface,
      iconTheme: IconThemeData(
          color: ThisAppColors.kLightAndroidColorScheme.onSurface),
      titleTextStyle:
          ThisAppTextStyles.kTextThemeData(false).titleLarge?.copyWith(
                color: ThisAppColors.kLightAndroidColorScheme.onSurface,
              ),
      toolbarTextStyle:
          ThisAppTextStyles.kTextThemeData(false).bodyMedium?.copyWith(
                color: ThisAppColors.kLightAndroidColorScheme.onSurface,
              ),
    ),
    scaffoldBackgroundColor: ThisAppColors.kLightAndroidBackground,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide:
            BorderSide(color: ThisAppColors.kLightAndroidColorScheme.onSurface),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: ThisAppColors.kPrimaryColor),
      ),
    ),
    dividerColor:
        ThisAppColors.kLightAndroidColorScheme.onSurface.withOpacity(0.5),
    highlightColor: ThisAppColors.kPrimaryColor.withOpacity(0.3),
    splashColor: ThisAppColors.kPrimaryColor.withOpacity(0.2),
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: ThisAppColors.kPrimaryColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(4),
      ),
    ),
    tabBarTheme: TabBarTheme(
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: ThisAppColors.kPrimaryColor,
      ),
      labelColor: ThisAppColors.kLightAndroidColorScheme.onPrimary,
      unselectedLabelColor: ThisAppColors.kLightAndroidColorScheme.onSurface,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ThisAppColors.kLightAndroidColorScheme.surface,
      selectedItemColor: ThisAppColors.kPrimaryColor,
      unselectedItemColor: ThisAppColors.kLightAndroidColorScheme.onSurface,
    ),
  );

  static final ThemeData kDarkAndroidTheme = ThemeData(
    brightness: Brightness.dark,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primarySwatch: ThisAppColors.kPrimarySwatch,
    colorScheme: ThisAppColors.kDarkAndroidColorScheme,
    textTheme: ThisAppTextStyles.kTextThemeData(true),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ThisAppColors.kDarkAndroidColorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: ThisAppColors.kDarkAndroidColorScheme.surface,
      iconTheme:
          IconThemeData(color: ThisAppColors.kDarkAndroidColorScheme.onSurface),
      titleTextStyle:
          ThisAppTextStyles.kTextThemeData(true).titleLarge?.copyWith(
                color: ThisAppColors.kDarkAndroidColorScheme.onSurface,
              ),
      toolbarTextStyle:
          ThisAppTextStyles.kTextThemeData(true).bodyMedium?.copyWith(
                color: ThisAppColors.kDarkAndroidColorScheme.onSurface,
              ),
    ),
    scaffoldBackgroundColor: ThisAppColors.kDarkAndroidBackground,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide:
            BorderSide(color: ThisAppColors.kDarkAndroidColorScheme.onSurface),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: ThisAppColors.kPrimaryColor),
      ),
    ),
    dividerColor:
        ThisAppColors.kDarkAndroidColorScheme.onSurface.withOpacity(0.5),
    highlightColor: ThisAppColors.kPrimaryColor.withOpacity(0.3),
    splashColor: ThisAppColors.kPrimaryColor.withOpacity(0.2),
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: ThisAppColors.kPrimaryColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(4),
      ),
    ),
    tabBarTheme: TabBarTheme(
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: ThisAppColors.kPrimaryColor,
      ),
      labelColor: ThisAppColors.kDarkAndroidColorScheme.onPrimary,
      unselectedLabelColor: ThisAppColors.kDarkAndroidColorScheme.onSurface,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ThisAppColors.kDarkAndroidColorScheme.surface,
      selectedItemColor: ThisAppColors.kPrimaryColor,
      unselectedItemColor: ThisAppColors.kDarkAndroidColorScheme.onSurface,
    ),
  );

  // Dark Glass Theme
  static final ThemeData kDarkGlassTheme = ThemeData(
    brightness: Brightness.dark,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primarySwatch: ThisAppColors.kPrimarySwatch,
    colorScheme: ThisAppColors.kDarkGlassColorScheme,
    textTheme: ThisAppTextStyles.kTextThemeData(true),
    scaffoldBackgroundColor:
        ThisAppColors.kDarkGlassBackground.withOpacity(0.9),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide:
            BorderSide(color: ThisAppColors.kDarkGlassColorScheme.onSurface),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: ThisAppColors.kPrimaryColor),
      ),
    ),
    dividerColor:
        ThisAppColors.kDarkGlassColorScheme.onSurface.withOpacity(0.5),
    highlightColor: ThisAppColors.kPrimaryColor.withOpacity(0.3),
    splashColor: ThisAppColors.kPrimaryColor.withOpacity(0.2),
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: ThisAppColors.kPrimaryColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(4),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: ThisAppColors.kDarkIOSBackground,
      iconTheme:
          IconThemeData(color: ThisAppColors.kDarkIOSColorScheme.onSurface),
      titleTextStyle:
          ThisAppTextStyles.kTextThemeData(true).titleLarge?.copyWith(
                color: ThisAppColors.kDarkIOSColorScheme.onSurface,
              ),
      toolbarTextStyle:
          ThisAppTextStyles.kTextThemeData(true).bodyMedium?.copyWith(
                color: ThisAppColors.kDarkIOSColorScheme.onSurface,
              ),
    ),
    tabBarTheme: TabBarTheme(
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: ThisAppColors.kPrimaryColor,
      ),
      labelColor: ThisAppColors.kDarkGlassColorScheme.onPrimary,
      unselectedLabelColor: ThisAppColors.kDarkGlassColorScheme.onSurface,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ThisAppColors.kDarkGlassColorScheme.surface,
      selectedItemColor: ThisAppColors.kPrimaryColor,
      unselectedItemColor: ThisAppColors.kDarkGlassColorScheme.onSurface,
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

