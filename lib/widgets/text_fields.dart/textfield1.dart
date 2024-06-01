import 'package:flutter/material.dart';

import '../../State_management/Theme_configuration/Widgets_styling/for_text_fields.dart';
import '../../State_management/Theme_configuration/text_styles.dart';

class CustomTextFields {
  static Widget customTextField1({
    required BuildContext context,
    required TextEditingController controller,
    required String hintText,
    required bool isObscureText,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: SizedBox(
        height: 50,
        child: TextField(
          controller: controller,
          obscureText: isObscureText,
          style: ThisAppTextStyles.bodyMedium(context),
          decoration: StaticInputDecorations4Textfield1.inputDecoration(
            context,
            hintText,
            icon,
          ),
        ),
      ),
    );
  }
}
