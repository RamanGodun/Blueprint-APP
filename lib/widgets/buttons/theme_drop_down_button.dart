import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';

import '../../state management/const data/app_const.dart';
import '../../theme configuration/theme_controller.dart';

class ThemeChangingButton extends HookWidget {
  const ThemeChangingButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useMemoized(() => GetIt.instance<ThemeController>());
    final themeMode = useListenable(controller);

    return DropdownButton<ThemeMode>(
      key: ValueKey(context.locale.toString()),
      value: themeMode.themeMode,
      onChanged: controller.updateThemeMode,
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
