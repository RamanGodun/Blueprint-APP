import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:provider/provider.dart';
import 'src/gen by easy_localization/codegen_loader.g.dart';
import 'src/helpers/const.dart';
import 'src/localization/app_locales.dart';
import 'src/services/service_locator.dart';
import 'this_app.dart';
import 'theme/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  setupOfGetItDependencies();
  final settingsController = getIt<ThemeController>();
  await settingsController.loadSettings();
  final appLocales = AppLocales().appLocales;

  runApp(
    // MultiProvider(
    //   providers: const [
    //     // ChangeNotifierProvider(create: (_) => ItemsDataBase()),
    //     // ChangeNotifierProvider(create: (_) => ThemeProvider()),
    //     // ChangeNotifierProvider(create: (_) => CategoriesProvider()),
    //   ],
    ProviderScope(
      child: EasyLocalization(
        assetLoader: const CodegenLoader(),
        supportedLocales: AppLocales().appLocales,
        path: AppConstants.translationsPath,
        fallbackLocale: appLocales[0],
        child: ThisApp(settingsController: settingsController),
      ),
    ),
  );
}
