import 'package:flutter/material.dart';

import '../../../State_management/Helpers/Common/helpers.dart';
import '../../../State_management/Src/Const_data/strings_4_app.dart';
import '../../../State_management/Theme_configuration/app_colors.dart';
import '../_Widgets_STYLING/app_paddings.dart';

class AppDividers {
/* Custom Dividers
 */
  static Widget divider(bool isDarkMode, bool? isSymmetric) {
    bool isWithSymmetry = (isSymmetric != null) ? true : false;
    return Padding(
      padding: isWithSymmetry ? AppPaddings.zero : AppPaddings.forDivider,
      child: Divider(
        color: isDarkMode
            ? AppColors.kSecondaryDarkColor
            : AppColors.kSecondaryColor,
        thickness: isDarkMode ? 0.09 : 0.07,
        height: 0.01,
      ),
    );
  }

  static Widget divider2(BuildContext context) {
    final colorScheme = Helpers.colorScheme(context);
    return Divider(
      thickness: 0.5,
      color: colorScheme.inverseSurface.withOpacity(0.5),
    );
  }

/* BOLD Dividers
 */
  static Widget boldDivider(bool isDarkMode) {
    return Padding(
      padding: AppPaddings.forBoldDivider,
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
  static Widget dividerForSignPage(BuildContext context) {
    final theme = Helpers.theme(context);
    return Column(children: [
      const SizedBox(height: 40),
      Row(
        children: <Widget>[
          const Expanded(child: Divider()),
          Padding(
            padding: AppPaddings.horizontal8,
            child: Text(
              AppStrings.continueWith,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Expanded(child: Divider()),
        ],
      ),
      const SizedBox(height: 20),
    ]);
  }

/*
DIVIDER between Dialog Buttons 
 */
  static Widget dividerBetweenDialogButtons(BuildContext context) {
    final colorScheme = Helpers.colorScheme(context);
    return Container(
      width: 0.5,
      color: colorScheme.inverseSurface.withOpacity(0.5),
    );
  }

  static Widget getDividerBetweenDialogButtons(BuildContext context) =>
      dividerBetweenDialogButtons(context);
//
}
