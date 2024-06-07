import 'package:flutter/material.dart';

import '../../../State_management/Helpers/Common/helpers.dart';
import '../../../State_management/Theme_configuration/app_colors.dart';

class AppDividers {
/* Custom Dividers
 */
  static Widget divider(bool isDarkMode, bool? isSymmetric) {
    bool isWithSymmetry = (isSymmetric != null) ? true : false;
    return Padding(
      padding: isWithSymmetry
          ? const EdgeInsets.all(0.0)
          : const EdgeInsets.only(left: 10.0, right: 14, top: 0.0, bottom: 0.0),
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
      padding: const EdgeInsets.only(right: 0, top: 0.0, bottom: 0.0),
      child: Divider(
        color: isDarkMode
            ? AppColors.kSecondaryDarkColor
            : AppColors.kSecondaryColor,
        thickness: isDarkMode ? 0.09 : 0.1,
        height: 1.0,
      ),
    );
  }

/*
  DIVIDER 4 Login page
 */
  static const Widget divider4LoginPage = Padding(
    padding: EdgeInsets.only(left: 25.0, right: 25, bottom: 30),
    child: Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 0.5,
            color: Colors.grey,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            'Or continue with',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 0.5,
            color: Colors.grey,
          ),
        ),
      ],
    ),
  );

  static Widget getDivider4LoginPage() => divider4LoginPage;

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
