import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../State_management/Src/Generated_code/by easy_localization/locale_keys.g.dart';
import '_buttons_styling.dart';

class AppButtons {
/* WITH SHADOWS
 */
  static Widget goToQuestionManager(BuildContext context) {
    return AppButtonsStyling.inIOSStyle(
      context,
      onPressed: () {
        context.pushNamed('QuestionHandler');
      },
      buttonText: "To Questions Manager",
    );
  }

  static Widget goToGPTPage(BuildContext context) {
    return AppButtonsStyling.firstDesign(
      context,
      onPressed: () {
        context.pushNamed('SendPromptPage');
      },
      buttonText: "To Chat GPT prompts",
    );
  }

  static Widget signInUp(
    BuildContext context, {
    required bool isLoginPage,
    required void Function()? onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      child: AppButtonsStyling.forElevatedButton(
        context,
        onPressed: onPressed,
        buttonText: isLoginPage ? 'Sign In' : 'Sign Up',
      ),
    );
  }

  static Widget goToTextFieldPage(BuildContext context
      // required void Function()? onPressed,
      ) {
    return AppButtonsStyling.withGradient(
      context,
      onPressed: () {
        context.pushNamed('TextFieldPage');
      },
      buttonText: LocaleKeys.goToTextfield.tr(),
    );
  }

  static Widget goToHivePage(
      BuildContext context // required void Function()? onPressed,
      ) {
    return AppButtonsStyling.forElevatedButton(
      context,
      onPressed: () {
        context.pushNamed('HiveBoxPage');
      },
      buttonText: LocaleKeys.goToHiveBox.tr(),
    );
  }

  static Widget goToGPTApiKeyPage(
      BuildContext context // required void Function()? onPressed,
      ) {
    return AppButtonsStyling.withGradient(
      context,
      onPressed: () {
        context.pushNamed('ApiKeyInputPage');
      },
      buttonText: "To enter GPT API key",
    );
  }

  static Widget startButtonForInterviewerAPP(
    BuildContext context, {
    required void Function()? onPressed,
  }) {
    return AppButtonsStyling.inIOSStyle(
      context,
      onPressed: onPressed,
      buttonText: "OK",
    );
  }

  static Widget submitButton(
    BuildContext context, {
    required void Function()? onPressed,
  }) {
    return AppButtonsStyling.forElevatedButton(
      context,
      onPressed: onPressed,
      buttonText: "Submit",
    );
  }

  static Widget fIAnswerButton(
    BuildContext context, {
    required void Function()? onPressed,
    required buttonText,
  }) {
    return AppButtonsStyling.forOutlinedButton(
      context,
      onPressed: onPressed,
      buttonText: buttonText,
    );
  }

  static Widget enterButton4GG(
    BuildContext context, {
    required void Function()? onPressed,
    required buttonText,
  }) {
    return AppButtonsStyling.firstDesign(
      context,
      onPressed: () {
        context.pushNamed('TextFieldPage');
      },
      buttonText: LocaleKeys.goToTextfield.tr(),
    );
  }

/* 
*/
}
