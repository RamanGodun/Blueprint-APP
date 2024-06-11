import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../State_management/Theme_configuration/app_colors.dart';
import '../Pickers/country_picker.dart';
import '../_Widgets_STYLING/app_text_styles_for_ui.dart';

enum ValidatorType { integer, double, string, name, phoneNumber }

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
    this.allowEmpty,
    this.keyboardType,
    this.prefix,
    this.suffixText,
    this.textSize,
    this.labelText,
  })  : _textController = controller,
        validator = _getValidatorFunction(validatorType, allowEmpty ?? false);

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
  final bool? allowEmpty;
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
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final textColor = colorScheme.primary;
    final textStyle = textTheme.bodyMedium?.copyWith(
      color: textColor,
      fontSize: textSize ?? 17,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
    );
    return (isTextFormField == true)
        ? Container(
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
              decoration: InputDecoration(
                prefixIcon:
                    (isNeedPrefixIcon == true) ? const CountryPicker() : null,
                suffixIcon: (isNeedSuffixIcon == true) ? Icon(icon) : null,
                contentPadding: const EdgeInsets.all(8),
                counterText: showCounterText ? maxLength.toString() : '',
                counterStyle: textStyle,
                border: InputBorder.none,
                prefix: prefix,
                prefixStyle: textStyle,
                suffixText: suffixText,
                suffixStyle: textStyle,
                labelText: labelText ?? "",
                labelStyle: textStyle?.copyWith(fontSize: 14),
                hintStyle:
                    textStyle?.copyWith(color: CupertinoColors.inactiveGray),
                errorStyle: textStyle?.copyWith(
                    debugLabel: "Validation not passed",
                    overflow: TextOverflow.fade,
                    fontSize: 0),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColors.white, width: borderWidth),
                  borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: AppColors.kAppPrimaryColor, width: borderWidth),
                  borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: AppColors.kAppPrimaryColor, width: borderWidth),
                  borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: borderWidth),
                  borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                ),
              ),
              // //
              // onChanged: (val1) {
              //   setState(() {
              //     onSubmitMethod(widget.labelText, mapping4OnSubmit, val1);
              //   });
              // },
              // //
              // onFieldSubmitted: (val) {
              //   setState(() {
              //     onSubmitMethod(widget.labelText, mapping4OnSubmit, val);
              //   });
              // },
            ),
          )
        : (isInCupertinoStyle == true)
            ? CupertinoTextField(
                controller: _textController,
                placeholder: hintText,
                placeholderStyle: AppTextStyles.forTextField(theme)
                    .copyWith(color: colorScheme.primary),
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
                            color: colorScheme.primary,
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
                padding:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                style: AppTextStyles.forTextField(theme)
                    .copyWith(fontWeight: FontWeight.w400),
                showCursor: true,
                onChanged: (text) => validateInput(),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 3.0),
                child: SizedBox(
                  height: 50,
                  child: TextField(
                    controller: _textController,
                    obscureText: isObscureText,
                    style: AppTextStyles.bodyMedium(theme),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0),
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
                    ),
                  ),
                ),
              );
  }

/*
 */
  static String? Function(String?)? _getValidatorFunction(
    ValidatorType type,
    bool allowEmpty,
  ) {
    switch (type) {
      case ValidatorType.integer:
        return _validateInteger;
      case ValidatorType.double:
        return _validateDouble;
      case ValidatorType.string:
        return (value) => _validateString(value, allowEmpty);
      case ValidatorType.phoneNumber:
        return _validatePhoneNumber;
      default:
        return null;
    }
  }

  static String? _validateInteger(String? value) {
    if (value == null || value.isEmpty) {
      return 'Це поле не може бути пустим';
    }

    if (int.tryParse(value) == null ||
        double.tryParse(value) != null ||
        value.startsWith('-')) {
      return 'Введіть ціле число';
    }
    return null;
  }

  static String? _validateDouble(String? value) {
    if (value == null || value.isEmpty) {
      return 'Це поле не може бути пустим';
    }

    if (double.tryParse(value) == null || value.startsWith('-')) {
      return 'Введіть додатне число';
    }
    return null;
  }

  static String? _validateString(String? value, bool allowEmpty) {
    if (value == null || value.isEmpty) {
      return allowEmpty ? null : 'Це поле не може бути пустим';
    }
    return null;
  }

  static String? _validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Це поле не може бути пустим';
    }
    final regExp = RegExp(r'^\+380[0-9]{9}$');
    if (!regExp.hasMatch('+380$value')) {
      return 'Невірний номер телефону!';
    }
    return null;
  }
}
