import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../State_management/Helpers/Common/helpers.dart';
import '../_Widgets_STYLING/app_borders.dart';
import '../_Widgets_STYLING/app_styling_constants.dart';
import '../_Widgets_STYLING/app_text_styles.dart';
import '../_Widgets_STYLING/app_box_decoration.dart';

abstract class AppButtonsStyling {
/* 
 */
  static Widget withGradient(
    BuildContext context, {
    void Function()? onPressed,
    required String buttonText,
    double height = AppStylingConstants.buttonsHeight,
    EdgeInsets padding = AppStylingConstants.commonPadding,
  }) {
    final theme = Helpers.themeGet(context);
    return InkWell(
      onTap: onPressed,
      child: ClipRRect(
        borderRadius: AppStylingConstants.commonBorderRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            height: height,
            width: double.infinity,
            padding: padding,
            decoration: AppBoxDecorations.forButtonsInGlassMorphismStyle(theme),
            child: Center(
              child: Text(
                buttonText,
                style: AppTextStyles.forButtons(theme),
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Widget inIOSStyle(
    BuildContext context, {
    void Function()? onPressed,
    required String buttonText,
  }) {
    final theme = Helpers.themeGet(context);
    final ColorScheme colorScheme = theme.colorScheme;
    return SizedBox(
      width: double.infinity,
      height: AppStylingConstants.buttonsHeight,
      child: CupertinoButton.filled(
        padding: AppStylingConstants.commonPadding,
        borderRadius: AppStylingConstants.commonBorderRadius,
        pressedOpacity: 0.8,
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              CupertinoIcons.play_arrow,
              color: colorScheme.onPrimary,
            ),
            const SizedBox(width: 8),
            Text(
              buttonText,
              style: AppTextStyles.forButtons(theme),
            ),
          ],
        ),
      ),
    );
  }

  static Widget firstDesign(
    BuildContext context, {
    void Function()? onPressed,
    required String buttonText,
  }) {
    final theme = Helpers.themeGet(context);
    final isDark = Helpers.isDarkTheme(theme);
    final colorScheme = theme.colorScheme;
    return SizedBox(
      width: double.infinity,
      height: AppStylingConstants.buttonsHeight,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              AppBordersStyling.roundedRectangleBorderForButton(theme)),
          backgroundColor: WidgetStateProperty.all(
            colorScheme.primary.withOpacity(isDark ? 0.35 : 0.65),
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: AppStylingConstants.commonPadding,
          child: Text(
            buttonText,
            style: AppTextStyles.forButtons(theme),
          ),
        ),
      ),
    );
  }

  static Widget forElevatedButton(
    BuildContext context, {
    void Function()? onPressed,
    required String buttonText,
  }) {
    final theme = Helpers.themeGet(context);
    final isDark = Helpers.isDarkTheme(theme);
    final colorScheme = theme.colorScheme;
    final backgroundColor =
        colorScheme.primary.withOpacity(isDark ? 0.35 : 0.65);
    final foregroundColor = colorScheme.onPrimary;
    return SizedBox(
      height: AppStylingConstants.buttonsHeight,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          shape: AppBordersStyling.roundedRectangleBorderForButton(theme),
          elevation: AppStylingConstants.elevation,
          padding: AppStylingConstants.commonPadding,
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: AppTextStyles.forButtons(theme),
        ),
      ),
    );
  }

/* OUTLINED Button
 */
  static Widget forOutlinedButton(
    BuildContext context, {
    void Function()? onPressed,
    required String buttonText,
    TextStyle? textStyle,
  }) {
    final theme = Helpers.themeGet(context);
    final isDark = Helpers.isDarkTheme(theme);
    final textStyleForButton = textStyle ?? AppTextStyles.forButtons(theme);
    return ElevatedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor:
            theme.colorScheme.surface.withOpacity(isDark ? 0.2 : 0.5),
        side: AppBordersStyling.borderSideForFIAnswer(theme),
      ),
      onPressed: onPressed,
      child: Center(
        child: Text(
          buttonText,
          style: textStyleForButton,
        ),
      ),
    );
  }
//
}
