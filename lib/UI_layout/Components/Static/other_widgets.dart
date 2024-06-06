import 'package:flutter/material.dart';
import '../../../State_management/Theme_configuration/this_app_colors.dart';

class AppOtherWidgets {
  static final Border border4LightThemeGNavButton = Border.symmetric(
    vertical: BorderSide(
      color: const Color.fromARGB(114, 15, 108, 91).withOpacity(0.4),
      width: 2.5,
      style: BorderStyle.solid,
    ),
  );

  static final Border border4DarkThemeGNavButton = Border.symmetric(
    vertical: BorderSide(
      color: AppColors.kAppPrimaryColor.withOpacity(0.3),
      width: 2.5,
      style: BorderStyle.solid,
    ),
  );
}
