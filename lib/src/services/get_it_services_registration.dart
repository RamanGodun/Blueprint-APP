import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../state management/model_4_hive.dart';
import '../../theme configuration/theme_controller.dart';
import 'isar_service.dart';
import 'theme_service.dart';

class DependencyInitializer {
  static final DependencyInitializer _singleton =
      DependencyInitializer._internal();
  DependencyInitializer._internal();

  static DependencyInitializer get instance => _singleton;

  final GetIt _getIt = GetIt.instance;
  GetIt get getIt => _getIt;

  Future<void> setupDependencies() async {
    // SharedPreferences & FlutterSecureStorage registration
    const secureStorage = FlutterSecureStorage();
    _getIt.registerSingleton<FlutterSecureStorage>(secureStorage);

    final sharedPrefs = await SharedPreferences.getInstance();
    _getIt.registerSingleton<SharedPreferences>(sharedPrefs);

    // Theme service & controller registration
    _getIt.registerSingleton<ThemeService>(ThemeService());
    _getIt.registerSingleton<ThemeController>(
      ThemeController(_getIt<ThemeService>()),
    );

    // Isar registration
    final isarService = IsarService();
    await isarService.initializeIsar();
    _getIt.registerSingleton<IsarService>(isarService);

    // Registering Hive
    final appDocumentDir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(appDocumentDir.path);
    Hive.registerAdapter(PersonAdapter());
    var personBox = await Hive.openBox<Person>('personBox');
    _getIt.registerSingleton<Box<Person>>(personBox);
  }

  Box<Person> get personBox => _getIt.get<Box<Person>>();
}
