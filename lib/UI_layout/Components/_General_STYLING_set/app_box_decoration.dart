import 'package:flutter/material.dart';
import '../../../State_management/Helpers/Common/helpers.dart';
import '../../../State_management/Theme_configuration/app_colors.dart';
import 'app_borders.dart';
import 'app_box_shadows.dart';
import 'app_styling_constants.dart';

abstract class AppBoxDecorations {
  /* BoxDecoration для кнопок у стилі "GLASS MORPHISM" */
  static BoxDecoration forButtonsInGlassMorphismStyle(ThemeData theme) {
    final isDark = Helpers.isDarkTheme(theme);
    final colorScheme = theme.colorScheme;
    return BoxDecoration(
      color: colorScheme.primary.withOpacity(isDark ? 0.45 : 0.85),
      borderRadius: AppStylingConstants.commonBorderRadius,
    );
  }

  /* BoxDecoration для IOS Dialog */
  static BoxDecoration forIOSDialog(ThemeData theme) {
    return BoxDecoration(
      color: theme.colorScheme.surface,
      borderRadius: AppStylingConstants.radius12,
      boxShadow: [
        AppBoxShadows.customDialogShadow1(theme, true),
        AppBoxShadows.customDialogShadow2(theme, true),
      ],
    );
  }

  /* BoxDecoration для Android Dialog */
  static BoxDecoration forAndroidDialog(ThemeData theme) {
    return BoxDecoration(
      border: AppBordersStyling.forAndroidBoxDecoration(theme),
      borderRadius: AppStylingConstants.radius12,
      boxShadow: [
        AppBoxShadows.customDialogShadow1(theme, false),
        AppBoxShadows.customDialogShadow2(theme, false),
      ],
    );
  }

  /* BoxDecoration для кнопок та низьких контейнерів */
  static BoxDecoration forAndroidDialog1(ThemeData theme) {
    final colorScheme = theme.colorScheme;
    return BoxDecoration(
      color: colorScheme.surface.withOpacity(0.65),
      borderRadius: AppStylingConstants.radius12,
      border: Border.all(
        color: colorScheme.inverseSurface.withOpacity(0.1),
      ),
    );
  }

  /* BoxDecoration для THEME CHANGING DD Button */
  static BoxDecoration forThemeChangingDB(ThemeData theme) {
    final colorScheme = theme.colorScheme;
    return BoxDecoration(
      color: colorScheme.surface,
      borderRadius: AppStylingConstants.radius12,
      boxShadow: [
        AppBoxShadows.themeChangingDDButtonShadow1(theme),
        AppBoxShadows.themeChangingDDButtonShadow2(theme),
      ],
    );
  }

  /* BoxDecoration для вибору складності */
  static BoxDecoration forComplexityPicker(ThemeData theme) {
    final colorScheme = theme.colorScheme;
    return BoxDecoration(
      color: colorScheme.surface.withOpacity(0.2),
      borderRadius: AppStylingConstants.commonBorderRadius,
      boxShadow: [AppBoxShadows.themeChangingDDButtonShadow1(theme)],
    );
  }

  /* BoxDecoration для знижок */
  static BoxDecoration discountDecoration() {
    return const BoxDecoration(
      color: Color(0xFFC94C4C),
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(5.0),
      ),
    );
  }

  /* BoxDecoration для елементів списку */
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

  /* BoxDecoration для дій в слайдерах */
  static BoxDecoration slidableActionDecoration(
      BuildContext context, bool isDarkTheme, Color color) {
    return BoxDecoration(
      color: color.withOpacity(isDarkTheme ? 0.27 : 0.19),
      borderRadius: BorderRadius.circular(5),
    );
  }

  /* BoxDecoration для чекбоксів */
  static BoxDecoration checkboxDecoration(
      BuildContext context, bool isDarkTheme) {
    final colorScheme = Helpers.colorSchemeGet(context);
    return BoxDecoration(
      border:
          Border.all(color: colorScheme.onSurface.withOpacity(0.2), width: 1.5),
      borderRadius: BorderRadius.circular(3.0),
    );
  }

  /* BoxDecoration для карточок */
  static BoxDecoration cardDecoration(BuildContext context) {
    final colorScheme = Helpers.colorSchemeGet(context);
    return BoxDecoration(
      borderRadius: AppStylingConstants.radius12,
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

  /* BoxDecoration для елементів списку */
  static BoxDecoration forTiles(ThemeData theme) {
    final colorScheme = theme.colorScheme;
    return BoxDecoration(
      color: colorScheme.surface.withOpacity(0.95),
      border: Border.all(
          color: colorScheme.inverseSurface.withOpacity(0.2), width: 0.9),
      borderRadius: AppStylingConstants.commonBorderRadius,
    );
  }

  static BoxDecoration forGG(ThemeData theme) {
    return BoxDecoration(
      color: AppColors.black1.withOpacity(0.65),
      borderRadius: BorderRadius.circular(8),
      border: Border.all(width: 0.1),
    );
  }
/* */
}
