import 'package:flutter/material.dart';
import '../../../State_management/Theme_configuration/this_app_colors.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeProvider>(context);

    return Row(
      children: [
        Switch(
          value: true,
// themeProvider.themeMode == ThemeMode.light,
          onChanged: (isLightMode) {
            // final newMode = isLightMode ? ThemeMode.light : ThemeMode.dark;
            // themeProvider.setThemeMode(newMode);
          },
          inactiveTrackColor: ThisAppColors.black54,
          activeColor: ThisAppColors.kPrimarySwatch.withOpacity(0.3),
          inactiveThumbImage: const AssetImage('assets/img/moon.png'),
          activeThumbImage: const AssetImage('assets/img/sun.png'),
        ),
      ],
    );
  }
}
