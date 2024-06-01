import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

import '../../State_management/Const_data/app_locales.dart';
import '../../State_management/Src/Custom_icons/this_app_icons.dart';
import '../../State_management/Src/Helpers/helpers.dart';
import '../../State_management/Theme_configuration/text_styles.dart';

class StaticCustomButtons {
  static Widget customButton(BuildContext context,
      {required VoidCallback onPressed, required String buttonText}) {
    final theme = Helpers.cupertinoThemeData(context);

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              theme.primaryColor.withOpacity(0.9),
              theme.primaryColor.withOpacity(0.95),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: CupertinoColors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
            BoxShadow(
              color: CupertinoColors.black.withOpacity(0.05),
              spreadRadius: 0.5,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Center(
          child: Text(
            buttonText,
            style: ThisAppTextStyles.buttonTextStyle(context),
          ),
        ),
      ),
    );
  }

  static Widget customButton2(BuildContext context,
      {required VoidCallback onPressed, required String buttonText}) {
    final theme = Helpers.cupertinoThemeData(context);

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              theme.primaryColor.withOpacity(0.9),
              theme.primaryColor.withOpacity(0.95),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: CupertinoColors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
            BoxShadow(
              color: CupertinoColors.black.withOpacity(0.05),
              spreadRadius: 0.5,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Center(
          child: Text(
            buttonText,
            style: ThisAppTextStyles.buttonTextStyle(context),
          ),
        ),
      ),
    );
  }

  static Widget changeLanguageButton(BuildContext context) {
    final theme = Helpers.cupertinoThemeData(context);
    final appLocales = AppLocales().appLocales;

    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        Locale newLocale =
            context.locale == appLocales[0] ? appLocales[1] : appLocales[0];
        context.setLocale(newLocale);
      },
      child: Icon(
        ThisAppIcons.globe,
        color: theme.primaryColor,
        shadows: [
          BoxShadow(
            color: CupertinoColors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(1, 3),
          ),
        ],
      ),
    );
  }
}
