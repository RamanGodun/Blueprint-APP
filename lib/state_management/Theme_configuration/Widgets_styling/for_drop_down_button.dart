import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../Models/app_enums.dart';
import '../../Src/Generated_code/by easy_localization/locale_keys.g.dart';

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
