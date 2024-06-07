import 'package:flutter/material.dart';
import '../../../State_management/Helpers/Common/helpers.dart';
import '../../../State_management/Theme_configuration/app_colors.dart';

abstract class AppIconButtonStyle {
  static IconButton withShadows(
    BuildContext context, {
    Color? iconColor,
    required IconData icon,
    double iconSize = 25,
    void Function()? onPressed,
  }) {
    final colorScheme = Helpers.colorScheme(context);
    final isDark = Helpers.isDarkTheme(context);
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: iconSize,
        color: (iconColor != null) ? iconColor : colorScheme.primary,
        shadows: [
          BoxShadow(
            color: AppColors.cupertinoBlackColor.withOpacity(isDark ? 1 : 0.35),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(1, 2.5),
          ),
        ],
      ),
    );
  }

  static IconButton withoutShadows(
    BuildContext context, {
    ColorScheme? colorScheme,
    Color? iconColor,
    required IconData icon,
    double iconSize = 25,
    void Function()? onPressed,
  }) {
    final defaultColorScheme = Helpers.colorScheme(context);
    // final isDark = Helpers.isDarkTheme(context);
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: iconSize,
        weight: 0.1,
        fill: 0.1,
        color: (iconColor != null)
            ? iconColor
            : (colorScheme != null)
                ? colorScheme.primary
                : defaultColorScheme.primary,
      ),
    );
  }
}
