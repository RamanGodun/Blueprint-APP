import 'package:blueprint_4app/UI_layout/Components/_Widgets_STYLING/app_box_shadows.dart';
import 'package:flutter/material.dart';
import '../../../State_management/Helpers/Common/helpers.dart';
import '../_Widgets_STYLING/app_styling_constants.dart';

abstract class AppIconButtonsStyling {
  static IconButton withShadows(
    BuildContext context, {
    Color? iconColor,
    required IconData icon,
    double iconSize = AppStylingConstants.iconSize,
    void Function()? onPressed,
  }) {
    final theme = Helpers.themeGet(context);
    final colorScheme = theme.colorScheme;
    return IconButton(
      padding: AppStylingConstants.zeroPadding,
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: iconSize,
        color: (iconColor != null) ? iconColor : colorScheme.primary,
        shadows: [AppBoxShadows.iconButtonShadow(theme)],
      ),
    );
  }

  static IconButton withoutShadows(
    BuildContext context, {
    ColorScheme? colorScheme,
    Color? iconColor,
    required IconData icon,
    double iconSize = AppStylingConstants.iconSize,
    void Function()? onPressed,
  }) {
    final defaultColorScheme = Helpers.colorSchemeGet(context);
    return IconButton(
      padding: AppStylingConstants.zeroPadding,
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
