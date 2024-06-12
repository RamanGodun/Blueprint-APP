import 'package:flutter/material.dart';
import '../../../State_management/Helpers/Common/helpers.dart';
import 'app_box_shadows.dart';
import 'app_styling_constants.dart';

abstract class AppBoxDecorations {
/* BoxDecoration in GLASS MORPHISM STYLE  */
  static BoxDecoration forButtonsInGlassMorphismStyle(ThemeData theme) {
    final isDark = Helpers.isDarkTheme(theme);
    final colorScheme = theme.colorScheme;
    return BoxDecoration(
      color: colorScheme.primary.withOpacity(isDark ? 0.45 : 0.85),
      borderRadius: AppStylingConstants.commonBorderRadius,
    );
  }

  static BoxDecoration forComplexityPicker(ThemeData theme) {
    final colorScheme = theme.colorScheme;
    return BoxDecoration(
      color: colorScheme.surface.withOpacity(0.2),
      borderRadius: AppStylingConstants.commonBorderRadius,
      boxShadow: [AppBoxShadows.forComplexityPicker(theme)],
    );
  }

  static BoxDecoration discountDecoration() {
    return const BoxDecoration(
      color: Color(0xFFC94C4C),
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(5.0),
      ),
    );
  }

  static BoxDecoration listTileDecoration(
      BuildContext context, bool isDarkTheme) {
    final colorScheme = Helpers.colorSchemeGet(context);
    return BoxDecoration(
      color: colorScheme.surface.withOpacity(isDarkTheme ? 0.15 : 0.08),
      borderRadius: BorderRadius.circular(6.0),
      boxShadow: [
        BoxShadow(
          color: colorScheme.surface.withOpacity(0.1),
          blurRadius: 1.0,
          offset: const Offset(0.0, 1.0),
        ),
      ],
    );
  }

  static BoxDecoration slidableActionDecoration(
      BuildContext context, bool isDarkTheme, Color color) {
    return BoxDecoration(
      color: color.withOpacity(isDarkTheme ? 0.27 : 0.19),
      borderRadius: BorderRadius.circular(5),
    );
  }

  static BoxDecoration checkboxDecoration(
      BuildContext context, bool isDarkTheme) {
    final colorScheme = Helpers.colorSchemeGet(context);
    return BoxDecoration(
      border:
          Border.all(color: colorScheme.onSurface.withOpacity(0.2), width: 1.5),
      borderRadius: BorderRadius.circular(3.0),
    );
  }

  static BoxDecoration cardDecoration(BuildContext context) {
    final colorScheme = Helpers.colorSchemeGet(context);
    return BoxDecoration(
      borderRadius: BorderRadius.circular(12.0),
      color: colorScheme.surface.withOpacity(0.4),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 10,
          offset: const Offset(2, 4),
        ),
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 5,
          offset: const Offset(0, 2),
        ),
      ],
    );
  }

  static BoxDecoration forTiles(ThemeData theme) {
    final colorScheme = theme.colorScheme;
    final forTiles = BoxDecoration(
      color: colorScheme.surface.withOpacity(0.95),
      border: Border.all(
          color: colorScheme.inverseSurface.withOpacity(0.2), width: 0.9),
      borderRadius: AppStylingConstants.commonBorderRadius,
    );
    return forTiles;
  }

/* next FOR Drop Button FROM JBnTracker
 */
  static InputDecoration getInputDecoration(
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
//
}
