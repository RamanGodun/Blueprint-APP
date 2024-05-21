import 'package:cupertino_back_gesture/cupertino_back_gesture.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'src/localization/gen by easy_localization/locale_keys.g.dart';
import 'src/app routing/app_routes.dart';
import 'theme/theme_controller.dart';
import 'theme/app_themes.dart';

class ThisApp extends StatelessWidget {
  final ThemeController settingsController;
  const ThisApp({super.key, required this.settingsController});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return BackGestureWidthTheme(
          backGestureWidth: BackGestureWidth.fraction(1 / 2),
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
            themeMode: settingsController.themeMode,
          ),
        );
      },
    );
  }
}
