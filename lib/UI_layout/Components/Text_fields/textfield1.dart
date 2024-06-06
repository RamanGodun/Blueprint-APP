import 'package:flutter/material.dart';

import '../_Widgets_STYLING/for_text_fields.dart';
import '../_Widgets_STYLING/0.text_styles_for_components.dart';

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
          style: TextStyle4Components.bodyMedium(context),
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
