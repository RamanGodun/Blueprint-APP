import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../State_management/Helpers/Common/helpers.dart';
import '../../../State_management/Models/app_enums.dart';
import '../../../State_management/Src/Generated_code/by easy_localization/locale_keys.g.dart';
import '../../../State_management/Theme_configuration/Themes_provider/manager_of_themes.dart';
import '../_Widgets_STYLING/app_text_styles.dart';
import '../_Widgets_STYLING/drop_buttons_styles.dart';

class AppDDButtons {
  static Widget themeChanging(
    BuildContext context,
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
          items: _buildThemeModeItems(context),
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

  static List<DropdownMenuItem<CustomThemeMode>> _buildThemeModeItems(
      BuildContext context) {
    final List<CustomThemeMode> themeModes = [
      CustomThemeMode.lightAndroid,
      CustomThemeMode.lightIOS,
      CustomThemeMode.customLight,
      CustomThemeMode.system,
      CustomThemeMode.darkGlass,
      CustomThemeMode.darkAndroid,
      CustomThemeMode.darkIOS,
      CustomThemeMode.customDark,
    ];
    final List<String> themeModeTexts = [
      LocaleKeys.lightAndroidTheme.tr(),
      LocaleKeys.lightIOSTheme.tr(),
      LocaleKeys.customLightTheme.tr(),
      LocaleKeys.systemTheme.tr(),
      LocaleKeys.darkGlassTheme.tr(),
      LocaleKeys.darkAndroidTheme.tr(),
      LocaleKeys.darkIOSTheme.tr(),
      LocaleKeys.customDarkTheme.tr(),
    ];
    final theme = Helpers.themeGet(context);
    return List<DropdownMenuItem<CustomThemeMode>>.generate(
      themeModes.length,
      (index) => DropdownMenuItem<CustomThemeMode>(
        value: themeModes[index],
        child: Text(
          themeModeTexts[index],
          style: AppTextStyles.bodyLarge(theme),
        ),
      ),
    );
  }
}
