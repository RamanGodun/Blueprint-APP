import 'package:flutter/cupertino.dart';
import '../../../State_management/Helpers/Common/helpers.dart';
import '../../../State_management/Models/app_enums.dart';
import '../../../State_management/Src/Const_data/strings_4_app.dart';
import '../_Widgets_STYLING/app_text_styles.dart';
import '_buttons_styling.dart';

class AppDialogsButtons {
  static Widget custom({
    required BuildContext context,
    required DialogButtonType? buttonType,
    VoidCallback? onPressed,
  }) {
    switch (buttonType) {
      case DialogButtonType.actionButtonInIOSStyle:
        return _buildCupertinoDialogAction(
          context: context,
          isActionButton: true,
          onPressed: onPressed,
          buttonText: AppStrings.oKText,
        );
      case DialogButtonType.cancelButtonInIOSStyle:
        return _buildCupertinoDialogAction(
          context: context,
          isActionButton: false,
          fontWeight: FontWeight.w400,
          buttonText: AppStrings.cancel,
          onPressed: onPressed,
        );
      case DialogButtonType.actionButtonInAndroidStyle:
        return _buildMaterialDialogAction(
          context: context,
          isActionButton: true,
          onPressed: onPressed,
          buttonText: AppStrings.oKText,
        );
      case DialogButtonType.cancelButtonInAndroidType:
        return _buildMaterialDialogAction(
          context: context,
          isActionButton: false,
          fontWeight: FontWeight.normal,
          onPressed: onPressed,
          buttonText: AppStrings.cancel,
        );
      default:
        return const SizedBox.shrink();
    }
  }

  static Widget _buildCupertinoDialogAction({
    required BuildContext context,
    required String buttonText,
    required bool isActionButton,
    FontWeight fontWeight = FontWeight.w600,
    VoidCallback? onPressed,
  }) {
    final theme = Helpers.themeGet(context);
    final colorScheme = theme.colorScheme;
    final textStyle = AppTextStyles.cupertinoButtonStyle(
      context,
      color: isActionButton ? colorScheme.primary : colorScheme.error,
      fontWeight: fontWeight,
      fontStyle: isActionButton ? FontStyle.normal : FontStyle.italic,
    );
    return Expanded(
      child: CupertinoDialogAction(
        onPressed: onPressed ?? () => Navigator.of(context).pop(),
        child: Text(buttonText, style: textStyle),
      ),
    );
  }

  static Widget _buildMaterialDialogAction({
    required BuildContext context,
    required String buttonText,
    FontWeight fontWeight = FontWeight.w700,
    required VoidCallback? onPressed,
    required bool isActionButton,
  }) {
    final theme = Helpers.themeGet(context);
    final deviceWidth = Helpers.deviceWidthGet(context);
    return SizedBox(
      width: deviceWidth * 0.4,
      child: isActionButton
          ? AppButtonsStyling.withGradient(
              context,
              buttonText: buttonText,
              onPressed: onPressed ?? () => Navigator.of(context).pop(),
            )
          : AppButtonsStyling.forOutlinedButton(
              context,
              buttonText: buttonText,
              textStyle: AppTextStyles.forButtons(theme).copyWith(
                  color: theme.colorScheme.error, fontWeight: fontWeight),
            ),
    );
  }
}
