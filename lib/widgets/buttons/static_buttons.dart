import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../state_management/const_data/app_locales.dart';
import '../../state_management/const_data/this_app_icons.dart';

class StaticCustomButtons {
  static Widget customButton(BuildContext context,
      {required VoidCallback onPressed, required String buttonText}) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          color: colorScheme.secondary.withOpacity(0.7),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: textTheme.bodyLarge?.copyWith(
              color: colorScheme.inversePrimary,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  static Widget customButton2(BuildContext context,
      {required VoidCallback onPressed, required String buttonText}) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorScheme.secondary,
      ),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: textTheme.bodyLarge?.copyWith(
          color: colorScheme.onInverseSurface,
        ),
      ),
    );
  }

  static Widget changeLanguageButton(
      BuildContext context, VoidCallback onUpdate) {
    final appLocales = AppLocales().appLocales;

    return IconButton(
      icon: const Icon(ThisAppIcons.globe),
      onPressed: () {
        Locale newLocale =
            context.locale == appLocales[0] ? appLocales[1] : appLocales[0];
        context.setLocale(newLocale);
        onUpdate();
      },
    );
  }
}
