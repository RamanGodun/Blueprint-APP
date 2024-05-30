import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../src/App_routing/app_routes.dart';
import '../src/generated code/by easy_localization/locale_keys.g.dart';
import '../src/helpers/inherited_change_notifier.dart';
import '../state_management/inherited_theme_manager.dart';
import '../state_management/theme_provider.dart';
import '../theme_configuration/app_themes.dart';

class ThemeAndRoutesSettings extends StatelessWidget {
  const ThemeAndRoutesSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return InheritedThemeManager(
      child: MaterialApp.router(
        routerConfig: AppRoutes.router,
        debugShowCheckedModeBanner: false,
        restorationScopeId: 'This app',
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: LocaleKeys.appTitle.tr(),
        theme: FIAppLightTheme.kLightTheme,
        darkTheme: ThisAppDarkTheme.kDarkTheme,
        themeMode:
            ChangeNotifierProvider.watch<ThemeProvider>(context)?.themeMode ??
                ThemeMode.system,
      ),
    );
  }
}
