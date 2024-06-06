import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../State_management/Helpers/Common/helpers.dart';

abstract class AppTextStyles {
  static TextStyle? bodyMedium(BuildContext context) {
    final textTheme = Helpers.textTheme(context);
    final colorScheme = Helpers.colorScheme(context);
    return textTheme.bodyMedium?.copyWith(
      color: colorScheme.onSurface,
      fontSize: 16.0,
    );
  }

  static TextStyle forButtons(BuildContext context) {
    final colorScheme = Helpers.colorScheme(context);
    final textTheme = Helpers.textTheme(context);
    final buttonsTextStyle = textTheme.titleMedium?.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 18,
      letterSpacing: 1.03,
      wordSpacing: 1.76,
      color: colorScheme.onPrimary,
    );
    return buttonsTextStyle ??
        TextStyle(
          fontWeight: FontWeight.w500,
          letterSpacing: 1.03,
          wordSpacing: 1.76,
          fontSize: 16,
          color: colorScheme.onPrimary,
        );
  }

  static TextStyle appBarTitle(
      {required CupertinoThemeData cupertinoTheme,
      required ColorScheme colorScheme}) {
    return cupertinoTheme.textTheme.navTitleTextStyle
        .copyWith(color: colorScheme.onSurface);
  }
}
