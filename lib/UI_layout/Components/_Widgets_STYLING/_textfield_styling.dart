import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../State_management/Theme_configuration/app_colors.dart';
import '../Pickers/country_picker.dart';

abstract class DialogStyling {
  static enabledBorderForTF(double borderWidth, double borderRadius) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.white, width: borderWidth),
      borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
    );
  }

  static focusedBorderForTF(
      double borderWidth, double borderRadius, Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color, width: borderWidth),
      borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
    );
  }

  static errorBorderForTF(
      double borderWidth, double borderRadius, Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color, width: borderWidth),
      borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
    );
  }

  static focusedErrorBorderForTF(
      double borderWidth, double borderRadius, Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color, width: borderWidth),
      borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
    );
  }

  static InputDecoration inputDecorForTF(
      ThemeData theme, String hintText, IconData icon) {
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return InputDecoration(
      contentPadding:
          const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9.0),
        borderSide: BorderSide(
          color: colorScheme.onSurface.withOpacity(0.3),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9.0),
        borderSide: BorderSide(
          color: colorScheme.primary,
        ),
      ),
      fillColor: colorScheme.surface,
      filled: true,
      hintText: hintText,
      hintStyle: textTheme.bodyMedium?.copyWith(
        color: colorScheme.onSurface.withOpacity(0.5),
      ),
      prefixIcon: Icon(
        icon,
        color: colorScheme.onSurface.withOpacity(0.5),
      ),
    );
  }

//
  static InputDecoration inputDecoration4FormField({
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
    return InputDecoration(
      prefixIcon: (isNeedPrefixIcon == true) ? const CountryPicker() : null,
      suffixIcon: (isNeedSuffixIcon == true) ? Icon(icon) : null,
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
          DialogStyling.enabledBorderForTF(borderWidth, borderRadius),
      focusedBorder: DialogStyling.focusedBorderForTF(
          borderWidth, borderRadius, AppColors.kAppPrimaryColor),
      errorBorder: DialogStyling.errorBorderForTF(
          borderWidth, borderRadius, AppColors.kAppPrimaryColor),
      focusedErrorBorder: DialogStyling.focusedErrorBorderForTF(
          borderWidth, borderRadius, Colors.red),
    );
  }
}
