import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../State_management/Const_data/app_const.dart';
import '../State_management/Const_data/app_locales.dart';
import '../State_management/Providers/categories_provider.dart';
import '../State_management/Theme_configuration/Themes_provider/manager_of_themes.dart';
import '../State_management/Src/Generated_code/by easy_localization/codegen_loader.g.dart';
import 'theme_and_routes_settings.dart';

class AppLocalization extends StatelessWidget {
  const AppLocalization({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocales = AppLocales().appLocales;
    return EasyLocalization(
      assetLoader: const CodegenLoader(),
      supportedLocales: appLocales,
      path: AppConstants.translationsPath,
      fallbackLocale: appLocales[0],
      child: const DataProviders(),
    );
  }
}

class DataProviders extends StatelessWidget {
  const DataProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CategoriesProvider()),
          // ChangeNotifierProvider(create: (_) => ItemsDataBase()),
        ],
        child: const InheritedThemeManager(
          child: ThemeAndRoutesConfiguration(),
        ),
      ),
    );
  }
}
