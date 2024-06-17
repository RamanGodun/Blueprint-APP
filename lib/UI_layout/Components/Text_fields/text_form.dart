import 'package:flutter/material.dart';

import '../../../State_management/Models/app_enums.dart';
import '../../../State_management/Services/text_validation_service.dart';
import '../../../State_management/Theme_configuration/app_colors.dart';
import '../_General_STYLING_set/app_borders.dart';
import '../_General_STYLING_set/app_styling_constants.dart';
import '../_General_STYLING_set/app_text_styling.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.controller,
    required this.theme,
    required this.focusNode,
    this.validatorType = ValidatorType.string,
    this.hintText = "Hint text",
    // this.labelText = "Label text",
    this.isObscureText = false,
    this.maxLength = 24,
    this.isReadOnly = false,
    this.isAllBorder = true,
    this.showHintText = true,
    this.showCounterText = true,
    this.heightOfField = 50,
    this.widthOfField = double.infinity,
    this.isNeedSuffixIcon = false,
    this.isNeedPrefixIcon = false,
    this.autoFocus = false,
    this.textAlign = TextAlign.start,
    this.borderRadius = 9.0,
    this.borderWidth = 1.0,
    this.maxLines = 1,
    this.allowEmpty = false,
    this.keyboardType = TextInputType.text,
    this.icon,
    this.prefix,
    this.suffixText,
    this.textSize,
    this.obscuringCharacter = "*",
    this.restorationId,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
  });

  final TextEditingController controller;
  final ValidatorType validatorType;
  final FocusNode focusNode;
  final ThemeData theme;
  final String hintText, obscuringCharacter; // labelText,
  final IconData? icon;
  final Widget? prefix;
  final String? suffixText;
  final double? textSize;
  final int maxLength, maxLines;
  final double heightOfField, widthOfField, borderRadius, borderWidth;
  final bool isObscureText,
      isReadOnly,
      isAllBorder,
      showCounterText,
      showHintText,
      isNeedSuffixIcon,
      isNeedPrefixIcon,
      autoFocus,
      allowEmpty;
  final TextAlign textAlign;
  final TextInputType? keyboardType;
  final String? restorationId;
  final VoidCallback? onEditingComplete;
  final void Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    final colorScheme = theme.colorScheme;
    final textStyle = AppTextStyling.forTextFormField(theme, textSize);
/* const prefixIcon = CountryPicker(); - this for countries flags */

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        color: AppColors.transparent,
        margin: AppStylingConstants.zeroPadding,
        height: heightOfField,
        width: widthOfField,
        child: TextFormField(
          restorationId: restorationId,
          controller: controller,
          keyboardType: keyboardType,
          /* 
        VALIDATION  */
          validator: _getValidator(),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          /* 
        HANDLERS */
          onEditingComplete: onEditingComplete,
          onFieldSubmitted: onFieldSubmitted,
          onSaved: onSaved,
          // onTapOutside: () {},
          /* 
        Text STYLING */
          style: textStyle,
          textAlign: textAlign,
          /* 
        CURSOR */
          showCursor: true,
          cursorWidth: 1.5,
          cursorHeight: 15,
          cursorColor: colorScheme.secondary,
          cursorErrorColor: colorScheme.errorContainer,
          obscuringCharacter: obscuringCharacter,
          /* 
        MAX parameters */
          maxLines: maxLines,
          maxLength: maxLength,
          /* 
        FOCUS */
          autofocus: autoFocus,
          focusNode: focusNode,
          /* 
        INPUT DECORATION */
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
            /* 
          COUNTER */
            counterText: (!showCounterText
//  || controller.text.isEmpty
                )
                ? ""
                : "${controller.text.length}/$maxLength",
            counterStyle: AppTextStyling.label(theme),
            /* 
          PREFIX */
            prefixIcon: (isNeedPrefixIcon == true) ? Icon(icon) : null,
            prefix: prefix,
            prefixStyle: textStyle,
            /* 
          SUFFIX */
            suffixIcon: (isNeedSuffixIcon == true) ? Icon(icon) : null,
            suffixText: suffixText,
            suffixStyle: textStyle,
            /* 
          LABEL & HINT text */
            // labelText: labelText,
            labelStyle: textStyle.copyWith(fontSize: 14),
            // label: Some widget can be here,
            hintText: hintText,
            hintStyle: textStyle.copyWith(color: AppColors.inactiveGray),
            /* 
          ERROR text */
            // errorText: errorText,
            errorStyle: AppTextStyling.errorText(theme).copyWith(fontSize: 10),
            /* 
          BORDERS styling */
            enabledBorder: AppBordersStyling.enabledBorderForTF(),
            focusedBorder: AppBordersStyling.focusedBorderForTF(),
            disabledBorder: AppBordersStyling.disabledBorderForTF(),
            errorBorder: AppBordersStyling.errorBorderForTF(),
            focusedErrorBorder: AppBordersStyling.focusedErrorBorderForTF(),
          ),
          /* */
        ),
      ),
    );
  }

  String? Function(String?)? _getValidator() {
    final validator = TextFieldValidationService.getValidatorFunction(
        validatorType, allowEmpty);
    return validator;
  }
}
