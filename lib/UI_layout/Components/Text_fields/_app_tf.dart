import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../State_management/Helpers/Common/helpers.dart';
import '../_Widgets_STYLING/app_text_styles_for_ui.dart';

class AppTextFields {
/* Textfield in Cupertino Style
 */
  static Widget inCupertinoStyle({
    TextEditingController? controller,
    required String placeholder,
    required BuildContext context,
    required bool isText,
    int maxLength = 24,
    bool isReadOnly = false,
    bool isName = false,
  }) {
    ThemeData theme = Helpers.theme(context);
    ColorScheme colorScheme = theme.colorScheme;

    return CupertinoTextField(
      readOnly: isReadOnly,
      controller: (controller != null) ? controller : null,
      maxLength: maxLength,
      keyboardType: isText
          ? TextInputType.text
          : const TextInputType.numberWithOptions(decimal: true),
      placeholder: placeholder,
      placeholderStyle: AppTextStyles.forTextField(theme)
          .copyWith(color: colorScheme.primary),
      style: AppTextStyles.forTextField(theme)
          .copyWith(fontWeight: FontWeight.w400),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: colorScheme.primary,
            width: 0.15,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 3),
      textAlign: (isName == true) ? TextAlign.left : TextAlign.center,
    );
  }
}
