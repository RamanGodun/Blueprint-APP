import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../State_management/Helpers/Common/helpers.dart';
import '../../../State_management/Src/Const_data/strings_4_app.dart';
import '../../../State_management/Theme_configuration/app_colors.dart';
import '../_Widgets_STYLING/text_styles_for_components.dart';

class AppDialogsButtonsStyles {
  //
  /* CUSTOM style */
  static Widget customActionDB(BuildContext context,
      {VoidCallback? onPressed}) {
    final textTheme = Helpers.cupertinoTheme(context).textTheme;
    final colorScheme = Helpers.colorScheme(context);
    final style = textTheme.actionTextStyle.copyWith(
      fontSize: 17,
      color: colorScheme.primary,
      fontWeight: FontWeight.w600,
      letterSpacing: 1.15,
    );
    return _buildCupertinoDialogAction(
        context, AppStrings.oKText, style, onPressed);
  }

  static Widget customCancelDB(BuildContext context,
      {VoidCallback? onPressed}) {
    final textTheme = Helpers.cupertinoTheme(context).textTheme;
    final colorScheme = Helpers.colorScheme(context);
    final style = textTheme.actionTextStyle.copyWith(
      fontSize: 17,
      color: colorScheme.error,
      fontWeight: FontWeight.w300,
      fontStyle: FontStyle.italic,
      letterSpacing: 1.07,
    );
    return _buildCupertinoDialogAction(
        context, AppStrings.cancel, style, onPressed);
  }

  /* DEFAULT style */
  static Widget defaultActionDB(BuildContext context,
      {VoidCallback? onPressed}) {
    final theme = Helpers.cupertinoTheme(context);
    final style = theme.textTheme.actionTextStyle.copyWith(
      fontSize: 17,
      fontWeight: FontWeight.w600,
      color: theme.primaryColor,
    );
    return _buildCupertinoDialogAction(
        context, AppStrings.oKText, style, onPressed);
  }

  static Widget defaultCancelDB(BuildContext context,
      {VoidCallback? onPressed}) {
    final theme = Helpers.cupertinoTheme(context);
    final style = theme.textTheme.actionTextStyle.copyWith(
      fontSize: 17,
      fontWeight: FontWeight.w400,
      color: CupertinoColors.destructiveRed,
    );
    return _buildCupertinoDialogAction(
        context, AppStrings.cancel, style, onPressed);
  }

  /* BUILD method for Cupertino Styles */
  static Widget _buildCupertinoDialogAction(BuildContext context, String text,
      TextStyle style, VoidCallback? onPressed) {
    return Expanded(
      child: CupertinoDialogAction(
        onPressed: onPressed ??
            () {
              Navigator.of(context).pop();
            },
        child: Text(text, style: style),
      ),
    );
  }

  /* ANDROID custom style */
  static Widget customAndroidActionButton(BuildContext context,
      {VoidCallback? onPressed}) {
    final theme = Helpers.theme(context);
    final colorScheme = theme.colorScheme;
    return _buildMaterialDialogAction(
      context,
      AppStrings.oKText,
      TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.bold,
        color: colorScheme.primary,
      ),
      onPressed,
      true,
    );
  }

  static Widget customAndroidCancelButton(BuildContext context,
      {VoidCallback? onPressed}) {
    final theme = Helpers.theme(context);
    final colorScheme = theme.colorScheme;
    return _buildMaterialDialogAction(
      context,
      AppStrings.cancel,
      TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.normal,
        color: colorScheme.error,
      ),
      onPressed,
      false,
    );
  }

  /* BUILD method for Material Styles */
  static Widget _buildMaterialDialogAction(BuildContext context, String text,
      TextStyle style, VoidCallback? onPressed, bool isActionButton) {
    final colorScheme = Helpers.colorScheme(context);
    return ElevatedButton(
        onPressed: onPressed ??
            () {
              Navigator.of(context).pop();
            },
        style: ElevatedButton.styleFrom(
            backgroundColor: isActionButton
                ? colorScheme.primary.withOpacity(0.7)
                : colorScheme.primaryContainer.withOpacity(0.2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            )),
        child: Text(
          text,
          style: AppTextStyles.forButtons(context).copyWith(
              color: isActionButton
                  ? colorScheme.onPrimary
                  : AppColors.kErrorColor),
        ));
  }
}
