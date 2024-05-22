import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../src/localization/app_locales.dart';
import '../theme configuration/this_app_icons_icons.dart';

class LanguageToggleButton extends StatelessWidget {
  final VoidCallback onUpdate;
  const LanguageToggleButton({super.key, required this.onUpdate});

  @override
  Widget build(BuildContext context) {
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
