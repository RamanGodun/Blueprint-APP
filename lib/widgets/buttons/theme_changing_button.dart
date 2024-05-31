import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../src/generated code/by easy_localization/locale_keys.g.dart';
import '../../state_management/theme_settings/inherited_theme_manager.dart';
import '../../state_management/theme_settings/theme_provider.dart';

class ThemeChangingButton extends StatelessWidget {
  const ThemeChangingButton({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = InheritedThemeManager.of(context);

    return ValueListenableBuilder<CustomThemeMode>(
      valueListenable: themeProvider!,
      builder: (context, themeMode, _) {
        final colorScheme = Theme.of(context).colorScheme;
        final textTheme = Theme.of(context).textTheme;
        final isDarkMode = Theme.of(context).brightness == Brightness.dark;

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: isDarkMode
                    ? Colors.black
                    : colorScheme.inverseSurface.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(2, 4),
              ),
              BoxShadow(
                color: isDarkMode
                    ? Colors.black
                    : colorScheme.inverseSurface.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<CustomThemeMode>(
              key: ValueKey(context.locale.toString()),
              value: themeMode,
              onChanged: (newThemeMode) {
                if (newThemeMode != null) {
                  themeProvider.updateThemeMode(newThemeMode);
                }
              },
              items: StaticDecorations.buildThemeModeItems(context),
              style: textTheme.bodyLarge?.copyWith(
                color: colorScheme.onSurface,
              ),
              dropdownColor: colorScheme.surface,
              icon: Icon(
                Icons.arrow_drop_down,
                color: colorScheme.onSurface,
              ),
            ),
          ),
        );
      },
    );
  }
}

class StaticDecorations {
  static List<DropdownMenuItem<CustomThemeMode>> buildThemeModeItems(
      BuildContext context) {
    final List<CustomThemeMode> themeModes = [
      CustomThemeMode.system,
      CustomThemeMode.lightAndroid,
      CustomThemeMode.lightIOS,
      CustomThemeMode.darkAndroid,
      CustomThemeMode.darkIOS,
      CustomThemeMode.darkGlass,
    ];
    final List<String> themeModeTexts = [
      LocaleKeys.systemTheme.tr(),
      LocaleKeys.lightAndroidTheme.tr(),
      LocaleKeys.lightIOSTheme.tr(),
      LocaleKeys.darkAndroidTheme.tr(),
      LocaleKeys.darkIOSTheme.tr(),
      LocaleKeys.darkGlassTheme.tr(),
    ];

    return List<DropdownMenuItem<CustomThemeMode>>.generate(
      themeModes.length,
      (index) => DropdownMenuItem<CustomThemeMode>(
        value: themeModes[index],
        child: Text(
          themeModeTexts[index],
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
      ),
    );
  }
}
