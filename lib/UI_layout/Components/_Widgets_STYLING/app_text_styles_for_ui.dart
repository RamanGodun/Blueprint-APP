import 'package:flutter/material.dart';

import '../../../State_management/Helpers/Common/helpers.dart';
import '../../../State_management/Models/models_4_tracker_on_isar /item_model.dart';
import '../../../State_management/Theme_configuration/app_colors.dart';

abstract class AppTextStyles {
  static TextStyle forButtons(BuildContext context) {
    final theme = Helpers.theme(context);
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

  static TextStyle appBarTitle(BuildContext context) {
    final cupertinoTheme = Helpers.cupertinoTheme(context);
    final colorScheme = Helpers.colorScheme(context);
    return cupertinoTheme.textTheme.navTitleTextStyle
        .copyWith(color: colorScheme.onSurface);
  }

  static TextStyle? bodyMedium(BuildContext context) {
    final textTheme = Helpers.textTheme(context);
    final colorScheme = Helpers.colorScheme(context);
    return textTheme.bodyMedium?.copyWith(
      color: colorScheme.onSurface,
      fontSize: 16.0,
    );
  }

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

  static TextStyle subtitleTextStyle(
      TextTheme textTheme, bool isPurchase, ItemModel itemData) {
    return textTheme.bodySmall!.copyWith(fontSize: 9);
  }

  static TextStyle trailingTextStyle(TextTheme textTheme) {
    return textTheme.bodyMedium!;
  }

  static TextStyle checkboxTextStyle(BuildContext context, ItemModel itemData) {
    final colorScheme = Helpers.colorScheme(context);
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: colorScheme.onSurface,
    );
  }

  static TextStyle questionTextStyle(BuildContext context) {
    final textTheme = Helpers.textTheme(context);
    return textTheme.labelSmall!.copyWith(height: 1.15);
  }

  static TextStyle answerLabelStyle(BuildContext context) {
    final textTheme = Helpers.textTheme(context);
    final colorScheme = Helpers.colorScheme(context);
    return textTheme.bodySmall!.copyWith(
      color: colorScheme.onSurface.withOpacity(0.55),
      height: 0.95,
      fontStyle: FontStyle.italic,
    );
  }

  static TextStyle answerTextStyle(BuildContext context, bool isCorrectAnswer) {
    final textTheme = Helpers.textTheme(context);
    final colorScheme = Helpers.colorScheme(context);
    return textTheme.bodyMedium!.copyWith(
      color: isCorrectAnswer ? AppColors.kAppPrimaryColor : colorScheme.error,
      height: 1.05,
    );
  }
}
