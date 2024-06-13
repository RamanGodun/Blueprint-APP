import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../State_management/Helpers/Common/helpers.dart';
import '../../../State_management/Models/models_4_tracker_on_isar /item_model.dart';
import '../../../State_management/Theme_configuration/app_colors.dart';

abstract class AppTextStyling {
  /* General text styles */

  // Загальний стиль тексту для кнопок
  static TextStyle forButtons(ThemeData theme) {
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return textTheme.titleMedium!.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 17,
      letterSpacing: 1.04,
      wordSpacing: 1.96,
      color: colorScheme.onPrimary,
    );
  }

  // Стиль тексту для заголовка AppBar
  static TextStyle appBarTitle(BuildContext context, ThemeData theme) {
    final CupertinoThemeData cupertinoTheme =
        Helpers.cupertinoThemeGet(context);
    final colorScheme = theme.colorScheme;
    return cupertinoTheme.textTheme.navTitleTextStyle
        .copyWith(color: colorScheme.onSurface);
  }

  // Стиль тексту для заголовка в тілі
  static TextStyle bodyMedium(ThemeData theme) {
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    return textTheme.bodyMedium!.copyWith(
      color: colorScheme.onSurface,
      fontSize: 16.0,
    );
  }

  // Стиль тексту для підказки
  static TextStyle hintText(ThemeData theme) {
    final hintText =
        theme.textTheme.bodyMedium!.copyWith(color: AppColors.inactiveGray);
    return hintText;
  }

  // Стиль тексту для текстових полів
  static TextStyle forTextField(ThemeData theme) {
    TextStyle textStyle = theme.textTheme.displaySmall!.copyWith(
      fontSize: 11.5,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w300,
    );
    return textStyle;
  }

  // Стиль тексту для дій
  static TextStyle forActionText(ThemeData theme) {
    final TextStyle forActionText =
        theme.textTheme.labelLarge!.copyWith(color: theme.colorScheme.primary);
    return forActionText;
  }

  // Стиль тексту для великого тіла
  static TextStyle bodyLarge(ThemeData theme) {
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    return textTheme.bodyLarge!.copyWith(
      color: colorScheme.onSurface,
    );
  }

  /* Common Cupertino Button Style */

  // Стиль тексту для кнопок Cupertino
  static TextStyle cupertinoButtonStyle(
    BuildContext context, {
    required Color color,
    FontWeight fontWeight = FontWeight.normal,
    FontStyle fontStyle = FontStyle.normal,
  }) {
    final textTheme = Helpers.cupertinoThemeGet(context).textTheme;
    return textTheme.actionTextStyle.copyWith(
      fontSize: 17,
      color: color,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      letterSpacing: 1.15,
    );
  }

  /* Common Material Button Style */

  // Стиль тексту для кнопок Material
  static TextStyle materialButtonStyle(BuildContext context,
      {required Color color, FontWeight fontWeight = FontWeight.normal}) {
    return TextStyle(
      fontSize: 17,
      fontWeight: fontWeight,
      color: color,
    );
  }

  /* Text styles for FI APP */

  // Стиль тексту для питань
  static TextStyle questionTextStyle(ThemeData theme) {
    final textTheme = theme.textTheme;
    return textTheme.labelSmall!.copyWith(height: 1.15);
  }

  // Стиль тексту для мітки відповіді
  static TextStyle answerLabelStyle(ThemeData theme) {
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    return textTheme.bodySmall!.copyWith(
      color: colorScheme.onSurface.withOpacity(0.55),
      height: 0.95,
      fontStyle: FontStyle.italic,
    );
  }

  // Стиль тексту для відповіді
  static TextStyle answerTextStyle(ThemeData theme, bool isCorrectAnswer) {
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    return textTheme.bodyMedium!.copyWith(
      color: isCorrectAnswer ? colorScheme.primary : colorScheme.error,
      height: 1.05,
    );
  }

  // Стиль тексту для вибору складності
  static TextStyle? forComplexityPicker(ThemeData theme, int selectedSegment) {
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return textTheme.displayMedium?.copyWith(
      color:
          selectedSegment == 0 ? colorScheme.onPrimary : colorScheme.onSurface,
    );
  }

  // Стиль тексту для вибору функціональних інтерв'ю
  static TextStyle forFIPicker(ThemeData theme, ColorScheme colorScheme) {
    return theme.textTheme.displayLarge!
        .copyWith(color: colorScheme.onTertiary.withOpacity(0.67));
  }

  /* Text styles for JBnTracker APP */

  // Стиль тексту для підзаголовка
  static TextStyle subtitleTextStyle(
      ThemeData theme, bool isPurchase, ItemModel itemData) {
    return theme.textTheme.bodySmall!.copyWith(fontSize: 9);
  }

  // Стиль тексту для відступу
  static TextStyle trailingTextStyle(ThemeData theme) {
    return theme.textTheme.bodyMedium!;
  }

  // Стиль тексту для текстових полів прапорця
  static TextStyle checkboxTextStyle(ThemeData theme, ItemModel itemData) {
    final colorScheme = theme.colorScheme;
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: colorScheme.onSurface,
    );
  }

  /* FOR SHOP */

  // Стиль тексту для нової ціни
  static TextStyle newPriceStyle() {
    return const TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      color: AppColors.kAppPrimaryColor,
    );
  }

  // Стиль тексту для ціни
  static TextStyle priceStyle() {
    return const TextStyle(
      color: Colors.white,
      fontSize: 10,
    );
  }

  // Стиль тексту для старої ціни
  static TextStyle oldPriceStyle() {
    return const TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
      decoration: TextDecoration.lineThrough,
    );
  }

  // Стиль тексту для знижки
  static TextStyle discountTextStyle() {
    return const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
  }

  // Стиль тексту для назви товару
  static TextStyle productNameStyle() {
    return const TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    );
  }

  // Стиль тексту для заголовка
  static TextStyle titleTextStyle(
      TextTheme textTheme, Color itemColor, bool isExpense) {
    return textTheme.displaySmall!.copyWith(
      color: itemColor,
      fontSize: isExpense ? 10 : 12,
    );
  }

  // Стиль тексту для текстових полів форми
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

  // Стиль тексту для тексту кнопки випадаючого списку
  static TextStyle forDDButtonTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.displaySmall!.copyWith(
          fontSize: 11.5,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w300,
        );
  }
}
