import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../State_management/Src/Const_data/app_locales.dart';
import '../../../State_management/Src/Custom_icons/custom_icons_src.dart';
import '../../../State_management/Helpers/Common/helpers.dart';
import '../_Widgets_STYLING/0.text_styles_for_components.dart';

class StaticCustomButtons {
  static Widget customButton(BuildContext context,
      {required VoidCallback onPressed, required String buttonText}) {
    final theme = Helpers.cupertinoThemeData(context);

    return Material(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                theme.primaryColor.withOpacity(0.9),
                theme.primaryColor.withOpacity(0.95),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: CupertinoColors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
              BoxShadow(
                color: CupertinoColors.black.withOpacity(0.05),
                spreadRadius: 0.5,
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle4Components.buttonTextStyle(context),
            ),
          ),
        ),
      ),
    );
  }

  static Widget customButton2(BuildContext context,
      {required VoidCallback onPressed, required String buttonText}) {
    final theme = Helpers.cupertinoThemeData(context);

    return Material(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                theme.primaryColor.withOpacity(0.9),
                theme.primaryColor.withOpacity(0.95),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: CupertinoColors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
              BoxShadow(
                color: CupertinoColors.black.withOpacity(0.05),
                spreadRadius: 0.5,
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Center(
            child: Text(buttonText,
                style: TextStyle4Components.buttonTextStyle(context)
                //  theme.textTheme.textStyle.copyWith(
                //               color: CupertinoColors.white,
                //               fontWeight: FontWeight.w600,
                //               fontSize: 16,
                //             ),
                ),
          ),
        ),
      ),
    );
  }

  static Widget cupertinoButton1(
    BuildContext context, {
    required String buttonText,
  }) {
    return Material(
      child: SizedBox(
        width: double.infinity,
        child: CupertinoButton.filled(
          pressedOpacity: 0.8,
          onPressed: () {
            // if (isValid.value) {
            //   // Handle the submit action
            // } else {
            //   validateInput();
            // }
          },
          child: Text(buttonText,
              style: TextStyle4Components.buttonTextStyle(context)),
        ),
      ),
    );
  }

  static Widget changeLanguageButton(BuildContext context) {
    final theme = Helpers.cupertinoThemeData(context);
    final appLocales = AppLocales().appLocales;

    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        Locale newLocale =
            context.locale == appLocales[0] ? appLocales[1] : appLocales[0];
        context.setLocale(newLocale);
      },
      child: Icon(
        ThisAppIcons.globe,
        color: theme.primaryColor,
        shadows: [
          BoxShadow(
            color: CupertinoColors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(1, 3),
          ),
        ],
      ),
    );
  }

/*
INIT BUTTON
 */
  static Widget startButton(
      {required VoidCallback startQuiz,
      required ColorScheme colorScheme,
      required TextTheme textTheme,
      required BuildContext context}) {
    return SizedBox(
      width: double.infinity,
      child: CupertinoButton.filled(
        onPressed: () {
          startQuiz();
          // final inheritedWidget = DataProviderInherited.of(context);
          // if (inheritedWidget != null) {
          //   inheritedWidget.setQuestionList(
          //     QuestionAndAnswers.generateRandomQuestionsList(
          //         selectedQuantity.toInt()),
          //   );
          // }
        },
        padding: const EdgeInsets.all(12),
        borderRadius: BorderRadius.circular(8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              CupertinoIcons.play_arrow,
              color: colorScheme.onPrimary,
            ),
            const SizedBox(width: 8),
            Text(
              "OK",
              style: textTheme.displayMedium,
            ),
          ],
        ),
      ),
    );
  }

/*
ANSWER BUTTON
 */
  static Widget answerButton({
    required BuildContext context,
    required String answerText,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    return ElevatedButton(
      style: OutlinedButton.styleFrom(
          backgroundColor: theme.colorScheme.surface.withOpacity(0.4),
          side: BorderSide(color: theme.colorScheme.primary, width: 0.7)),
      onPressed: onTap,
      child: Center(
        child: Text(
          answerText.substring(5),
          textAlign: TextAlign.center,
          style: theme.textTheme.labelMedium,
          maxLines: 2,
          softWrap: true,
          selectionColor: theme.colorScheme.primary.withOpacity(0.6),
        ),
      ),
    );
  }
}
