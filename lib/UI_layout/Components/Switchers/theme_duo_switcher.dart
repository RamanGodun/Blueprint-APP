import 'package:flutter/material.dart';
import '../../../State_management/Theme_configuration/app_colors.dart';

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
          inactiveTrackColor: AppColors.black54,
          activeColor: AppColors.kPrimarySwatch.withOpacity(0.3),
          inactiveThumbImage: const AssetImage('assets/img/moon.png'),
          activeThumbImage: const AssetImage('assets/img/sun.png'),
        ),
      ],
    );
  }
}

/* ALT Switcher
 return Container(
        height: widget.height,
        width: widget.width,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            const Icon(Icons.nightlight_outlined, size: 20),
            const SizedBox(width: 5),
            SizedBox(
              width: 30,
              height: 25,
              child: Switch(
                value: Helpers.isDarkTheme(context),
                inactiveThumbColor: Theme.of(context).indicatorColor,
                inactiveTrackColor: Theme.of(context).hoverColor,
                onChanged: (value) {
                  // Provider.of<ThemeProvider>(context, listen: false)
                  //     .updateThemeMode(value);
                  setState(() {});
                },
              ),
            ),
            const SizedBox(width: 5),
            const Icon(Icons.wb_sunny_outlined, size: 20),
          ],
        ),
      );s
 */