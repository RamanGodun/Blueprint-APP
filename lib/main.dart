import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'main/app_state_management.dart';
import 'state/services (Get It)/service_locator.dart';
import 'theme/theme_controller.dart';
import 'widgets/static/static_widgets.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AppInitializer());
}

class AppInitializer extends StatelessWidget {
  const AppInitializer({super.key});

  Future<void> initializeApp() async {
    await EasyLocalization.ensureInitialized();
    setupOfGetItDependencies();
    final themeSettingsController = getIt<ThemeController>();
    await themeSettingsController.loadSettings();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return const AppStateManagement();
        } else {
          return const Material(
              child: Center(child: StaticWidgets.loadingWidget));
        }
      },
    );
  }
}
