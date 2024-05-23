import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main/app_state_management.dart';
import 'src/services/service_locator_get_it.dart';
import 'theme configuration/theme_controller.dart';
import 'widgets/static/static_widgets.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AppInitializer());
}

class AppInitializer extends StatelessWidget {
  const AppInitializer({super.key});

  Future<void> initializeApp() async {
    await Future.wait([
      EasyLocalization.ensureInitialized(),
      SharedPreferences.getInstance(),
      setupOfGetItDependencies(),
    ]);
    await getIt<ThemeController>().loadSettings();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return StaticWidgets.errorWidget(snapshot.error.toString());
          }
          return const AppStateManagement();
        } else {
          return StaticWidgets.loadingWidget;
        }
      },
    );
  }
}
