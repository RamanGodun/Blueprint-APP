import 'package:flutter/material.dart';
import '../../../State_management/Models/app_enums.dart';
import '../../../State_management/Theme_configuration/app_colors.dart';
import '../_General_STYLING_set/app_borders.dart';
import '../_General_STYLING_set/app_styling_constants.dart';
import '../_General_STYLING_set/app_text_styling.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.controller,
    this.validatorType = ValidatorType.string,
    required this.theme,
    this.hintText = "Hint text",
    this.isObscureText = false,
    this.maxLength = 24,
    this.isReadOnly = false,
    this.isAllBorder = true,
    this.showHintText = true,
    this.showCounterText = false,
    this.isTextAlignCenter = false,
    this.heightOfField = 50,
    this.widthOfField = double.infinity,
    this.isNeedSuffixIcon = false,
    this.isNeedPrefixIcon = false,
    this.borderRadius = 9.0,
    this.borderWidth = 1.0,
    this.maxLines = 1,
    this.allowEmpty = false,
    this.keyboardType = TextInputType.text,
    this.icon,
    this.prefix,
    this.suffixText,
    this.textSize,
    this.labelText,
  });

  final TextEditingController controller;
  final ValidatorType validatorType;
  final String hintText;
  final ThemeData theme;
  final bool isObscureText;
  final int maxLength;
  final double heightOfField;
  final double widthOfField;
  final bool isReadOnly;
  final bool isAllBorder;
  final bool showCounterText;
  final bool showHintText;
  final int maxLines;
  final bool allowEmpty;
  final bool isTextAlignCenter;
  final TextInputType? keyboardType;
  final bool isNeedSuffixIcon;
  final bool isNeedPrefixIcon;
  final double borderRadius;
  final double borderWidth;
  final IconData? icon;
  final Widget? prefix;
  final String? suffixText;
  final double? textSize;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    final colorScheme = theme.colorScheme;
    final textStyle = AppTextStyling.forTextFormField(theme, textSize);
    // const prefixIcon = CountryPicker();

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7),
      height: heightOfField,
      width: widthOfField,
      child: TextFormField(
        controller: controller,
        //  focusNode: FocusNode  - for focus
        decoration: InputDecoration(
          /* PREFIX */
          prefixIcon: (isNeedPrefixIcon == true) ? Icon(icon) : null,
          prefix: prefix,
          prefixStyle: textStyle,

          suffixIcon: (isNeedSuffixIcon == true) ? Icon(icon) : null,
          contentPadding: AppStylingConstants.commonPadding,
          counterText: showCounterText ? maxLength.toString() : '',
          counterStyle: AppTextStyling.answerLabelStyle(theme),
          // border: InputBorder.,

          suffixText: suffixText,
          suffixStyle: textStyle,
          labelText: labelText ?? "",
          labelStyle: textStyle.copyWith(fontSize: 14),
          hintStyle: textStyle.copyWith(color: AppColors.inactiveGray),
          enabledBorder: AppBordersStyling.enabledBorderForTF(),
          focusedBorder: AppBordersStyling.focusedBorderForTF(),
          errorBorder: AppBordersStyling.errorBorderForTF(),
          focusedErrorBorder: AppBordersStyling.focusedErrorBorderForTF(),
        ),
        textAlign: isTextAlignCenter ? TextAlign.center : TextAlign.start,
        cursorColor: colorScheme.primary,
        maxLines: maxLines,
        maxLength: maxLength,
        keyboardType: keyboardType,
        style: textStyle,
      ),
    );
  }
}


  // void _validate() {
  //   final validator = TextFieldValidationService.getValidatorFunction(
  //       widget.validatorType, widget.allowEmpty);
  // }