import 'package:flutter/material.dart';
import '../../../State_management/Helpers/Common/helpers.dart';
import 'app_box_shadows.dart';
import 'app_styling_constants.dart';

abstract class AppBoxDecorations {
/* BoxDecoration in GLASS MORPHISM STYLE  */
  static BoxDecoration inGlassMorphismStyle(ThemeData theme) {
    final isDark = Helpers.isDarkTheme(theme);
    final ColorScheme colorScheme = theme.colorScheme;
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [
          colorScheme.primary.withOpacity(isDark ? 0.8 : 0.85),
          colorScheme.primary.withOpacity(isDark ? 0.9 : 0.95),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
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
}
