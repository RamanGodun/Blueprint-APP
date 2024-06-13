import 'package:flutter/material.dart';

import '../../../State_management/Helpers/Common/helpers.dart';
import '../../../State_management/Theme_configuration/app_colors.dart';

abstract class AppBoxShadows {
  /* FOR CUSTOM IOS AND ANDROID DIALOGS */
  static BoxShadow customDialogShadow1(ThemeData theme, bool isIOS) {
    final colorScheme = theme.colorScheme;
    final isDarkMode = Helpers.isDarkTheme(theme);
    final shadowColor = isIOS
        ? (isDarkMode
            ? Colors.black
            : colorScheme.inverseSurface.withOpacity(0.3))
        : (isDarkMode
            ? AppColors.cupertinoBlackColor
            : colorScheme.inverseSurface.withOpacity(0.3));
    return BoxShadow(
      color: shadowColor,
      spreadRadius: 2,
      blurRadius: 10,
      offset: const Offset(2, 4),
    );
  }

  static BoxShadow customDialogShadow2(ThemeData theme, bool isIOS) {
    final colorScheme = theme.colorScheme;
    final isDarkMode = Helpers.isDarkTheme(theme);
    final shadowColor = isIOS
        ? (isDarkMode
            ? Colors.black
            : colorScheme.inverseSurface.withOpacity(0.1))
        : (isDarkMode
            ? AppColors.cupertinoBlackColor
            : colorScheme.inverseSurface.withOpacity(0.1));
    return BoxShadow(
      color: shadowColor,
      spreadRadius: 1,
      blurRadius: 5,
      offset: isIOS ? const Offset(0, 2) : Offset.zero,
    );
  }

  /* FOR THEME CHANGING DROPDOWN BUTTON */
  static BoxShadow themeChangingDDButtonShadow1(ThemeData theme) {
    final colorScheme = theme.colorScheme;
    final isDarkMode = Helpers.isDarkTheme(theme);
    return BoxShadow(
      color: isDarkMode
          ? Colors.black
          : colorScheme.inverseSurface.withOpacity(0.3),
      spreadRadius: 2,
      blurRadius: 10,
      offset: const Offset(2, 4),
    );
  }

  static BoxShadow themeChangingDDButtonShadow2(ThemeData theme) {
    final colorScheme = theme.colorScheme;
    final isDarkMode = Helpers.isDarkTheme(theme);
    return BoxShadow(
      color: isDarkMode
          ? Colors.black
          : colorScheme.inverseSurface.withOpacity(0.1),
      spreadRadius: 1,
      blurRadius: 5,
      offset: const Offset(0, 2),
    );
  }

  /* FOR ICON BUTTONS */
  static BoxShadow iconButtonShadow(ThemeData theme) {
    final isDarkMode = Helpers.isDarkTheme(theme);
    return BoxShadow(
      color: AppColors.cupertinoBlackColor.withOpacity(isDarkMode ? 1 : 0.35),
      spreadRadius: 0.4,
      blurRadius: 3,
      offset: const Offset(1, 1.5),
    );
  }

  /* COMMON BOX SHADOWS */
  static BoxShadow commonShadowType1(ThemeData theme, bool isDarkMode) {
    final colorScheme = theme.colorScheme;
    return BoxShadow(
      color: isDarkMode
          ? AppColors.cupertinoBlackColor.withOpacity(0.7)
          : colorScheme.inverseSurface.withOpacity(0.2),
      spreadRadius: 4,
      blurRadius: 10,
      offset: const Offset(0, 3),
    );
  }

  static BoxShadow commonShadowType2(ThemeData theme, bool isDarkMode) {
    final colorScheme = theme.colorScheme;
    return BoxShadow(
      color: isDarkMode
          ? AppColors.cupertinoBlackColor.withOpacity(0.7)
          : colorScheme.inverseSurface.withOpacity(0.1),
      spreadRadius: 1,
      blurRadius: 5,
      offset: const Offset(0, 1),
    );
  }

  /* FOR GLASS MORPHISM STYLE */
  static BoxShadow glassMorphismShadow1(ThemeData theme, bool isDarkMode) {
    return BoxShadow(
      color: AppColors.cupertinoBlackColor.withOpacity(isDarkMode ? 0.6 : 0.8),
      spreadRadius: 1,
      blurRadius: 5,
      offset: const Offset(0, 2),
    );
  }

  static BoxShadow glassMorphismShadow2(ThemeData theme, bool isDarkMode) {
    return BoxShadow(
      color: AppColors.cupertinoBlackColor.withOpacity(isDarkMode ? 0.3 : 0.5),
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
}
