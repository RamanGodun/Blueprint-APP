import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../this_app_colors.dart';
import '../text_styles.dart';

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
      primarySwatch: AppColors.kPrimarySwatch,
      colorScheme: colorScheme,
      textTheme: TextStyles4ThisAppThemes.kTextThemeData(isDark),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: TextStyles4ThisAppThemes.kTextThemeData(isDark).labelLarge,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: CupertinoColors.systemBackground,
        elevation: 0,
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
        primaryColor: AppColors.kAppPrimaryColor,
        barBackgroundColor: barBackgroundColor,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.onSurface),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.kAppPrimaryColor),
        ),
      ),
      dividerColor: dividerColor,
      highlightColor: highlightColor,
      splashColor: splashColor,
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: tooltipColor,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      tabBarTheme: TabBarTheme(
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: tabBarIndicatorColor,
        ),
        labelColor: tabBarLabelColor,
        unselectedLabelColor: tabBarUnselectedLabelColor,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: appBarBackgroundColor,
        selectedItemColor: AppColors.kAppPrimaryColor,
        unselectedItemColor: colorScheme.onSurface,
      ),
    );
  }
}
