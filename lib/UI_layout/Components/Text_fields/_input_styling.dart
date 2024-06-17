import 'package:blueprint_4app/UI_layout/Components/_General_STYLING_set/app_text_styling.dart';
import 'package:flutter/material.dart';
import '../../../State_management/Theme_configuration/app_colors.dart';
import '../Pickers/country_picker.dart';
import '../_General_STYLING_set/app_borders.dart';
import '../_General_STYLING_set/app_styling_constants.dart';

abstract class InputDecorationStyling {
/*
   for TEXT FIELD
 */
  static InputDecoration inputDecorationForTextField(
    ThemeData theme,
    String hintText,
    IconData? icon,
  ) {
    final colorScheme = theme.colorScheme;
    return InputDecoration(
      contentPadding: AppStylingConstants.commonPadding,
      enabledBorder: AppBordersStyling.enabledBorderForTextField(theme),
      focusedBorder: AppBordersStyling.focusedBorderForTextField(theme),
      fillColor: colorScheme.surface,
      filled: true,
      hintText: hintText,
      hintStyle: AppTextStyling.hintText(theme),
      prefixIcon: (icon != null)
          ? Icon(icon, color: colorScheme.onSurface.withOpacity(0.5))
          : null,
    );
  }
/* */
}
