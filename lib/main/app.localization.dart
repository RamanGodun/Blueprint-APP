import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../src/helpers/const.dart';
import '../src/localization/app_locales.dart';
import '../src/localization/gen by easy_localization/codegen_loader.g.dart';
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
      child: const MaterialAppWithThemeAndRoutesSettings(),
    );
  }
}
