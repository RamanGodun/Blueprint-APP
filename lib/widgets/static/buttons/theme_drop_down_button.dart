import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../src/helpers/inherited_change_notifier.dart';
import '../../../state_management/const_data/app_const.dart';
import '../../../state_management/theme_provider.dart';

class ThemeChangingButton extends StatelessWidget {
  const ThemeChangingButton({super.key});

  @override
  Widget build(BuildContext context) {
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

  List<DropdownMenuItem<ThemeMode>> _buildThemeModeItems(BuildContext context) {
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
