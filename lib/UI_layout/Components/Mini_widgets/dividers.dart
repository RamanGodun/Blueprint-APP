import 'package:flutter/material.dart';

import '../../../State_management/Helpers/Common/helpers.dart';
import '../../../State_management/Src/Const_data/strings_4_app.dart';
import '../../../State_management/Theme_configuration/app_colors.dart';
import '../_Widgets_STYLING/app_styling_constants.dart';

class AppDividers {
/* Custom Dividers
 */
  static Widget divider(bool isDarkMode, {bool? isSymmetric}) {
    bool isWithSymmetry = isSymmetric ?? true;
    return Padding(
      padding: isWithSymmetry
          ? AppStylingConstants.zero
          : AppStylingConstants.forDivider,
      child: Divider(
        color: isDarkMode
            ? AppColors.kSecondaryDarkColor
            : AppColors.kSecondaryColor,
        thickness: isDarkMode ? 0.09 : 0.07,
        height: 0.01,
      ),
    );
  }

  static Widget divider2(ThemeData theme) {
    final colorScheme = theme.colorScheme;
    return Divider(
      thickness: 0.5,
      color: colorScheme.inverseSurface.withOpacity(0.5),
    );
  }

/* BOLD Dividers
 */
  static Widget boldDivider(ThemeData theme) {
    final isDarkMode = Helpers.isDarkTheme(theme);
    return Padding(
      padding: AppStylingConstants.forBoldDivider,
      child: Divider(
        color: isDarkMode
            ? AppColors.kSecondaryDarkColor
            : AppColors.kSecondaryColor,
        thickness: isDarkMode ? 0.09 : 0.1,
        height: 1,
      ),
    );
  }

/*
  DIVIDER 4 Sign page
 */
  static Widget dividerForSignPage(ThemeData theme) {
    // final isDarkMode = Helpers.isDarkTheme(theme);
    return SizedBox(
      height: 40,
      child: Column(children: [
        Row(
          children: <Widget>[
            Expanded(child: AppDividers.divider2(theme)),
            Padding(
              padding: AppStylingConstants.horizontal8,
              child: Text(
                AppStrings.continueWith,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(child: AppDividers.divider2(theme)),
          ],
        ),
        const SizedBox(height: 20),
      ]),
    );
  }

/*
DIVIDER between Dialog Buttons 
 */
  static Widget dividerBetweenDialogButtons(BuildContext context) {
    final colorScheme = Helpers.colorSchemeGet(context);
    return Container(
      width: 0.5,
      color: colorScheme.inverseSurface.withOpacity(0.5),
    );
  }

  static Widget getDividerBetweenDialogButtons(BuildContext context) =>
      dividerBetweenDialogButtons(context);
//
}
