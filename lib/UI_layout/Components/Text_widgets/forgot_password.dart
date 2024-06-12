import 'package:flutter/material.dart';

import '../../../State_management/Helpers/Common/helpers.dart';
import '../_Widgets_STYLING/app_text_styles.dart';

class ForgotPasswordTextWidget extends StatelessWidget {
  const ForgotPasswordTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Helpers.themeGet(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: openDialogForForgotPassword,
          child: Text(
            'Forgot Password?',
            style: AppTextStyles.forActionText(theme).copyWith(
              fontStyle: FontStyle.italic,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }

  void openDialogForForgotPassword() {}
}
