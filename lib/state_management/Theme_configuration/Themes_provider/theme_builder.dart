import 'package:blueprint_4app/UI_layout/Components/_General_STYLING_set/app_styling_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../text_styles_for_themes.dart';

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
        labelStyle: TextStyle(
          color: colorScheme.onSurface,
          fontWeight: FontWeight.w400,
        ),
        floatingLabelStyle: TextStyle(
          color: colorScheme.primary,
          fontWeight: FontWeight.w500,
        ),
        helperStyle: TextStyle(
          color: colorScheme.onSurface.withOpacity(0.7),
          fontSize: 12,
        ),
        helperMaxLines: 1,
        hintStyle: TextStyle(
          color: colorScheme.onSurface.withOpacity(0.5),
          fontStyle: FontStyle.italic,
        ),
        hintFadeDuration: const Duration(milliseconds: 200),
        errorStyle: const TextStyle(
          color: AppColors.kErrorColor,
          fontSize: 12,
        ),
        errorMaxLines: 2,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        isDense: true,
        contentPadding: AppStylingConstants.commonPadding,
        isCollapsed: false,
        iconColor: colorScheme.onSurface,
        prefixStyle: TextStyle(
          color: colorScheme.onSurface,
          fontWeight: FontWeight.w400,
        ),
        prefixIconColor: colorScheme.primary,
        suffixStyle: TextStyle(
          color: colorScheme.onSurface,
          fontWeight: FontWeight.w400,
        ),
        suffixIconColor: colorScheme.primary,
        counterStyle: TextStyle(
          color: colorScheme.onSurface.withOpacity(0.7),
          fontSize: 12,
        ),
        filled: true,
        fillColor: colorScheme.surface.withOpacity(0.2),
        activeIndicatorBorder: BorderSide(
          color: colorScheme.primary.withOpacity(0.6),
          width: 1.0,
        ),
        outlineBorder: BorderSide(
          color: colorScheme.onSurface.withOpacity(0.3),
          width: 1.0,
        ),
        focusColor: colorScheme.primary,
        hoverColor: colorScheme.primary.withOpacity(0.04),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.kErrorColor,
            width: 0.8,
          ),
          borderRadius: AppStylingConstants.commonBorderRadius,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.kAppPrimaryColor,
            width: 0.8,
          ),
          borderRadius: AppStylingConstants.commonBorderRadius,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.kErrorColorDark,
            width: 0.8,
          ),
          borderRadius: AppStylingConstants.commonBorderRadius,
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorScheme.onSurface.withOpacity(0.1),
            width: 0.8,
          ),
          borderRadius: AppStylingConstants.commonBorderRadius,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorScheme.onSurface.withOpacity(0.3),
            width: 0.8,
          ),
          borderRadius: AppStylingConstants.commonBorderRadius,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorScheme.onSurface,
            width: 0.8,
          ),
          borderRadius: AppStylingConstants.commonBorderRadius,
        ),
        alignLabelWithHint: true,
        constraints: const BoxConstraints(
          maxWidth: 400,
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
