import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../State_management/Theme_configuration/this_app_colors.dart';
import '_text_styles_for_components.dart';

abstract class AppButtonsStyle {
//
/* WITH SHADOWS Button
 */
  static Widget styleFrom(
    BuildContext context, {
    void Function()? onPressed,
    required String buttonText,
    required ColorScheme colorScheme,
    double height = 44,
    EdgeInsets padding =
        const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.kAppPrimaryColor.withOpacity(0.9),
          foregroundColor: AppColors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          )),
      child: Text(
        buttonText,
        style: AppTextStyles.forButtons(context),
      ),
    );
  }

/* WITH GRADIENT Button
 */
  static Widget withGradient(
    BuildContext context, {
    void Function()? onPressed,
    required String buttonText,
    required ColorScheme colorScheme,
    double height = 44,
    EdgeInsets padding =
        const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
  }) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height,
        padding: padding,
        decoration: commonDecoration(colorScheme),
        child: Center(
          child: Text(
            buttonText,
            style: AppTextStyles.forButtons(context),
          ),
        ),
      ),
    );
  }

/* IN IOS/MACOS STYLE Button
 */
  static Widget inIOSStyle(
    BuildContext context, {
    void Function()? onPressed,
    required String buttonText,
    required ColorScheme colorScheme,
  }) {
    return SizedBox(
      width: double.infinity,
      child: CupertinoButton.filled(
        padding: const EdgeInsets.all(12),
        borderRadius: BorderRadius.circular(8),
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
              style: AppTextStyles.forButtons(context),
            ),
          ],
        ),
      ),
    );
  }

/* OUTLINED Button
 */
  static Widget forInterviewerAppAnswerButton(
    BuildContext context, {
    void Function()? onPressed,
    required String buttonText,
    required ThemeData theme,
  }) {
    return ElevatedButton(
      style: OutlinedButton.styleFrom(
          backgroundColor: theme.colorScheme.surface.withOpacity(0.4),
          side: BorderSide(color: theme.colorScheme.primary, width: 0.7)),
      onPressed: onPressed,
      child: Center(
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
          style: theme.textTheme.labelMedium,
          maxLines: 2,
          softWrap: true,
          selectionColor: theme.colorScheme.primary.withOpacity(0.6),
        ),
      ),
    );
  }

/* FIRST design
 */

  static Widget firstDesign(
    BuildContext context, {
    void Function()? onPressed,
    required String buttonText,
    required ColorScheme colorScheme,
  }) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        )),
        backgroundColor:
            WidgetStateProperty.all(colorScheme.primary.withOpacity(0.75)),
        /* alternative color
         WidgetStateProperty.all(
            AppColors.createMaterialColor(colorScheme.primary.withOpacity(0.7)),
          )
          */
      ),
      onPressed: onPressed,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            buttonText,
            style: AppTextStyles.forButtons(context),
          )),
    );
  }

/*
 */
  static BoxDecoration commonDecoration(ColorScheme colorScheme) {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [
          colorScheme.primary.withOpacity(0.6),
          colorScheme.primary.withOpacity(0.8),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: AppColors.cupertinoBlackColor.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 5,
          offset: const Offset(0, 2),
        ),
        BoxShadow(
          color: AppColors.cupertinoBlackColor.withOpacity(0.1),
          spreadRadius: 0.5,
          blurRadius: 2,
          offset: const Offset(0, 1),
        ),
      ],
    );
  }

/* For THEME CHANGING button
 */
  static BoxDecoration themeChangingDD(
      ColorScheme colorScheme, bool isDarkMode) {
    return BoxDecoration(
      color: colorScheme.surface,
      borderRadius: BorderRadius.circular(12.0),
      boxShadow: [
        BoxShadow(
          color: isDarkMode
              ? Colors.black
              : colorScheme.inverseSurface.withOpacity(0.3),
          spreadRadius: 2,
          blurRadius: 10,
          offset: const Offset(2, 4),
        ),
        BoxShadow(
          color: isDarkMode
              ? Colors.black
              : colorScheme.inverseSurface.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 5,
          offset: const Offset(0, 2),
        ),
      ],
    );
  }
}
