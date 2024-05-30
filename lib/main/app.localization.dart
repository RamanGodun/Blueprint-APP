import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../state_management/const_data/app_const.dart';
import '../state_management/const_data/app_locales.dart';
import '../src/generated code/by easy_localization/codegen_loader.g.dart';
import 'theme_and_routes_settings.dart';

class LocalizationOfThisApp extends StatelessWidget {
  const LocalizationOfThisApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocales = AppLocales().appLocales;

    return EasyLocalization(
      assetLoader: const CodegenLoader(),
      supportedLocales: appLocales,
      path: AppConstants.translationsPath,
      fallbackLocale: appLocales[0],
      child: const ThemeAndRoutesSettings(),
    );
  }
}
