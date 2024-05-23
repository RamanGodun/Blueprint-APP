import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main/app_state_management.dart';
import 'state management/services 4 GetIt/service_locator.dart';
import 'theme configuration/theme_controller.dart';
import 'widgets/static/static_widgets.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AppInitializer());
}

class AppInitializer extends StatelessWidget {
  const AppInitializer({super.key});

  Future<void> initializeApp(BuildContext context) async {
    await Future.wait([
      EasyLocalization.ensureInitialized(),
      SharedPreferences.getInstance(),
    ]);
    setupOfGetItDependencies();
    final themeSettingsController = getIt<ThemeController>();
    await themeSettingsController.loadSettings();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializeApp(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Material(
              child: Center(
                child: Text('Error: ${snapshot.error}'),
              ),
            );
          }
          return const AppStateManagement();
        } else {
          return const Material(child: StaticWidgets.loadingWidget);
        }
      },
    );
  }
}
