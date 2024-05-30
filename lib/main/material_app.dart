import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../src/App_routing/app_routes.dart';
import '../src/generated code/by easy_localization/locale_keys.g.dart';
import '../src/services/0.service_locator.dart';
import '../theme_configuration/app_themes.dart';
import '../theme_configuration/theme_controller.dart';

class ThemeAndRoutesSettings extends StatelessWidget {
  const ThemeAndRoutesSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = DIServiceLocator.instance.getIt<ThemeController>();

    return ListenableBuilder(
      listenable: themeController,
      builder: (context, _) {
        return MaterialApp.router(
          routerConfig: AppRoutes.router,
          debugShowCheckedModeBanner: false,
          restorationScopeId: 'This app',
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: LocaleKeys.appTitle.tr(),
          theme: FIAppLightTheme.kLightTheme,
          darkTheme: ThisAppDarkTheme.kDarkTheme,
          themeMode: themeController.themeMode,
        );
      },
    );
  }
}
