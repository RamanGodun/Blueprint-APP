import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../src/App_routing/app_routes.dart';
import '../src/generated code/by easy_localization/locale_keys.g.dart';
import '../state_management/theme_settings/inherited_theme_manager.dart';
import '../state_management/theme_settings/app_themes.dart';

class GettingContextForThemeManager extends StatelessWidget {
  const GettingContextForThemeManager({super.key});

  @override
  Widget build(BuildContext context) {
    return const InheritedThemeManager(
      child: ThemeAndRoutesSettings(),
    );
  }
}

class ThemeAndRoutesSettings extends StatelessWidget {
  const ThemeAndRoutesSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: InheritedThemeManager.of(context)!,
      builder: (context, themeMode, _) {
        return MaterialApp.router(
          routerConfig: AppRoutes.router,
          debugShowCheckedModeBanner: false,
          restorationScopeId: 'This app',
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: LocaleKeys.appTitle.tr(),
          theme: ThisAppLightTheme.kLightTheme,
          darkTheme: ThisAppDarkTheme.kDarkTheme,
          themeMode: themeMode,
        );
      },
    );
  }
}
