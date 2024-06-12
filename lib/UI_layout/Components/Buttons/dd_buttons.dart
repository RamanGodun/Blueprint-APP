import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../State_management/Helpers/Common/helpers.dart';
import '../../../State_management/Models/app_enums.dart';
import '../../../State_management/Theme_configuration/Themes_provider/manager_of_themes.dart';
import '../_Widgets_STYLING/drop_buttons_styles.dart';
import '../_Widgets_STYLING/dd_button_styles.dart';

class AppDDButtons {
  static Widget forThemeChanging(BuildContext context

      // required void Function()? onPressed,
      ) {
    final themeProvider = InheritedThemeManager.of(context);
    final theme = Helpers.themeGet(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: AppDropButtonStyle.forThemeChangingDB(context),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<CustomThemeMode>(
          key: ValueKey(context.locale.toString()),
          value: themeProvider!.value,
          onChanged: (newThemeMode) {
            themeProvider.updateThemeMode(newThemeMode!);
          },
          items: DropButtonStyle.buildThemeModeItems(context),
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurface,
          ),
          dropdownColor: theme.colorScheme.surface,
          icon: Icon(
            Icons.arrow_drop_down,
            color: theme.colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
