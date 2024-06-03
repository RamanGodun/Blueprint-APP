import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../State_management/Models/app_enums.dart';
import '../State_management/Theme_configuration/configurations_of_themes.dart';
import '../State_management/Theme_configuration/Themes_provider/manager_of_themes.dart';
import '../State_management/Src/App_routing/app_routes.dart';
import '../State_management/Src/Generated_code/by easy_localization/locale_keys.g.dart';

class ThemeAndRoutesConfiguration extends StatelessWidget {
  const ThemeAndRoutesConfiguration({super.key});

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
          case CustomThemeMode.customLight:
            selectedTheme = ThisAppThemes.kLightCustomIOSTheme;
            darkTheme = ThisAppThemes.kDarkGlassTheme;
            break;
          case CustomThemeMode.customDark:
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
