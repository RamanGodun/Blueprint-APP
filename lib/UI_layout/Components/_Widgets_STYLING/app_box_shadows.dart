import 'package:flutter/material.dart';

import '../../../State_management/Helpers/Common/helpers.dart';
import '../../../State_management/Theme_configuration/app_colors.dart';

abstract class AppBoxShadows {
  static BoxShadow boxShadowsType1(ThemeData theme) {
    final colorScheme = theme.colorScheme;
    final isDarkMode = Helpers.isDarkTheme(theme);
    return BoxShadow(
      color: isDarkMode
          ? AppColors.cupertinoBlackColor.withOpacity(0.7)
          : colorScheme.inverseSurface.withOpacity(0.2),
      spreadRadius: 4,
      blurRadius: 10,
      offset: const Offset(0, 3),
    );
  }

  static BoxShadow boxShadowsType2(ThemeData theme) {
    final colorScheme = theme.colorScheme;
    final isDarkMode = Helpers.isDarkTheme(theme);
    return BoxShadow(
      color: isDarkMode
          ? AppColors.cupertinoBlackColor.withOpacity(0.7)
          : colorScheme.inverseSurface.withOpacity(0.1),
      spreadRadius: 1,
      blurRadius: 5,
      offset: const Offset(0, 1),
    );
  }

  static BoxShadow boxShadowsForGlassMorphism1(ThemeData theme) {
    final isDark = Helpers.isDarkTheme(theme);
    return BoxShadow(
      color: AppColors.cupertinoBlackColor.withOpacity(isDark ? 0.6 : 0.8),
      spreadRadius: 1,
      blurRadius: 5,
      offset: const Offset(0, 2),
    );
  }

  static BoxShadow boxShadowsForGlassMorphism2(ThemeData theme) {
    final isDark = Helpers.isDarkTheme(theme);
    return BoxShadow(
      color: AppColors.cupertinoBlackColor.withOpacity(isDark ? 0.3 : 0.5),
      spreadRadius: 0.5,
      blurRadius: 2,
      offset: const Offset(0, 1),
    );
  }

  static BoxShadow forComplexityPicker(ThemeData theme) {
    final colorScheme = theme.colorScheme;
    return BoxShadow(
      color: colorScheme.secondary.withOpacity(0.1),
      blurRadius: 0.25,
      offset: const Offset(0.5, 1.5),
    );
  }
//
}


   // boxShadow: [
      //   AppBoxShadows.boxShadowsForGlassMorphism1(theme),
      //   AppBoxShadows.boxShadowsForGlassMorphism2(theme),
      // ],