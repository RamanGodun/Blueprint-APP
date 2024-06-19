import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../State_management/Models/app_enums.dart';
import '../../../State_management/Services/text_validation_service.dart';
import '../../../State_management/Theme_configuration/app_colors.dart';
import '../_General_STYLING_set/app_borders.dart';
import '../_General_STYLING_set/app_styling_constants.dart';
import '../_General_STYLING_set/app_text_styling.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.restorationId,
    required this.theme,
    /* input handling */
    this.widgetType = WidgetType.cupertinoStyle,
    this.validatorType = ValidatorType.string,
    required this.isValid,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    /* general settings */
    this.textAlign = TextAlign.start,
    this.textSize = 17,
    this.heightOfField = 55,
    this.widthOfField = double.infinity,
    this.maxLength = 24,
    this.borderRadius = 7.0,
    this.borderWidth = 1.0,
    this.maxLines = 1,
    this.minLength = 3,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixWidget,
    this.suffixWidget,
    /* */
    this.hintText = "Hint text",
    this.prefixText = "",
    this.labelText = "",
    this.suffixText,
    this.obscuringCharacter = "*",

    /* bool parameters */
    this.isObscureText = false,
    this.isReadOnly = false,
    this.isAllBorder = false,
    this.showHintText = true,
    this.showCounterText = true,
    this.isNeedSuffix = false,
    this.isNeedPrefix = false,
    this.isObscure = false,
    this.autoFocus = false,
    this.allowEmpty = false,
    this.isNeedsValidation = true,
    this.isNeedsRestoration = false,
  });

  final ValueNotifier<bool> isValid;
  final WidgetType widgetType;

  final String? restorationId;
  final ValidatorType validatorType;
  final TextInputType? keyboardType;

  final String? hintText, obscuringCharacter, suffixText, labelText, prefixText;
  final IconData? prefixIcon, suffixIcon;
  final Widget? prefixWidget, suffixWidget;

  final ThemeData theme;
  final TextAlign textAlign;
  final int maxLength, maxLines, minLength;
  final double heightOfField, widthOfField, borderRadius, borderWidth, textSize;
  final bool isObscureText,
      isReadOnly,
      isAllBorder,
      showCounterText,
      showHintText,
      isNeedSuffix,
      isNeedPrefix,
      autoFocus,
      allowEmpty,
      isObscure,
      isNeedsValidation,
      isNeedsRestoration;

  final void Function(String, bool)? onChanged;
  final VoidCallback? onEditingComplete;
  final void Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  String? errorText;
  late ColorScheme colorScheme;
  late TextTheme textTheme;
  late ValueNotifier<bool> isFocused;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();
    isFocused = ValueNotifier<bool>(false);
    _focusNode.addListener(() {
      isFocused.value = _focusNode.hasFocus;
    });

    if (widget.isNeedsValidation) {
      _controller.addListener(_validate);
    }
  }

  @override
  Widget build(BuildContext context) {
    final textField = (widget.widgetType == WidgetType.cupertinoStyle)
        ? _buildCupertinoTextField()
        : _buildTextField(context);
    return textField;
  }

  Widget _buildCupertinoTextField() {
    return Container(
      color: AppColors.transparent,
      height: widget.heightOfField,
      width: widget.widthOfField,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: ValueListenableBuilder<bool>(
          valueListenable: isFocused,
          builder: (context, isFocused, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CupertinoTextField(
                  restorationId: widget.restorationId,
                  controller: _controller,
                  focusNode: _focusNode,
                  onChanged: (value) {
                    if (widget.isNeedsValidation) {
                      _validate();
                    } else {
                      widget.onChanged?.call(value, true);
                    }
                  },
                  placeholder: widget.hintText,
                  placeholderStyle: AppTextStyling.hintText(widget.theme),
                  decoration: BoxDecoration(
                    border: isFocused
                        ? AppBordersStyling.border1ForCupertinoTextField(
                            errorText == null)
                        : AppBordersStyling.border2ForCupertinoTextField(
                            errorText == null),
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                  ),
                  keyboardType: getKeyboardType(),
                  readOnly: widget.isReadOnly,
                  maxLength: widget.maxLength,
                  textAlign: widget.textAlign,
                  padding: AppStylingConstants.commonPadding,
                  style: AppTextStyling.forTextField(widget.theme)
                      .copyWith(fontWeight: FontWeight.w400),
                  showCursor: true,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    if (errorText != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 0, left: 24),
                        child: Text(
                          errorText!,
                          style: const TextStyle(
                            color: CupertinoColors.destructiveRed,
                            fontSize: 12,
                          ),
                        ),
                      )
                    else
                      const Spacer(),
                    if (widget.maxLength > 0)
                      Padding(
                        padding: const EdgeInsets.only(top: 0, right: 16),
                        child: Text(
                          '${_controller.text.length}/${widget.maxLength}',
                          style: AppTextStyling.label(widget.theme).copyWith(
                              color:
                                  (_controller.text.length < widget.minLength)
                                      ? AppColors.kErrorColor
                                      : colorScheme.onSurface),
                        ),
                      ),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildTextField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: SizedBox(
        height: widget.heightOfField,
        child: TextField(
          controller: _controller,
          focusNode: _focusNode,
          onChanged: (value) {
            if (widget.isNeedsValidation) {
              _validate();
            } else {
              widget.onChanged?.call(value, true);
            }
          },
          keyboardType: getKeyboardType(),
          obscureText: widget.isObscureText,
          style: AppTextStyling.bodyMedium(widget.theme),
          decoration: InputDecoration(
            contentPadding: AppStylingConstants.commonPadding,
            enabledBorder: AppBordersStyling.enabledBorderForTextField(
              widget.theme,
              isValid: widget.isValid.value,
            ),
            focusedBorder: AppBordersStyling.focusedBorderForTextField(
              widget.theme,
              isValid: widget.isValid.value,
            ),
            fillColor: widget.theme.colorScheme.surface,
            filled: true,
            hintText: widget.hintText,
            hintStyle: AppTextStyling.hintText(widget.theme),
            prefixIcon: (widget.prefixIcon != null)
                ? Icon(widget.prefixIcon,
                    color: widget.theme.colorScheme.onSurface.withOpacity(0.5))
                : null,
            suffixIcon: (widget.suffixIcon != null)
                ? Icon(widget.suffixIcon,
                    color: widget.theme.colorScheme.onSurface.withOpacity(0.5))
                : null,
            errorText: errorText,
          ),
          maxLength: widget.maxLength,
          maxLines: widget.maxLines,
          textAlign: widget.textAlign,
          readOnly: widget.isReadOnly,
          autofocus: widget.autoFocus,
        ),
      ),
    );
  }

/* USED METHODS */
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    colorScheme = widget.theme.colorScheme;
    textTheme = widget.theme.textTheme;
  }

  void _validate() {
    final validator = TextFieldValidationService.getValidatorFunction(
        widget.validatorType, widget.allowEmpty);
    final errorText = validator?.call(_controller.text);
    setState(() {
      this.errorText = errorText;
    });
    final isValid = errorText == null;
    widget.isValid.value = isValid;
    widget.onChanged?.call(_controller.text, isValid);
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
    if (widget.isNeedsValidation) {
      _controller.removeListener(_validate);
    }
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

/*
 */
}
