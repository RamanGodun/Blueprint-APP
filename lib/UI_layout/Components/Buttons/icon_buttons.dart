import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../State_management/Helpers/Common/helpers.dart';
import '../../../State_management/Src/Const_data/app_locales.dart';
import '../../../State_management/Src/Custom_icons/custom_icons_src.dart';
import '../_Widgets_STYLING/icon_button_style.dart';

class AppIconButtons {
  static Widget changeLanguageButton(BuildContext context) {
    final appLocales = AppLocales().appLocales;
    return AppIconButtonStyle.withShadows(
      context,
      icon: ThisAppIcons.globe,
      onPressed: () {
        Locale newLocale =
            context.locale == appLocales[0] ? appLocales[1] : appLocales[0];
        context.setLocale(newLocale);
      },
    );
  }

  static Widget dialogIconButton(
    BuildContext context, {
    required void Function()? onPressed,
  }) {
    return AppIconButtonStyle.withShadows(
      context,
      icon: ThisAppIcons.crown,
      onPressed: onPressed,
    );
  }

  static Widget signOutButton(BuildContext context,
      {required VoidCallback onPressed}) {
    return AppIconButtonStyle.withShadows(
      context,
      icon: Icons.logout,
      onPressed: onPressed,
    );
  }

  static Widget backIcon(BuildContext context) {
    final ColorScheme colorScheme = Helpers.colorScheme(context);
    return AppIconButtonStyle.withoutShadows(
      context,
      iconColor: colorScheme.onSurface,
      icon: CupertinoIcons.back,
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  static Widget toSettingsPageIconButton(BuildContext context) {
    return AppIconButtonStyle.withShadows(
      context,
      icon: ThisAppIcons.settings,
      onPressed: () {
        context.pushNamed('SettingsPage');
      },
    );
  }

//
//
}
