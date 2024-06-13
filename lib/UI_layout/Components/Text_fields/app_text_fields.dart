import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../State_management/Models/app_enums.dart';
import '../../../State_management/Services/text_validation_service.dart';
import '../_General_STYLING_set/app_borders.dart';
import '../_General_STYLING_set/app_text_styling.dart';
import '_input_styling.dart';

enum WidgetType {
  textField,
  textFormField,
  cupertinoStyle,
}

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.controller,
    required this.isValid,
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
  });

  final TextEditingController controller;
  final ValueNotifier<bool> isValid;
  final ValidatorType validatorType;
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
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  String? errorText;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_validate);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_validate);
    super.dispose();
  }

  void _validate() {
    final validator = TextFieldValidationService.getValidatorFunction(
        widget.validatorType, widget.allowEmpty);
    final errorText = validator?.call(widget.controller.text);
    widget.isValid.value = errorText == null;
    setState(() {
      this.errorText = errorText;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget field;

    if (widget.widgetType == WidgetType.textFormField) {
      field = _buildTextFormField(context);
    } else if (widget.widgetType == WidgetType.cupertinoStyle) {
      field = _buildCupertinoTextField();
    } else {
      field = _buildTextField(context);
    }
    return field;
  }

  Widget _buildTextFormField(BuildContext context) {
    final colorScheme = widget.theme.colorScheme;
    final textStyle =
        AppTextStyling.forTextFormField(widget.theme, widget.textSize);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7),
      height: widget.heightOfField,
      width: widget.widthOfField,
      child: TextFormField(
        textAlign:
            widget.isTextAlignCenter ? TextAlign.center : TextAlign.start,
        cursorColor: colorScheme.primary,
        maxLines: widget.maxLines,
        controller: widget.controller,
        maxLength: widget.maxLength,
        keyboardType: widget.keyboardType,
        style: textStyle,
        decoration: InputDecorationStyling.inputDecorationForFormField(
          borderRadius: widget.borderRadius,
          borderWidth: widget.borderWidth,
          colorScheme: colorScheme,
          textStyle: textStyle,
          isNeedPrefixIcon: widget.isNeedPrefixIcon,
          isNeedSuffixIcon: widget.isNeedSuffixIcon,
          showCounterText: widget.showCounterText,
          icon: widget.icon,
          maxLength: widget.maxLength,
        ).copyWith(
          errorText: errorText,
        ),
      ),
    );
  }

  Widget _buildCupertinoTextField() {
    return CupertinoTextField(
      controller: widget.controller,
      placeholder: widget.hintText,
      placeholderStyle: AppTextStyling.forTextField(widget.theme)
          .copyWith(color: widget.theme.colorScheme.primary),
      decoration: BoxDecoration(
        border: (widget.isAllBorder == true)
            ? AppBordersStyling.border1ForCupertinoTextField(
                widget.isValid.value)
            : AppBordersStyling.border2ForCupertinoTextField(
                widget.isValid.value),
        borderRadius: BorderRadius.circular(8.0),
      ),
      keyboardType: (widget.validatorType == ValidatorType.string)
          ? TextInputType.text
          : const TextInputType.numberWithOptions(decimal: true),
      readOnly: widget.isReadOnly,
      maxLength: widget.maxLength,
      textAlign: (widget.validatorType == ValidatorType.name)
          ? TextAlign.left
          : TextAlign.center,
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      style: AppTextStyling.forTextField(widget.theme)
          .copyWith(fontWeight: FontWeight.w400),
      showCursor: true,
    );
  }

  Widget _buildTextField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: SizedBox(
        height: 50,
        child: TextField(
          controller: widget.controller,
          obscureText: widget.isObscureText,
          style: AppTextStyling.bodyMedium(widget.theme),
          decoration: InputDecorationStyling.inputDecorationForTextField(
            widget.theme,
            widget.hintText,
            widget.icon,
          ).copyWith(
            errorText: errorText,
          ),
          obscuringCharacter: "*",
          autofocus: false,
        ),
      ),
    );
  }
}
