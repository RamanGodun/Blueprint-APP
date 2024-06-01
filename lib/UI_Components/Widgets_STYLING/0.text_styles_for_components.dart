import 'package:flutter/material.dart';
import '../../State_management/Src/Helpers/helpers.dart';

class TextStyle4Components {
  static TextStyle? bodyMedium(BuildContext context) {
    final textTheme = Helpers.textTheme(context);
    final colorScheme = Helpers.colorScheme(context);
    return textTheme.bodyMedium?.copyWith(
      color: colorScheme.onSurface,
      fontSize: 16.0,
    );
  }

  static TextStyle buttonTextStyle(BuildContext context) {
    final colorScheme = Helpers.colorScheme(context);
    return TextStyle(
      fontWeight: FontWeight.w500,
      letterSpacing: 0.95,
      wordSpacing: 1.01,
      fontSize: 15,
      color: colorScheme.onPrimary,
    );
  }
}
