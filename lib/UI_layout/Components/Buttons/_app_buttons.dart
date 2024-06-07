import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../State_management/Src/Generated_code/by easy_localization/locale_keys.g.dart';
import '../../../State_management/Theme_configuration/Themes_provider/manager_of_themes.dart';
import '../_Widgets_STYLING/_custom_button_style.dart';

class AppCustomButtons {
/* WITH SHADOWS
 */
  static Widget goToQuestionManager(
    BuildContext context,
    ColorScheme colorScheme,
  ) {
    return AppButtonsStyle.inIOSStyle(
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
    final ColorScheme colorScheme = InheritedThemeManager.colorScheme(context)!;
    return AppButtonsStyle.firstDesign(
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
    return AppButtonsStyle.styleFrom(
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
    return AppButtonsStyle.withGradient(
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
    return AppButtonsStyle.styleFrom(
      context,
      onPressed: () {
        context.pushNamed('HiveBoxPage');
      },
      buttonText: LocaleKeys.goToHiveBox.tr(),
      colorScheme: colorScheme,
    );
  }

  static Widget goToGPTApiKeyPage(
    BuildContext context, {
    required ColorScheme colorScheme,
    // required void Function()? onPressed,
  }) {
    return AppButtonsStyle.withGradient(
      context,
      onPressed: () {
        context.pushNamed('HiveBoxPage');
      },
      buttonText: "To enter GPT API key",
      colorScheme: colorScheme,
    );
  }

  static Widget startButtonForInterviewerAPP(
    BuildContext context, {
    required ColorScheme colorScheme,
    required void Function()? onPressed,
  }) {
    return AppButtonsStyle.inIOSStyle(
      context,
      onPressed: onPressed,
      buttonText: "OK",
      colorScheme: colorScheme,
    );
  }

  static Widget submitButton(
    BuildContext context, {
    required ColorScheme colorScheme,
    required void Function()? onPressed,
  }) {
    return AppButtonsStyle.inIOSStyle(
      context,
      onPressed: onPressed,
      buttonText: "Submit",
      colorScheme: colorScheme,
    );
  }

  static Widget fIAnswerButton(
    BuildContext context, {
    required ThemeData theme,
    required void Function()? onPressed,
    required buttonText,
  }) {
    return AppButtonsStyle.forInterviewerAppAnswerButton(
      context,
      onPressed: onPressed,
      buttonText: buttonText,
      theme: theme,
    );
  }

  static Widget enterButton4GG(
    BuildContext context, {
    required ColorScheme colorScheme,
    required void Function()? onPressed,
    required buttonText,
  }) {
    return AppButtonsStyle.firstDesign(
      context,
      onPressed: () {
        context.pushNamed('TextFieldPage');
      },
      buttonText: LocaleKeys.goToTextfield.tr(),
      colorScheme: colorScheme,
    );
  }

/* 
*/
}
