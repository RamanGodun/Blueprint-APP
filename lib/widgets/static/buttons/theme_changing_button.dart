import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../src/generated code/by easy_localization/locale_keys.g.dart';
import '../../../state_management/theme_settings/inherited_theme_manager.dart';
import '../../../state_management/theme_settings/theme_provider.dart';

class ThemeChangingButton extends StatelessWidget {
  const ThemeChangingButton({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = InheritedThemeManager.of(context);

    return ValueListenableBuilder<CustomThemeMode>(
      valueListenable: themeProvider!,
      builder: (context, themeMode, _) {
        return DropdownButton<CustomThemeMode>(
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

  List<DropdownMenuItem<CustomThemeMode>> _buildThemeModeItems(
      BuildContext context) {
    final List<CustomThemeMode> themeModes = [
      CustomThemeMode.system,
      CustomThemeMode.light,
      CustomThemeMode.dark,
      CustomThemeMode.glass,
      CustomThemeMode.darkGlass1,
      CustomThemeMode.darkGlass2,
    ];
    final List<String> themeModeTexts = [
      LocaleKeys.systemTheme.tr(),
      LocaleKeys.lightTheme.tr(),
      LocaleKeys.darkTheme.tr(),
      LocaleKeys.glassTheme.tr(),
      LocaleKeys.darkGlassTheme1.tr(),
      LocaleKeys.darkGlassTheme2.tr(),
    ];

    return List<DropdownMenuItem<CustomThemeMode>>.generate(
      themeModes.length,
      (index) => DropdownMenuItem<CustomThemeMode>(
        value: themeModes[index],
        child: Text(themeModeTexts[index]),
      ),
    );
  }
}
