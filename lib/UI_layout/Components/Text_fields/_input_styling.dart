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

/*
   for TEXT FORM
 */
  static InputDecoration inputDecorationForFormField({
    required ColorScheme colorScheme,
    required TextStyle? textStyle,
    required bool isNeedPrefixIcon,
    required bool isNeedSuffixIcon,
    required bool showCounterText,
    required IconData? icon,
    required int maxLength,
    Widget? prefix,
    String? suffixText,
    String? labelText,
    required double borderWidth,
    required double borderRadius,
  }) {
    const prefixIcon = CountryPicker();
    final suffixIcon = Icon(icon);
    return InputDecoration(
      prefixIcon: (isNeedPrefixIcon == true) ? prefixIcon : null,
      suffixIcon: (isNeedSuffixIcon == true) ? suffixIcon : null,
      contentPadding: AppStylingConstants.commonPadding,
      counterText: showCounterText ? maxLength.toString() : '',
      counterStyle: textStyle,
      border: InputBorder.none,
      prefix: prefix,
      prefixStyle: textStyle,
      suffixText: suffixText,
      suffixStyle: textStyle,
      labelText: labelText ?? "",
      labelStyle: textStyle?.copyWith(fontSize: 14),
      hintStyle: textStyle?.copyWith(color: AppColors.inactiveGray),
      enabledBorder: AppBordersStyling.enabledBorderForTF(),
      focusedBorder: AppBordersStyling.focusedBorderForTF(),
      errorBorder: AppBordersStyling.errorBorderForTF(),
      focusedErrorBorder: AppBordersStyling.focusedErrorBorderForTF(),
    );
  }
}
