import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../src/generated code/by easy_localization/locale_keys.g.dart';
import '../../../state_management/inherited_theme_manager.dart';

class ThemeChangingButton extends StatelessWidget {
  const ThemeChangingButton({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = InheritedThemeManager.of(context);

    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeProvider!,
      builder: (context, themeMode, _) {
        return DropdownButton<ThemeMode>(
          key: ValueKey(context.locale.toString()),
          value: themeMode,
          onChanged: (newThemeMode) {
            if (newThemeMode != null) {
              themeProvider.updateThemeMode(newThemeMode);
            }
          },
          items: _buildThemeModeItems(context),
        );
      },
    );
  }

  List<DropdownMenuItem<ThemeMode>> _buildThemeModeItems(BuildContext context) {
    final List<ThemeMode> themeModes = [
      ThemeMode.system,
      ThemeMode.light,
      ThemeMode.dark
    ];
    final List<String> themeModeTexts = [
      LocaleKeys.systemTheme.tr(),
      LocaleKeys.lightTheme.tr(),
      LocaleKeys.darkTheme.tr()
    ];

    return List<DropdownMenuItem<ThemeMode>>.generate(
      themeModes.length,
      (index) => DropdownMenuItem<ThemeMode>(
        value: themeModes[index],
        child: Text(themeModeTexts[index]),
      ),
    );
  }
}
