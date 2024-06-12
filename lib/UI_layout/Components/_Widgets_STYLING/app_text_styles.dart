import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../State_management/Helpers/Common/helpers.dart';
import '../../../State_management/Models/models_4_tracker_on_isar /item_model.dart';
import '../../../State_management/Theme_configuration/app_colors.dart';

abstract class AppTextStyles {
/* General text styles
 */
  static TextStyle forButtons(ThemeData theme) {
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
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

  static TextStyle appBarTitle(BuildContext context, ThemeData theme) {
    final CupertinoThemeData cupertinoTheme =
        Helpers.cupertinoThemeGet(context);
    final colorScheme = theme.colorScheme;
    return cupertinoTheme.textTheme.navTitleTextStyle
        .copyWith(color: colorScheme.onSurface);
  }

  static TextStyle bodyMedium(ThemeData theme) {
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    return textTheme.bodyMedium!.copyWith(
      color: colorScheme.onSurface,
      fontSize: 16.0,
    );
  }

  static TextStyle forTextField(ThemeData theme) {
    TextStyle textStyle = theme.textTheme.displaySmall!.copyWith(
      fontSize: 11.5,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w300,
    );
    return textStyle;
  }

  static TextStyle forActionText(ThemeData theme) {
    final TextStyle forActionText =
        theme.textTheme.labelLarge!.copyWith(color: theme.colorScheme.primary);
    return forActionText;
  }

/* Text styles for FI APP
 */
  static TextStyle questionTextStyle(ThemeData theme) {
    final textTheme = theme.textTheme;
    return textTheme.labelSmall!.copyWith(height: 1.15);
  }

  static TextStyle answerLabelStyle(ThemeData theme) {
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    return textTheme.bodySmall!.copyWith(
      color: colorScheme.onSurface.withOpacity(0.55),
      height: 0.95,
      fontStyle: FontStyle.italic,
    );
  }

  static TextStyle answerTextStyle(ThemeData theme, bool isCorrectAnswer) {
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    return textTheme.bodyMedium!.copyWith(
      color: isCorrectAnswer ? colorScheme.primary : colorScheme.error,
      height: 1.05,
    );
  }

  static TextStyle? forComplexityPicker(ThemeData theme, int selectedSegment) {
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return textTheme.displayMedium?.copyWith(
      color:
          selectedSegment == 0 ? colorScheme.onPrimary : colorScheme.onSurface,
    );
  }

  static TextStyle forFIPicker(ThemeData theme, ColorScheme colorScheme) {
    return theme.textTheme.displayLarge!
        .copyWith(color: colorScheme.onTertiary.withOpacity(0.67));
  }

/* Text styles for JBnTracker APP
 */
  static TextStyle subtitleTextStyle(
      ThemeData theme, bool isPurchase, ItemModel itemData) {
    return theme.textTheme.bodySmall!.copyWith(fontSize: 9);
  }

  static TextStyle trailingTextStyle(ThemeData theme) {
    return theme.textTheme.bodyMedium!;
  }

  static TextStyle checkboxTextStyle(ThemeData theme, ItemModel itemData) {
    final colorScheme = theme.colorScheme;
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: colorScheme.onSurface,
    );
  }

/* FOR SHOP
 */
  static TextStyle newPriceStyle() {
    return const TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      color: AppColors.kAppPrimaryColor,
    );
  }

  static TextStyle priceStyle() {
    return const TextStyle(
      color: Colors.white,
      fontSize: 10,
    );
  }

  static TextStyle oldPriceStyle() {
    return const TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
      decoration: TextDecoration.lineThrough,
    );
  }

  static TextStyle discountTextStyle() {
    return const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
  }

  static TextStyle productNameStyle() {
    return const TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    );
  }

  static TextStyle titleTextStyle(
      TextTheme textTheme, Color itemColor, bool isExpense) {
    return textTheme.displaySmall!.copyWith(
      color: itemColor,
      fontSize: isExpense ? 10 : 12,
    );
  }

  static TextStyle forTextFormField(ThemeData theme, double? textSize) {
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final textStyle = textTheme.bodyMedium!.copyWith(
      color: colorScheme.primary,
      fontSize: textSize ?? 17,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
    );
    return textStyle;
  }
}
