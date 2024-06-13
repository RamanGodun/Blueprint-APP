import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../State_management/Models/app_enums.dart';
import '../../../State_management/Services/text_validation_service.dart';
import '../_Widgets_STYLING/app_borders.dart';
import '../_Widgets_STYLING/app_text_styling.dart';
import '_input_styling.dart';

enum WidgetType {
  textField,
  textFormField,
  cupertinoStyle,
}

class AppTextField extends StatelessWidget {
  AppTextField({
    super.key,
    required TextEditingController controller,
    required this.isValid,
    required this.validateInput,
    this.validatorType = ValidatorType.string,
    required this.theme,
    this.hintText = "Enter text",
    this.widgetType = WidgetType.textField,
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
  })  : _textController = controller,
        validator = TextFieldValidationService.getValidatorFunction(
            validatorType, allowEmpty);

  final TextEditingController _textController;
  final ValueNotifier<bool> isValid;
  final String? Function(String?)? validator;
  final ValidatorType validatorType;
  final VoidCallback validateInput;
  final String hintText;
  final ThemeData theme;
  final bool isObscureText;
  final int maxLength;
  final double heightOfField;
  final double widthOfField;
  final bool isReadOnly;
  final bool isAllBorder;
  final WidgetType widgetType;
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
    switch (widgetType) {
      case WidgetType.textFormField:
        return _buildTextFormField(context);
      case WidgetType.cupertinoStyle:
        return _buildCupertinoTextField();
      case WidgetType.textField:
      default:
        return _buildTextField(context);
    }
  }

  Widget _buildTextFormField(BuildContext context) {
    final colorScheme = theme.colorScheme;
    final textStyle = AppTextStyling.forTextFormField(theme, textSize);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7),
      height: heightOfField,
      width: widthOfField,
      child: TextFormField(
        textAlign: isTextAlignCenter ? TextAlign.center : TextAlign.start,
        validator: validator,
        cursorColor: colorScheme.primary,
        maxLines: maxLines,
        controller: _textController,
        maxLength: maxLength,
        keyboardType: keyboardType,
        style: textStyle,
        decoration: InputDecorationStyling.inputDecorationForFormField(
          borderRadius: borderRadius,
          borderWidth: borderWidth,
          colorScheme: colorScheme,
          textStyle: textStyle,
          isNeedPrefixIcon: isNeedPrefixIcon,
          isNeedSuffixIcon: isNeedSuffixIcon,
          showCounterText: showCounterText,
          icon: icon,
          maxLength: maxLength,
        ),
      ),
    );
  }

  Widget _buildCupertinoTextField() {
    return CupertinoTextField(
      controller: _textController,
      placeholder: hintText,
      placeholderStyle: AppTextStyling.forTextField(theme)
          .copyWith(color: theme.colorScheme.primary),
      decoration: BoxDecoration(
        border: (isAllBorder == true)
            ? AppBordersStyling.border1ForCupertinoTextField(isValid.value)
            : AppBordersStyling.border2ForCupertinoTextField(isValid.value),
        borderRadius: BorderRadius.circular(8.0),
      ),
      keyboardType: (validatorType == ValidatorType.string)
          ? TextInputType.text
          : const TextInputType.numberWithOptions(decimal: true),
      readOnly: isReadOnly,
      maxLength: maxLength,
      textAlign: (validatorType == ValidatorType.name)
          ? TextAlign.left
          : TextAlign.center,
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      style: AppTextStyling.forTextField(theme)
          .copyWith(fontWeight: FontWeight.w400),
      showCursor: true,
      onChanged: (text) => validateInput(),
    );
  }

  Widget _buildTextField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: SizedBox(
        height: 50,
        child: TextField(
          controller: _textController,
          obscureText: isObscureText,
          style: AppTextStyling.bodyMedium(theme),
          decoration: InputDecorationStyling.inputDecorationForTextField(
              theme, hintText, icon),
          obscuringCharacter: "*",
          autofocus: true,
        ),
      ),
    );
  }
}
