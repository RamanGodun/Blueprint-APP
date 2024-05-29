/*
Copyright [2024] [Roman Godun]
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at
   http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'main/app.localization.dart';
import 'src/helpers/firebase_options.dart';
import 'src/services/0.service_locator.dart';
import 'theme configuration/theme_controller.dart';
import 'widgets/static/static_widgets.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AppInitializer());
}

class AppInitializer extends StatelessWidget {
  const AppInitializer({super.key});

  Future<void> initializeApp() async {
    // here all necessary initialization (Easy_localization, GetIt, FireBase)
    await Future.wait([
      EasyLocalization.ensureInitialized(),
      DIServiceLocator.instance.setupDependencies(),
      Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
    ]);
    await DIServiceLocator.instance.getIt<ThemeController>().loadSettings();
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
          // here connected RiverPod (which can be replaced by Provider)
          return const ProviderScope(child: LocalizationOfThisApp());
        } else {
          return StaticWidgets.loadingWidget;
        }
      },
    );
  }
}
