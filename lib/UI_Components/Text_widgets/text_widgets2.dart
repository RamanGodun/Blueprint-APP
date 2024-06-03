import 'package:flutter/material.dart';
import '../../State_management/Const_data/strings_4_app.dart';
import '../../State_management/Src/Helpers/helpers.dart';

class TextWidgets {
/*
TITLE For Result Screen
 */
  static Widget titleForResultScreen({
    required BuildContext context,
    required int numCorrectQuestions,
    required int numTotalQuestions,
    required ColorScheme colorScheme,
    required TextTheme textTheme,
  }) {
    final theme = Helpers.cupertinoThemeData(context);
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
"BUILD TEXT" Widget
 */
  static Widget buildText({required String text, TextStyle? style}) {
    return
// Align(
//       child:
        FittedBox(
      child: Text(
        text,
        style: style,
      ),
      // ),
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
      // decoration: BoxDecoration(),
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

  static Widget text4EmptyField(String text, BuildContext context) {
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
