import 'package:flutter/material.dart';

import '../../../State_management/Helpers/Common/helpers.dart';
import '../_General_STYLING_set/app_borders.dart';
import '../_General_STYLING_set/app_styling_constants.dart';

abstract class AppDDButtonsStyling {
/* 
   INPUT DECORATION for DD button
 */
  static InputDecoration getInputDecoration(ThemeData theme) {
    final isDarkTheme = Helpers.isDarkTheme(theme);
    final colorScheme = theme.colorScheme;
    return InputDecoration(
      isDense: true,
      filled: true,
      fillColor: colorScheme.surface.withOpacity(isDarkTheme ? 0.1 : 0.21),
      contentPadding: AppStylingConstants.minHorizontal,
      enabledBorder: AppBordersStyling.underLineInputBorder(theme, false),
      focusedBorder: AppBordersStyling.underLineInputBorder(theme, true),
    );
  }

/*
 */

/* BoxDecoration для DropDown Button */
  static InputDecoration inputDecorationForDDButton(
    BuildContext context,
    bool isDarkTheme,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    return InputDecoration(
      isDense: true,
      filled: true,
      fillColor: colorScheme.surface.withOpacity(isDarkTheme ? 0.1 : 0.21),
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 1),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
            color: colorScheme.secondary.withOpacity(isDarkTheme ? 0.25 : 0.25),
            width: isDarkTheme ? 0.25 : 0.65),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
            color: colorScheme.secondary.withOpacity(isDarkTheme ? 0.25 : 0.25),
            width: isDarkTheme ? 0.3 : 0.65),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
