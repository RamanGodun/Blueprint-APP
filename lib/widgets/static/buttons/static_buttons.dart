import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../src/helpers/inherited_change_notifier.dart';
import '../../../state_management/const_data/app_const.dart';
import '../../../state_management/const_data/app_locales.dart';
import '../../../state_management/const_data/this_app_icons.dart';
import '../../../state_management/theme_provider.dart';

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
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: colorScheme.primary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: textTheme.bodyLarge?.copyWith(
              color: colorScheme.onPrimary,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  static Widget languageToggleButton(
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

  static Widget themeChangingButton(BuildContext context) {
    final themeProvider = ChangeNotifierProvider.watch<ThemeProvider>(context);

    return DropdownButton<ThemeMode>(
      key: ValueKey(context.locale.toString()),
      value: themeProvider?.themeMode ?? ThemeMode.system,
      onChanged: (newThemeMode) {
        themeProvider?.updateThemeMode(newThemeMode);
      },
      items: _buildThemeModeItems(context),
    );
  }

  static List<DropdownMenuItem<ThemeMode>> _buildThemeModeItems(
      BuildContext context) {
    final List<ThemeMode> themeModes = AppConstants.themeModes;
    final List<String> themeModeTexts = AppConstants.themeModeTexts;

    return List<DropdownMenuItem<ThemeMode>>.generate(
      themeModes.length,
      (index) => DropdownMenuItem<ThemeMode>(
        value: themeModes[index],
        child: Text(themeModeTexts[index].tr()),
      ),
    );
  }
}
