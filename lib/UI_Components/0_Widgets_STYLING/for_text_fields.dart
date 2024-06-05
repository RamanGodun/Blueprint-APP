import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../State_management/Src/Helpers/Common/helpers.dart';

abstract class StaticInputDecorations4Textfield1 {
  static InputDecoration inputDecoration(
    BuildContext context,
    String hintText,
    IconData icon,
  ) {
    final colorScheme = Helpers.colorScheme(context);
    final textTheme = Helpers.textTheme(context);

    return InputDecoration(
      contentPadding:
          const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9.0),
        borderSide: BorderSide(
          color: colorScheme.onSurface.withOpacity(0.3),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9.0),
        borderSide: BorderSide(
          color: colorScheme.primary,
        ),
      ),
      fillColor: colorScheme.surface,
      filled: true,
      hintText: hintText,
      hintStyle: textTheme.bodyMedium?.copyWith(
        color: colorScheme.onSurface.withOpacity(0.5),
      ),
      prefixIcon: Icon(
        icon,
        color: colorScheme.onSurface.withOpacity(0.5),
      ),
    );
  }

/* next FROM JBnTracker App */
  static Widget cupertinoTextField({
    TextEditingController? controller,
    required String placeholder,
    required BuildContext context,
    required bool isText,
    int maxLength = 24,
    bool isReadOnly = false,
    bool isName = false,
  }) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextStyle textStyle = Theme.of(context).textTheme.displaySmall!.copyWith(
          fontSize: 11.5,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w300,
        );

    return CupertinoTextField(
      readOnly: isReadOnly,
      controller: (controller != null) ? controller : null,
      maxLength: maxLength,
      keyboardType: isText
          ? TextInputType.text
          : const TextInputType.numberWithOptions(decimal: true),
      placeholder: placeholder,
      placeholderStyle: textStyle.copyWith(color: colorScheme.primary),
      style: textStyle.copyWith(fontWeight: FontWeight.w400),
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
