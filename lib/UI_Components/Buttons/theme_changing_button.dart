import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../State_management/Models/app_enums.dart';
import '../../State_management/Src/Helpers/helpers.dart';
import '../0_Widgets_STYLING/for_theme_drop_down_button.dart';
import '../../State_management/Theme_configuration/Themes_provider/manager_of_themes.dart';

class ThemeChangingButton extends StatelessWidget {
  const ThemeChangingButton({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = InheritedThemeManager.of(context);

    return ValueListenableBuilder<CustomThemeMode>(
      valueListenable: themeProvider!,
      builder: (context, themeMode, _) {
        final colorScheme = Helpers.colorScheme(context);
        final textTheme = Helpers.textTheme(context);
        final isDarkMode = Helpers.isDarkTheme(context);

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
              items: DropButtonStyle.buildThemeModeItems(context),
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
