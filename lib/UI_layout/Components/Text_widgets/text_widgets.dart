import 'package:flutter/material.dart';
import '../../../State_management/Src/Const_data/strings_4_app.dart';
import '../../../State_management/Helpers/Common/helpers.dart';
import '../_Widgets_STYLING/app_text_styles_for_ui.dart';

class AppTextWidgetsStyles {
/* 
   OFTEN USED Text widgets
 */
  static Widget forAppBarTitle(
    BuildContext context, {
    required String text,
  }) {
    return Text(
      text,
      style: AppTextStyles.appBarTitle(context),
    );
  }

/*
Example of RICH TEXT
 */
  static Widget forResultScreenTitle(
    BuildContext context, {
    required int numCorrectQuestions,
    required int numTotalQuestions,
  }) {
    final theme = Helpers.theme(context);
    final TextTheme textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    TextStyle? textStyle =
        textTheme.displayLarge?.copyWith(color: colorScheme.onPrimary);
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10, top: 30, bottom: 3),
      child: Text.rich(
        TextSpan(
          text: AppStrings.uAnswered,
          style: textStyle,
          children: [
            TextSpan(
              text: '$numCorrectQuestions',
              style: textStyle?.copyWith(color: theme.primaryColor),
            ),
            TextSpan(text: AppStrings.outOf, style: textStyle),
            TextSpan(
              text: '$numTotalQuestions',
              style:
                  textTheme.displayLarge?.copyWith(color: theme.primaryColor),
            ),
            TextSpan(text: AppStrings.questionsCorrectly, style: textStyle),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

/*
TEXT widgets
 */
  static Widget titleForPurchasePageWidget(BuildContext context) {
    return Container(
      color: Helpers.colorScheme(context)
          .surface
          .withOpacity(Helpers.isDarkTheme(context) ? 0.55 : 0.9),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 17.0),
            child: text4PurchasePageTitle(AppStrings.quantityText, context),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: text4PurchasePageTitle(AppStrings.nameText, context),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 23.0),
            child: text4PurchasePageTitle(AppStrings.isBuyText, context),
          ),
        ],
      ),
    );
  }

  static Widget forEmptyPageText(BuildContext context, String text) {
    return Center(
      child: Text(text, style: Theme.of(context).textTheme.labelMedium),
    );
  }

  static Text text4PurchasePageTitle(String text, BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.bodySmall);
  }

  static Text text4PurchaseListTitle(String text, BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.bodySmall);
  }

  static Widget errorTextWidget(String errorText) {
    return Center(
      child: Text(
          "$AppStrings.errorOcurredTextLoc $errorText$AppStrings.tryLaterTextLoc"),
    );
  }
}
