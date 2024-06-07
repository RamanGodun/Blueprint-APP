import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'State_management/Src/Const_data/app_const.dart';
import 'State_management/Src/Const_data/app_locales.dart';
import 'State_management/Providers/Providers_for_store/auth_profile_provider.dart';
import 'State_management/Providers/Providers_for_store/cart_provider.dart';
import 'State_management/Providers/Provider_4_tracker/categories_provider.dart';
import 'State_management/Providers/Providers_for_store/common_data_provider.dart';
import 'State_management/Providers/Provider_4_tracker/items_provider.dart';
import 'State_management/Src/Generated_code/by easy_localization/codegen_loader.g.dart';
import 'settings_of_theme_and_routes.dart';

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
          ChangeNotifierProvider<CategoriesProvider>(
              create: (context) => CategoriesProvider()),
          ChangeNotifierProvider<ItemsDataBase>(
              create: (context) => ItemsDataBase()),
          ChangeNotifierProvider<AuthProvider>(
              create: (context) => AuthProvider()),
          ChangeNotifierProvider<CommonDataProvider>(
              create: (context) => CommonDataProvider()),
          ChangeNotifierProvider<CartsProvider>(
              create: (context) => CartsProvider(context)),
        ],
        child: const GetContextForInheritedThemeManager(),
      ),
    );
  }
}
