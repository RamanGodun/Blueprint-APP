import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'theme_service.dart';

class ThemeInitializer extends StatelessWidget {
  final Widget child;

  const ThemeInitializer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    // Ініціалізація сервісу теми
    final themeService = GetIt.I<ThemeService>();
    themeService.init(context);

    // Відразу відображаємо дочірній віджет
    return child;
  }
}
