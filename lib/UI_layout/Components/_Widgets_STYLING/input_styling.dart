import 'package:blueprint_4app/UI_layout/Components/_Widgets_STYLING/app_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../State_management/Theme_configuration/app_colors.dart';
import '../Pickers/country_picker.dart';
import 'app_borders.dart';
import 'app_styling_constants.dart';

abstract class InputDecorationStyling {
  static InputDecoration inputDecorationForTextField(
      ThemeData theme, String hintText, IconData? icon) {
    final colorScheme = theme.colorScheme;
    return InputDecoration(
      contentPadding: AppStylingConstants.commonPadding,
      enabledBorder: AppBordersStyling.enabledBorderForTextField(theme),
      focusedBorder: AppBordersStyling.focusBorderForTextField(theme),
      fillColor: colorScheme.surface,
      filled: true,
      hintText: hintText,
      hintStyle: AppTextStyles.bodyMedium(theme)
          .copyWith(color: AppColors.inactiveGray),
      prefixIcon: (icon != null)
          ? Icon(icon, color: colorScheme.onSurface.withOpacity(0.5))
          : null,
    );
  }

//
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
      contentPadding: const EdgeInsets.all(8),
      counterText: showCounterText ? maxLength.toString() : '',
      counterStyle: textStyle,
      border: InputBorder.none,
      prefix: prefix,
      prefixStyle: textStyle,
      suffixText: suffixText,
      suffixStyle: textStyle,
      labelText: labelText ?? "",
      labelStyle: textStyle?.copyWith(fontSize: 14),
      hintStyle: textStyle?.copyWith(color: CupertinoColors.inactiveGray),
      errorStyle: textStyle?.copyWith(
        debugLabel: "Validation not passed",
        overflow: TextOverflow.fade,
        fontSize: 0,
      ),
      enabledBorder:
          AppBordersStyling.enabledBorderForTF(borderWidth, borderRadius),
      focusedBorder: AppBordersStyling.focusedBorderForTF(
          borderWidth, borderRadius, AppColors.kAppPrimaryColor),
      errorBorder: AppBordersStyling.errorBorderForTF(
          borderWidth, borderRadius, AppColors.kAppPrimaryColor),
      focusedErrorBorder: AppBordersStyling.focusedErrorBorderForTF(
          borderWidth, borderRadius, Colors.red),
    );
  }
}
