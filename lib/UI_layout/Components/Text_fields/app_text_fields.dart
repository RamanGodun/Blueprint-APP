import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../State_management/Models/app_enums.dart';
import '../../../State_management/Services/text_validation_service.dart';
import '../_Widgets_STYLING/_textfield_styling.dart';
import '../_Widgets_STYLING/app_text_styles_for_ui.dart';

class AppTextField extends StatelessWidget {
  AppTextField({
    super.key,
    required TextEditingController controller,
    required this.isValid,
    required this.validateInput,
    this.validatorType = ValidatorType.string,
    required this.theme,
    this.hintText = "Enter text",
    this.isInCupertinoStyle = true,
    this.isObscureText = false,
    this.maxLength = 24,
    this.isReadOnly = false,
    this.isAllBorder = true,
    this.isTextFormField = false,
    this.showHintText = true,
    this.showCounterText = false,
    this.isTextAlignCenter = false,
    this.heightOfField = 50,
    this.widthOfField = double.infinity,
    this.isNeedSuffixIcon = false,
    this.isNeedPrefixIcon = false,
    this.borderRadius = 9.0,
    this.borderWidth = 1.0,
    this.icon,
    this.maxLines,
    this.allowEmpty = false,
    this.keyboardType,
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
  final bool isInCupertinoStyle;
  final bool isObscureText;
  final IconData? icon;
  final int maxLength;
  final bool isReadOnly;
  final bool isAllBorder;
  final bool isTextFormField;
  final bool showCounterText;
  final bool showHintText;
  final int? maxLines;
  final bool allowEmpty;
  final bool isTextAlignCenter;
  final TextInputType? keyboardType;
  final Widget? prefix;
  final String? suffixText;
  final double? textSize;
  final double? heightOfField;
  final double? widthOfField;
  final bool isNeedSuffixIcon;
  final bool isNeedPrefixIcon;
  final String? labelText;
  final double borderRadius;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    return (isTextFormField == true)
        ? _buildTextFormField(context)
        : (isInCupertinoStyle == true)
            ? _buildCupertinoTextField()
            : _buildTextField(context);
  }

  Widget _buildTextFormField(BuildContext context) {
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final textColor = colorScheme.primary;
    final textStyle = textTheme.bodyMedium?.copyWith(
      color: textColor,
      fontSize: textSize ?? 17,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
    );
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7),
      height: heightOfField,
      width: widthOfField,
      child: TextFormField(
        textAlign: isTextAlignCenter ? TextAlign.center : TextAlign.start,
        validator: validator,
        cursorColor: textColor,
        maxLines: maxLines ?? 1,
        controller: _textController,
        maxLength: maxLength,
        keyboardType: keyboardType,
        style: textStyle,
        decoration: DialogStyling.inputDecoration4FormField(
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
      placeholderStyle: AppTextStyles.forTextField(theme)
          .copyWith(color: theme.colorScheme.primary),
      decoration: BoxDecoration(
        border: (isAllBorder == true)
            ? Border.all(
                color: isValid.value
                    ? CupertinoColors.inactiveGray
                    : CupertinoColors.destructiveRed,
                width: 1.0,
              )
            : Border(
                bottom: BorderSide(
                  color: theme.colorScheme.primary,
                  width: 0.15,
                ),
              ),
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
      style: AppTextStyles.forTextField(theme)
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
          style: AppTextStyles.bodyMedium(theme),
          decoration: DialogStyling.inputDecorForTF(theme, hintText, icon!),
        ),
      ),
    );
  }

  // static String? Function(String?)? _getValidatorFunction(
  //   ValidatorType type,
  //   bool allowEmpty,
  // ) {
  //   switch (type) {
  //     case ValidatorType.integer:
  //       return _validateInteger;
  //     case ValidatorType.double:
  //       return _validateDouble;
  //     case ValidatorType.string:
  //       return (value) => _validateString(value, allowEmpty);
  //     case ValidatorType.phoneNumber:
  //       return _validatePhoneNumber;
  //     default:
  //       return null;
  //   }
  // }

  // static String? _validateInteger(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Це поле не може бути пустим';
  //   }

  //   if (int.tryParse(value) == null ||
  //       double.tryParse(value) != null ||
  //       value.startsWith('-')) {
  //     return 'Введіть ціле число';
  //   }
  //   return null;
  // }

  // static String? _validateDouble(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Це поле не може бути пустим';
  //   }

  //   if (double.tryParse(value) == null || value.startsWith('-')) {
  //     return 'Введіть додатне число';
  //   }
  //   return null;
  // }

  // static String? _validateString(String? value, bool allowEmpty) {
  //   if (value == null || value.isEmpty) {
  //     return allowEmpty ? null : 'Це поле не може бути пустим';
  //   }
  //   return null;
  // }

  // static String? _validatePhoneNumber(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Це поле не може бути пустим';
  //   }
  //   final regExp = RegExp(r'^\+380[0-9]{9}$');
  //   if (!regExp.hasMatch('+380$value')) {
  //     return 'Невірний номер телефону!';
  //   }
  //   return null;
  // }
}
