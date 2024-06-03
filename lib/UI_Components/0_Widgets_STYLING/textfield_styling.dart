import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class DialogStyling {
  //
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
//

//
}
