import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../text_styles.dart';
import '../App_colors_palette/this_app_colors.dart';

class ThisAppThemesBuilder {
  static ThemeData buildThemeData({
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
      textTheme: TextStyles4ThisAppThemes.kTextThemeData(isDark),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: CupertinoColors.systemBackground,
        elevation: 1,
        iconTheme: IconThemeData(color: colorScheme.onSurface),
        titleTextStyle: TextStyles4ThisAppThemes.kTextThemeData(isDark)
            .titleLarge
            ?.copyWith(
              color: colorScheme.onSurface,
            ),
        toolbarTextStyle: TextStyles4ThisAppThemes.kTextThemeData(isDark)
            .bodyMedium
            ?.copyWith(
              color: colorScheme.onSurface,
            ),
      ),
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      cupertinoOverrideTheme: NoDefaultCupertinoThemeData(
        primaryColor: ThisAppColors.kAppPrimaryColor,
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
          borderSide: const BorderSide(color: ThisAppColors.kAppPrimaryColor),
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
        selectedItemColor: ThisAppColors.kAppPrimaryColor,
        unselectedItemColor: colorScheme.onSurface,
      ),
    );
  }
}
