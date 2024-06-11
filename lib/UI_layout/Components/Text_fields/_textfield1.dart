import 'package:flutter/material.dart';

import '../../../State_management/Helpers/Common/helpers.dart';
import '../_Widgets_STYLING/_for_text_fields.dart';
import '../_Widgets_STYLING/app_text_styles_for_ui.dart';

class CustomTextFields {
  static Widget customTextField1({
    required BuildContext context,
    required TextEditingController controller,
    required String hintText,
    required bool isObscureText,
    required IconData icon,
  }) {
    final ThemeData theme = Helpers.theme(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: SizedBox(
        height: 50,
        child: TextField(
          controller: controller,
          obscureText: isObscureText,
          style: AppTextStyles.bodyMedium(theme),
          decoration: AppTextFieldsStyling.cupertinoLikeInputDecoration(
            context,
            hintText,
            icon,
          ),
        ),
      ),
    );
  }
}
