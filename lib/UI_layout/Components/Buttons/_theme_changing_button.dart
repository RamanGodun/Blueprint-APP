import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../State_management/Models/app_enums.dart';
import '../../../State_management/Helpers/Common/helpers.dart';
import '../_Widgets_STYLING/_custom_button_style.dart';
import '../_Widgets_STYLING/for_theme_drop_down_button.dart';
import '../../../State_management/Theme_configuration/Themes_provider/manager_of_themes.dart';

class ThemeChangingButton extends StatelessWidget {
  const ThemeChangingButton({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = InheritedThemeManager.of(context);
    final colorScheme = Helpers.colorScheme(context);
    final textTheme = Helpers.textTheme(context);
    final isDarkMode = Helpers.isDarkTheme(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: AppButtonsStyle.themeChangingDD(colorScheme, isDarkMode),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<CustomThemeMode>(
          key: ValueKey(context.locale.toString()),
          value: themeProvider!.value,
          onChanged: (newThemeMode) {
            themeProvider.updateThemeMode(newThemeMode!);
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
  }
}
