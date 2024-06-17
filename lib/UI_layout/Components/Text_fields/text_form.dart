import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../State_management/Models/app_enums.dart';
import '../../../State_management/Services/text_validation_service.dart';
import '../../../State_management/Theme_configuration/app_colors.dart';
import '../_General_STYLING_set/app_borders.dart';
import '../_General_STYLING_set/app_text_styling.dart';

class AppTextFormField extends StatefulWidget {
  const AppTextFormField({
    super.key,
    required this.onChanged,
    required this.theme,
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
    this.minLength = 3,
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

  final ValidatorType validatorType;
  final ThemeData theme;
  final String hintText, obscuringCharacter; // labelText,
  final IconData? icon;
  final Widget? prefix;
  final String? suffixText;
  final double? textSize;
  final int maxLength, maxLines, minLength;
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
  final void Function(String)? onFieldSubmitted, onChanged;
  final void Function(String?)? onSaved;

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();
    _controller.addListener(() {
      if (mounted) {
        setState(() {});
        widget.onChanged?.call(_controller.text);
      }
    });
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        widget.onChanged?.call(_controller.text);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = widget.theme.colorScheme;
    final textStyle =
        AppTextStyling.forTextFormField(widget.theme, widget.textSize);
/* const prefixIcon = CountryPicker(); - this for countries flags */

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        color: AppColors.transparent,
        margin: const EdgeInsets.symmetric(vertical: 4),
        height: widget.heightOfField,
        width: widget.widthOfField,
        child: TextFormField(
          restorationId: widget.restorationId,
          controller: _controller,
          keyboardType: widget.keyboardType,
          /* 
        VALIDATION  */
          validator: (value) => TextFieldValidationService.getValidatorFunction(
                  widget.validatorType, widget.allowEmpty, '', widget.minLength)
              ?.call(value),
//  _getValidator(),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          /* 
        HANDLERS */
          onEditingComplete: widget.onEditingComplete,
          onFieldSubmitted: widget.onFieldSubmitted,
          onSaved: widget.onSaved,
          onChanged: widget.onChanged,
          // onTapOutside: () {},
          /* 
        Text STYLING */
          style: textStyle,
          textAlign: widget.textAlign,
          /* 
        CURSOR */
          showCursor: true,
          cursorWidth: 1.5,
          cursorHeight: 15,
          cursorColor: colorScheme.secondary,
          cursorErrorColor: colorScheme.errorContainer,
          obscuringCharacter: widget.obscuringCharacter,
          /* 
        MAX parameters */
          maxLines: widget.maxLines,
          maxLength: widget.maxLength,
          /* 
        FOCUS */
          autofocus: widget.autoFocus,
          focusNode: _focusNode,
          /* 
        INPUT DECORATION */
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
            /* 
          COUNTER */
            counterText: (!widget.showCounterText || _controller.text.isEmpty)
                ? ""
                : "${_controller.text.length}/${widget.maxLength}",
            counterStyle: AppTextStyling.label(widget.theme).copyWith(
                color: (_controller.length < widget.minLength)
                    ? AppColors.kErrorColor
                    : colorScheme.onSurface),
            /* 
          PREFIX */
            prefixIcon:
                (widget.isNeedPrefixIcon == true) ? Icon(widget.icon) : null,
            prefix: widget.prefix,
            prefixStyle: textStyle,
            /* 
          SUFFIX */
            suffixIcon:
                (widget.isNeedSuffixIcon == true) ? Icon(widget.icon) : null,
            suffixText: widget.suffixText,
            suffixStyle: textStyle,
            /* 
          LABEL & HINT text */
            // labelText: labelText,
            labelStyle: textStyle.copyWith(fontSize: 13),
            // label: Some widget can be here,
            hintText: widget.hintText,
            hintStyle: textStyle.copyWith(color: AppColors.inactiveGray),
            /* 
          ERROR text */
            // errorText: errorText,
            errorStyle:
                AppTextStyling.errorText(widget.theme).copyWith(fontSize: 13),
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

/* */
}
