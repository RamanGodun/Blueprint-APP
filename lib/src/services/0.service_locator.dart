import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import '../../state_management/models/model_4_hive.dart';
import '../../theme_configuration/theme_controller.dart';
import 'open_ai_service.dart';
import 'theme_service.dart';
import 'isar_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DIServiceLocator {
  DIServiceLocator._internal();
  static final DIServiceLocator _singleton = DIServiceLocator._internal();

  // Публічний гетер для отримання екземпляру
  static DIServiceLocator get instance => _singleton;

  final GetIt _getIt = GetIt.instance;
  GetIt get getIt => _getIt;

  Future<void> setupDependencies() async {
    // Реєстрація SharedPreferences & FlutterSecureStorage
    if (!_getIt.isRegistered<FlutterSecureStorage>()) {
      const secureStorage = FlutterSecureStorage();
      _getIt.registerSingleton<FlutterSecureStorage>(secureStorage);
    }

    if (!_getIt.isRegistered<SharedPreferences>()) {
      final sharedPrefs = await SharedPreferences.getInstance();
      _getIt.registerSingleton<SharedPreferences>(sharedPrefs);
    }

    // Реєстрація OpenAiService
    if (!_getIt.isRegistered<OpenAiService>()) {
      _getIt.registerSingleton<OpenAiService>(OpenAiService());
    }

    // Реєстрація ThemeService та ThemeController
    if (!_getIt.isRegistered<ThemeService>()) {
      _getIt.registerSingleton<ThemeService>(ThemeService());
    }
    if (!_getIt.isRegistered<ThemeController>()) {
      _getIt.registerSingleton<ThemeController>(
        ThemeController(_getIt<ThemeService>()),
      );
    }

    // Реєстрація Isar
    if (!_getIt.isRegistered<IsarService>()) {
      final isarService = IsarService();
      await isarService.initializeIsar();
      _getIt.registerSingleton<IsarService>(isarService);
    }

    // Ініціалізація та реєстрація Hive
    if (!_getIt.isRegistered<Box<Person>>()) {
      final appDocumentDir = await getApplicationDocumentsDirectory();
      await Hive.initFlutter(appDocumentDir.path);
      Hive.registerAdapter(PersonAdapter());
      var personBox = await Hive.openBox<Person>('personBox');
      _getIt.registerSingleton<Box<Person>>(personBox);
    }
    //
  }

  // Гетер для доступу до Box<Person>
  Box<Person> get personBox => _getIt.get<Box<Person>>();
}
