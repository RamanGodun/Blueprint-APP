import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'src/localization/gen by easy_localization/codegen_loader.g.dart';
import 'src/helpers/const.dart';
import 'src/localization/app_locales.dart';
import 'state/services (Get It)/service_locator.dart';
import 'state/state 4 interviewer app/state_widget.dart';
import 'this_app.dart';
import 'theme/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  setupOfGetItDependencies();

  // Ініціалізація бази даних
  // await setupDatabase();

  final appLocales = AppLocales().appLocales;
  final settingsController = getIt<ThemeController>();
  await settingsController.loadSettings();
  // final appState = await loadInitialState();

  runApp(
// here we can add Provider like next:
    // MultiProvider(
    //   providers: const [
    //    ChangeNotifierProvider(create: (_) => ThemeProvider()),
    //   ],
    ProviderScope(
      child: EasyLocalization(
        assetLoader: const CodegenLoader(),
        supportedLocales: AppLocales().appLocales,
        path: AppConstants.translationsPath,
        fallbackLocale: appLocales[0],
        child: DataProviderStateFull(
            // appState: appState,
            child: ThisApp(settingsController: settingsController)),
      ),
    ),
  );

//
}
