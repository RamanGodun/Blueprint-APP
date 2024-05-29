import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../state management/const data/app_const.dart';
import '../state management/const data/app_locales.dart';
import '../src/generated code/by easy_localization/codegen_loader.g.dart';
import 'material_app.dart';

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
