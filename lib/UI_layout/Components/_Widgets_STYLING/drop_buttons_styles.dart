import 'package:flutter/material.dart';

import '../../../State_management/Helpers/Common/helpers.dart';

abstract class AppDropButtonStyle {
//
/* For THEME CHANGING button
 */
  static BoxDecoration forThemeChangingDB(BuildContext context) {
    final theme = Helpers.theme(context);
    final colorScheme = theme.colorScheme;
    final isDarkMode = Helpers.isDarkMode(theme);
    return BoxDecoration(
      color: colorScheme.surface,
      borderRadius: BorderRadius.circular(12.0),
      boxShadow: [
        BoxShadow(
          color: isDarkMode
              ? Colors.black
              : colorScheme.inverseSurface.withOpacity(0.3),
          spreadRadius: 2,
          blurRadius: 10,
          offset: const Offset(2, 4),
        ),
        BoxShadow(
          color: isDarkMode
              ? Colors.black
              : colorScheme.inverseSurface.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 5,
          offset: const Offset(0, 2),
        ),
      ],
    );
  }

/* INPUT DECORATION for DD button
 */
  static InputDecoration getInputDecoration(BuildContext context) {
    final theme = Helpers.theme(context);
    final colorScheme = theme.colorScheme;
    final isDarkTheme = Helpers.isDarkMode(theme);
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

  static Color getDropdownColor(BuildContext context, bool isDarkTheme) {
    return !isDarkTheme
        ? const Color.fromARGB(255, 233, 230, 230)
        : const Color.fromARGB(255, 14, 4, 4).withOpacity(0.95);
  }

  static TextStyle getTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.displaySmall!.copyWith(
          fontSize: 11.5,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w300,
        );
  }
}
