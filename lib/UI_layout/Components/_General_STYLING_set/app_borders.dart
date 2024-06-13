import 'package:flutter/material.dart';
import '../../../State_management/Helpers/Common/helpers.dart';
import '../../../State_management/Theme_configuration/app_colors.dart';
import 'app_styling_constants.dart';

abstract class AppBordersStyling {
  /* Border для Android Box Decoration */
  static Border forAndroidBoxDecoration(ThemeData theme) {
    final isDarkMode = Helpers.isDarkTheme(theme);
    return Border.all(
      color: (isDarkMode)
          ? AppColors.cupertinoBlackColor.withOpacity(0.4)
          : theme.colorScheme.inverseSurface.withOpacity(0.1),
      width: 0.2,
    );
  }

  /* UnderlineInputBorder для текстового поля */
  static UnderlineInputBorder underLineInputBorder(
      ThemeData theme, bool isFocusedBorder) {
    final isDarkTheme = Helpers.isDarkTheme(theme);
    final colorScheme = theme.colorScheme;
    return UnderlineInputBorder(
      borderSide: BorderSide(
          color: isFocusedBorder
              ? colorScheme.secondary.withOpacity(isDarkTheme ? 0.25 : 0.25)
              : colorScheme.secondary.withOpacity(isDarkTheme ? 0.25 : 0.25),
          width: isDarkTheme ? 0.25 : 0.65),
      borderRadius: AppStylingConstants.commonBorderRadius,
    );
  }

  /* OutlineInputBorder для текстового поля з валідацією */
  static OutlineInputBorder enabledBorderForTF() {
    return OutlineInputBorder(
      borderSide:
          const BorderSide(color: AppColors.kSecondaryColor, width: 0.8),
      borderRadius: AppStylingConstants.commonBorderRadius,
    );
  }

  static OutlineInputBorder focusedBorderForTF() {
    return OutlineInputBorder(
      borderSide:
          const BorderSide(color: AppColors.kAppPrimaryColor, width: 0.8),
      borderRadius: AppStylingConstants.commonBorderRadius,
    );
  }

  static OutlineInputBorder errorBorderForTF() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.kErrorColor, width: 0.8),
      borderRadius: AppStylingConstants.commonBorderRadius,
    );
  }

  static OutlineInputBorder focusedErrorBorderForTF() {
    return OutlineInputBorder(
      borderSide:
          const BorderSide(color: AppColors.kErrorColorDark, width: 0.8),
      borderRadius: AppStylingConstants.commonBorderRadius,
    );
  }

  /* Border для Cupertino текстового поля */
  static Border border1ForCupertinoTextField(bool isValid) {
    return Border.all(
      color: isValid ? AppColors.inactiveGray : AppColors.kErrorColor,
      width: 1.0,
    );
  }

  static Border border2ForCupertinoTextField(bool isValid) {
    return Border(
      bottom: BorderSide(
        color: isValid ? AppColors.kAppPrimaryColor : AppColors.kErrorColor,
        width: 0.15,
      ),
    );
  }

  /* OutlineInputBorder для текстового поля з фокусом */
  static OutlineInputBorder focusBorderForTextField(ThemeData theme) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(9.0),
      borderSide: BorderSide(
        color: theme.colorScheme.primary,
      ),
    );
    return border;
  }

  /* OutlineInputBorder для активного текстового поля */
  static OutlineInputBorder enabledBorderForTextField(ThemeData theme) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(9.0),
      borderSide: BorderSide(
        color: theme.colorScheme.onSurface.withOpacity(0.3),
      ),
    );
    return border;
  }

  /* BorderRadius для округлення прямокутників */
  static double roundedRectangle(double? borderRadius) {
    return AppStylingConstants.generalBorderRadius;
  }

  /* BorderSide для відповіді на питання в FI */
  static BorderSide borderSideForFIAnswer(ThemeData theme) {
    return BorderSide(
      color: theme.colorScheme.primary.withOpacity(0.9),
      width: 0.7,
    );
  }

  /* RoundedRectangleBorder для округлення прямокутних кнопок */
  static RoundedRectangleBorder roundedRectangleBorderForButton(
      ThemeData theme) {
    return RoundedRectangleBorder(
      borderRadius: AppStylingConstants.commonBorderRadius,
      side: BorderSide(color: theme.colorScheme.primary.withOpacity(0.3)),
    );
  }

  /* ShapeBorder для діалогових вікон */
  static ShapeBorder rectangleBorderForDialog(ThemeData theme,
      {BorderRadius? borderRadius}) {
    return RoundedRectangleBorder(
      borderRadius: borderRadius ?? AppStylingConstants.radius12,
    );
  }
}
