import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../State_management/Theme_configuration/app_colors.dart';
import 'app_styling_constants.dart';

abstract class AppBordersStyling {
/* */

/* */
  static OutlineInputBorder enabledBorderForTF(
      double borderWidth, double borderRadius) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.white, width: borderWidth),
      borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
    );
  }

  static OutlineInputBorder focusedBorderForTF(
      double borderWidth, double borderRadius, Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color, width: borderWidth),
      borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
    );
  }

  static OutlineInputBorder errorBorderForTF(
      double borderWidth, double borderRadius, Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color, width: borderWidth),
      borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
    );
  }

  static OutlineInputBorder focusedErrorBorderForTF(
      double borderWidth, double borderRadius, Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color, width: borderWidth),
      borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
    );
  }

  static Border border1ForCupertinoTextField(bool isValid) {
    return Border.all(
      color: isValid
          ? CupertinoColors.inactiveGray
          : CupertinoColors.destructiveRed,
      width: 1.0,
    );
  }

  static Border border2ForCupertinoTextField(bool isValid) {
    return Border(
      bottom: BorderSide(
        color: isValid ? AppColors.kAppPrimaryColor : AppColors.kErrorColor,
        width: 0.15,
      ),
    );
  }

  static OutlineInputBorder focusBorderForTextField(ThemeData theme) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(9.0),
      borderSide: BorderSide(
        color: theme.colorScheme.primary,
      ),
    );
    return border;
  }

  static OutlineInputBorder enabledBorderForTextField(ThemeData theme) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(9.0),
      borderSide: BorderSide(
        color: theme.colorScheme.onSurface.withOpacity(0.3),
      ),
    );
    return border;
  }

  static double roundedRectangle(double? borderRadius) {
    const roundedRectangle = AppStylingConstants.generalBorderRadius;
    return roundedRectangle;
  }

  static BorderSide borderSideForFIAnswer(ThemeData theme) {
    final borderSideForFIAnswer = BorderSide(
      color: theme.colorScheme.primary.withOpacity(0.9),
      width: 0.7,
    );
    return borderSideForFIAnswer;
  }

//
  static RoundedRectangleBorder roundedRectangleBorderForButton(
      ThemeData theme) {
    final buttonShape = RoundedRectangleBorder(
      borderRadius: AppStylingConstants.commonBorderRadius,
      side: BorderSide(color: theme.colorScheme.primary.withOpacity(0.3)),
    );
    return buttonShape;
  }
//
}
