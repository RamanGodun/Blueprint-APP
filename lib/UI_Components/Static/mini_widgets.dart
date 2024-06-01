import 'package:flutter/material.dart';
import '../../State_management/Src/Helpers/helpers.dart';
import '../../State_management/Theme_configuration/App_colors_schemes/this_app_colors.dart';

class MiniWidgets {
  static Widget divider2(BuildContext context) {
    final colorScheme = Helpers.colorScheme(context);
    return Divider(
      thickness: 0.5,
      color: colorScheme.inverseSurface.withOpacity(0.5),
    );
  }

/*
Dividers
 */
  static Widget divider(bool isDarkMode, bool? isSymmetric) {
    bool isWithSymmetry = (isSymmetric != null) ? true : false;
    return Padding(
      padding: isWithSymmetry
          ? const EdgeInsets.all(0.0)
          : const EdgeInsets.only(left: 10.0, right: 14, top: 0.0, bottom: 0.0),
      child: Divider(
        color: isDarkMode
            ? ThisAppColors.kSecondaryDarkColor
            : ThisAppColors.kSecondaryColor,
        thickness: isDarkMode ? 0.09 : 0.07,
        height: 0.01,
      ),
    );
  }

  static Widget boldDivider(bool isDarkMode) {
    return Padding(
      padding: const EdgeInsets.only(right: 0, top: 0.0, bottom: 0.0),
      child: Divider(
        color: isDarkMode
            ? ThisAppColors.kSecondaryDarkColor
            : ThisAppColors.kSecondaryColor,
        thickness: isDarkMode ? 0.09 : 0.1,
        height: 1.0,
      ),
    );
  }

/*
Checkbox
 */
  static Widget emptyCheckBox() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
        color: ThisAppColors.kSecondaryColor,
        width: 0.5,
      )),
      height: 25,
      width: 25,
    );
  }

/*
OTHERS (borders)
*/
  static Border border4LightThemeGNavButton = Border.symmetric(
    vertical: BorderSide(
      color: const Color.fromARGB(114, 15, 108, 91).withOpacity(0.4),
      width: 2.5,
      style: BorderStyle.solid,
    ),
  );

  static Border border4DarkThemeGNavButton = Border.symmetric(
    vertical: BorderSide(
      color: ThisAppColors.kAppPrimaryColor.withOpacity(0.3),
      width: 2.5,
      style: BorderStyle.solid,
    ),
  );
}
