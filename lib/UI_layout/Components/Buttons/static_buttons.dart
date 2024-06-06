import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../State_management/Helpers/Common/helpers.dart';
import '../../../State_management/Src/Generated_code/by easy_localization/locale_keys.g.dart';
import '../_Widgets_STYLING/_custom_button_style.dart';
import '../_Widgets_STYLING/_text_styles_for_components.dart';

class AppCustomButtons {
/* WITH SHADOWS
 */
  static Widget goToQuestionManager(
    BuildContext context,
    ColorScheme colorScheme,
  ) {
    return AppButtonsStyle.withShadows(
      context,
      onPressed: () {
        context.pushNamed('QuestionHandler');
      },
      buttonText: "To Questions Manager",
      colorScheme: colorScheme,
    );
  }

  static Widget goToGPTPage(
    BuildContext context,
    ColorScheme colorScheme,
  ) {
    return AppButtonsStyle.withShadows(
      context,
      onPressed: () {
        context.pushNamed('SendPromptPage');
      },
      buttonText: "To Chat GPT prompts",
      colorScheme: colorScheme,
    );
  }

  static Widget signInUp(
    BuildContext context, {
    required bool isLoginPage,
    required ColorScheme colorScheme,
    required void Function()? onPressed,
  }) {
    return AppButtonsStyle.withShadows(
      context,
      onPressed: onPressed,
      buttonText: isLoginPage ? 'Sign In' : 'Sign Up',
      colorScheme: colorScheme,
    );
  }

  static Widget goToTextFieldPage(
    BuildContext context, {
    required ColorScheme colorScheme,
    // required void Function()? onPressed,
  }) {
    return AppButtonsStyle.withShadows(
      context,
      onPressed: () {
        context.pushNamed('TextFieldPage');
      },
      buttonText: LocaleKeys.goToTextfield.tr(),
      colorScheme: colorScheme,
    );
  }

  static Widget goToHivePage(
    BuildContext context, {
    required ColorScheme colorScheme,
    // required void Function()? onPressed,
  }) {
    return AppButtonsStyle.withShadows(
      context,
      onPressed: () {
        context.pushNamed('HiveBoxPage');
      },
      buttonText: LocaleKeys.goToHiveBox.tr(),
      colorScheme: colorScheme,
    );
  }

/*

 */
  static Widget withGradient(
    BuildContext context, {
    required VoidCallback onPressed,
    required String buttonText,
  }) {
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
            child: Text(buttonText, style: AppTextStyles.forButtons(context)),
          ),
        ),
      ),
    );
  }

  static Widget cupertinoButton1(
    BuildContext context, {
    required String buttonText,
  }) {
    return SizedBox(
      width: double.infinity,
      child: CupertinoButton.filled(
        pressedOpacity: 0.8,
        onPressed: () {},
        child: Text(
          buttonText,
          style: AppTextStyles.forButtons(context),
        ),
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
OUTLINED Button
 */
  static Widget answerButton4FIApp({
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
          answerText,
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
