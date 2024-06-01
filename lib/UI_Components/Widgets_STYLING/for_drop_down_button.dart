import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../State_management/Models/app_enums.dart';
import '../../State_management/Src/Generated_code/by easy_localization/locale_keys.g.dart';
import '../../State_management/Src/Helpers/helpers.dart';

class DropButtonStyle {
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
    final textTheme = Helpers.textTheme(context);
    final colorScheme = Helpers.colorScheme(context);
    return List<DropdownMenuItem<CustomThemeMode>>.generate(
      themeModes.length,
      (index) => DropdownMenuItem<CustomThemeMode>(
        value: themeModes[index],
        child: Text(
          themeModeTexts[index],
          style: textTheme.bodyLarge?.copyWith(
            color: colorScheme.onSurface,
          ),
        ),
      ),
    );
  }

/* next FOR Drop Button FROM JBnTracker
 */
  static InputDecoration getInputDecoration(
      BuildContext context, bool isDarkTheme) {
    final colorScheme = Theme.of(context).colorScheme;
    return InputDecoration(
      isDense: true,
      filled: true,
      fillColor: colorScheme.surface.withOpacity(isDarkTheme ? 0.1 : 0.21),
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 1),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
            color: colorScheme.secondary.withOpacity(isDarkTheme ? 0.25 : 0.25),
            width: isDarkTheme ? 0.25 : 0.65),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
            color: colorScheme.secondary.withOpacity(isDarkTheme ? 0.25 : 0.25),
            width: isDarkTheme ? 0.3 : 0.65),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  static Color getDropdownColor(BuildContext context, bool isDarkTheme) {
    return !isDarkTheme
        ? const Color.fromARGB(255, 233, 230, 230)
        : const Color.fromARGB(255, 14, 4, 4).withOpacity(0.95);
  }

  static TextStyle getTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.displaySmall!.copyWith(
          fontSize: 11.5,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w300,
        );
  }

//
}
