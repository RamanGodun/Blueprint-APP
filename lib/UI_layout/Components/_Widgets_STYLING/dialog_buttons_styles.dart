import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../State_management/Helpers/Common/helpers.dart';
import '../../../State_management/Src/Const_data/strings_4_app.dart';
import '../../../State_management/Theme_configuration/app_colors.dart';
import 'app_text_styles_for_ui.dart';

class AppDialogsButtonsStyles {
  /* CUSTOM style */
  static Widget customActionDB(BuildContext context,
      {VoidCallback? onPressed}) {
    final style = _cupertinoButtonStyle(context,
        color: Helpers.colorScheme(context).primary,
        fontWeight: FontWeight.w600);
    return _buildCupertinoDialogAction(
        context, AppStrings.oKText, style, onPressed);
  }

  static Widget customCancelDB(BuildContext context,
      {VoidCallback? onPressed}) {
    final style = _cupertinoButtonStyle(context,
        color: Helpers.colorScheme(context).error,
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.italic);
    return _buildCupertinoDialogAction(
        context, AppStrings.cancel, style, onPressed);
  }

  /* DEFAULT style */
  static Widget defaultActionDB(BuildContext context,
      {VoidCallback? onPressed}) {
    final style = _cupertinoButtonStyle(context,
        color: Helpers.cupertinoTheme(context).primaryColor,
        fontWeight: FontWeight.w600);
    return _buildCupertinoDialogAction(
        context, AppStrings.oKText, style, onPressed);
  }

  static Widget defaultCancelDB(BuildContext context,
      {VoidCallback? onPressed}) {
    final style = _cupertinoButtonStyle(context,
        color: CupertinoColors.destructiveRed, fontWeight: FontWeight.w400);
    return _buildCupertinoDialogAction(
        context, AppStrings.cancel, style, onPressed);
  }

  /* ANDROID custom style */
  static Widget customAndroidActionButton(BuildContext context,
      {VoidCallback? onPressed}) {
    final style = _materialButtonStyle(context,
        color: Helpers.colorScheme(context).primary,
        fontWeight: FontWeight.bold);
    return _buildMaterialDialogAction(
        context, AppStrings.oKText, style, onPressed, true);
  }

  static Widget customAndroidCancelButton(BuildContext context,
      {VoidCallback? onPressed}) {
    final style = _materialButtonStyle(context,
        color: Helpers.colorScheme(context).error,
        fontWeight: FontWeight.normal);
    return _buildMaterialDialogAction(
        context, AppStrings.cancel, style, onPressed, false);
  }

  /* Common Cupertino Button Style */
  static TextStyle _cupertinoButtonStyle(BuildContext context,
      {required Color color,
      FontWeight fontWeight = FontWeight.normal,
      FontStyle fontStyle = FontStyle.normal}) {
    final textTheme = Helpers.cupertinoTheme(context).textTheme;
    return textTheme.actionTextStyle.copyWith(
      fontSize: 17,
      color: color,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      letterSpacing: 1.15,
    );
  }

  /* Common Material Button Style */
  static TextStyle _materialButtonStyle(BuildContext context,
      {required Color color, FontWeight fontWeight = FontWeight.normal}) {
    return TextStyle(
      fontSize: 17,
      fontWeight: fontWeight,
      color: color,
    );
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

  /* BUILD method for Material Styles */
  static Widget _buildMaterialDialogAction(BuildContext context, String text,
      TextStyle style, VoidCallback? onPressed, bool isActionButton) {
    final theme = Helpers.theme(context);
    final colorScheme = theme.colorScheme;
    final deviceWidth = Helpers.deviceWidth(context);
    return SizedBox(
      width: deviceWidth * 0.4,
      child: ElevatedButton(
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
          ),
        ),
        child: Text(
          text,
          style: AppTextStyles.forButtons(theme).copyWith(
            color:
                isActionButton ? colorScheme.onPrimary : AppColors.kErrorColor,
          ),
        ),
      ),
    );
  }
}
