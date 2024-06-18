import 'package:blueprint_4app/UI_layout/Components/_General_STYLING_set/app_styling_constants.dart';
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
    this.restorationId,
    required this.theme,
    /* input handling */
    this.validatorType = ValidatorType.string,
    this.keyboardType = TextInputType.text,
    required this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    /* general settings */
    this.textAlign = TextAlign.start,
    this.heightOfField = 55,
    this.widthOfField = double.infinity,
    this.maxLength = 24,
    this.borderRadius = 9.0,
    this.borderWidth = 1.0,
    this.maxLines = 1,
    this.minLength = 3,
    this.icon,
    this.prefix,
    this.textSize,
    /* */
    this.hintText = "Hint text",
    this.prefixText = "",
    this.labelText = "",
    this.suffixText,
    this.obscuringCharacter = "*",

    /* bool parameters */
    this.isObscureText = false,
    this.isReadOnly = false,
    this.isAllBorder = true,
    this.showHintText = true,
    this.showCounterText = true,
    this.isNeedSuffixIcon = false,
    this.isNeedPrefixIcon = false,
    this.isObscure = false,
    this.autoFocus = false,
    this.allowEmpty = false,
  });

  final String? restorationId;
  final ValidatorType validatorType;
  final TextInputType? keyboardType;

  final String? hintText, obscuringCharacter, suffixText, labelText, prefixText;
  final IconData? icon;
  final Widget? prefix;

  final ThemeData theme;
  final TextAlign textAlign;
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
      allowEmpty,
      isObscure;

  final VoidCallback? onEditingComplete;
  final void Function(String)? onFieldSubmitted, onChanged;
  final void Function(String?)? onSaved;

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  bool _isObscure = false;

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
    _isObscure = widget.isObscure;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = widget.theme.colorScheme;
    final textStyle =
        AppTextStyling.forTextFormField(widget.theme, widget.textSize);

/* const prefixIcon = CountryPicker(); - this for countries flags */

    return Container(
      color: AppColors.transparent,
      height: widget.heightOfField,
      width: widget.widthOfField,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child:
            /* 
            TEXT FORM FIELD
            */
            TextFormField(
          restorationId: widget.restorationId,
          controller: _controller,
          keyboardType: getKeyboardType(),
          /* 
        VALIDATION  */
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) => TextFieldValidationService.getValidatorFunction(
                  widget.validatorType, widget.allowEmpty, '', widget.minLength)
              ?.call(value),
          /* 
        INPUT HANDLERS */
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
          /* 
        OBSCURE text */
          obscuringCharacter: widget.obscuringCharacter!,
          obscureText: _isObscure,

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
            contentPadding: AppStylingConstants.commonPadding,
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
            prefixIcon: (widget.isNeedPrefixIcon == true)
                ? Padding(
                    padding: const EdgeInsets.only(left: 20, right: 40),
                    child:
                        Icon(widget.icon, size: AppStylingConstants.iconSize),
                  )
                : null,
            prefix: widget.prefix,
            prefixText: widget.prefixText,
            prefixStyle: textStyle,
            /* 
          SUFFIX */
            suffixIcon: (widget.isNeedSuffixIcon == true)
                ? Icon(widget.icon)
                : GestureDetector(
                    onTap: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                    child: Icon(
                      _isObscure ? Icons.visibility_off : Icons.visibility,
                      color: colorScheme.primary,
                    ),
                  ),
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

  // Визначення типу клавіатури на основі валідатора
  TextInputType getKeyboardType() {
    switch (widget.validatorType) {
      case ValidatorType.integer:
        return TextInputType.number;
      case ValidatorType.double:
        return const TextInputType.numberWithOptions(decimal: true);
      case ValidatorType.email:
        return TextInputType.emailAddress;
      case ValidatorType.phoneNumber:
        return TextInputType.phone;
      case ValidatorType.name:
      case ValidatorType.string:
      case ValidatorType.sameAs:
      default:
        return TextInputType.text;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }
/* */
}
