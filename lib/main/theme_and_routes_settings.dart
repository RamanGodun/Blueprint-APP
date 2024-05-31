import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../src/App_routing/app_routes.dart';
import '../src/generated code/by easy_localization/locale_keys.g.dart';
import '../state_management/theme_settings/inherited_theme_manager.dart';
import '../state_management/theme_settings/app_themes.dart';
import '../state_management/theme_settings/theme_provider.dart';

class GettingContextForThemeManager extends StatelessWidget {
  const GettingContextForThemeManager({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: InheritedThemeManager(
        child: ThemeAndRoutesSettings(),
      ),
    );
  }
}

class ThemeAndRoutesSettings extends StatelessWidget {
  const ThemeAndRoutesSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<CustomThemeMode>(
      valueListenable: InheritedThemeManager.of(context)!,
      builder: (context, themeMode, _) {
        ThemeData? selectedTheme;
        ThemeData? darkTheme;
        switch (themeMode) {
          case CustomThemeMode.lightIOS:
            selectedTheme = ThisAppThemes.kLightIOSTheme;
            darkTheme = ThisAppThemes.kDarkIOSTheme;
            break;
          case CustomThemeMode.darkIOS:
            selectedTheme = ThisAppThemes.kDarkIOSTheme;
            darkTheme = ThisAppThemes.kDarkIOSTheme;
            break;
          case CustomThemeMode.lightAndroid:
            selectedTheme = ThisAppThemes.kLightAndroidTheme;
            darkTheme = ThisAppThemes.kDarkAndroidTheme;
            break;
          case CustomThemeMode.darkAndroid:
            selectedTheme = ThisAppThemes.kDarkAndroidTheme;
            darkTheme = ThisAppThemes.kDarkAndroidTheme;
            break;
          case CustomThemeMode.darkGlass:
            selectedTheme = ThisAppThemes.kDarkGlassTheme;
            darkTheme = ThisAppThemes.kDarkGlassTheme;
            break;
          case CustomThemeMode.system:
          default:
            selectedTheme = ThisAppThemes.kLightIOSTheme;
            darkTheme = ThisAppThemes.kDarkIOSTheme;
        }

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
