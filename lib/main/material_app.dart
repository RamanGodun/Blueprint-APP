import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../src/app routing/app_routes.dart';
import '../src/localization/gen by easy_localization/locale_keys.g.dart';
import '../src/services/service_locator_get_it.dart';
import '../theme configuration/app_themes.dart';
import '../theme configuration/theme_controller.dart';

class MaterialAppWithThemeAndRoutesSettings extends StatelessWidget {
  const MaterialAppWithThemeAndRoutesSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = getIt<ThemeController>();

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
