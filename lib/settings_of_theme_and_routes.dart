import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'State_management/Models/app_enums.dart';
import 'State_management/Helpers/Common/theme_provider_helper.dart';
import 'State_management/Theme_configuration/Themes_provider/manager_of_themes.dart';
import 'State_management/App_routing/app_routes.dart';
import 'State_management/Src/Generated_code/by easy_localization/locale_keys.g.dart';

class ThemeAndRoutesConfiguration extends StatelessWidget {
  const ThemeAndRoutesConfiguration({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<CustomThemeMode>(
      valueListenable: InheritedThemeManager.of(context)!,
      builder: (context, themeMode, _) {
        final selectedTheme = ThemeProviderHelper.getSelectedTheme(themeMode);
        final darkTheme = selectedTheme;
        return MaterialApp.router(
          routerConfig: AppRoutes.router,
          debugShowCheckedModeBanner: false,
          restorationScopeId: 'This app',
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: LocaleKeys.appTitle.tr(),
          theme: selectedTheme,
          darkTheme: darkTheme,
          themeMode: ThemeMode.system,
        );
      },
    );
  }
}
