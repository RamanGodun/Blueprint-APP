import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import '../../state management/model_4_hive.dart';
import '../../theme configuration/theme_controller.dart';
import 'theme_service.dart';
import 'isar_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DIServiceLocator {
  DIServiceLocator._internal();
  static final DIServiceLocator _singleton = DIServiceLocator._internal();

  // Публічний гетер для отримання екземпляру
  static DIServiceLocator get instance => _singleton;

  final GetIt _getIt = GetIt.instance;
  GetIt get getIt => _getIt;

  Future<void> setupDependencies() async {
    // Реєстрація SharedPreferences & FlutterSecureStorage
    const secureStorage = FlutterSecureStorage();
    _getIt.registerSingleton<FlutterSecureStorage>(secureStorage);

    final sharedPrefs = await SharedPreferences.getInstance();
    _getIt.registerSingleton<SharedPreferences>(sharedPrefs);

    // Реєстрація ThemeService та ThemeController
    _getIt.registerSingleton<ThemeService>(ThemeService());
    _getIt.registerSingleton<ThemeController>(
      ThemeController(_getIt<ThemeService>()),
    );

    // Реєстрація Isar
    final isarService = IsarService();
    await isarService.initializeIsar();
    _getIt.registerSingleton<IsarService>(isarService);

    // Ініціалізація та реєстрація Hive
    final appDocumentDir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(appDocumentDir.path);
    Hive.registerAdapter(PersonAdapter());
    var personBox = await Hive.openBox<Person>('personBox');
    _getIt.registerSingleton<Box<Person>>(personBox);
  }

  // Гетер для доступу до Box<Person>
  Box<Person> get personBox => _getIt.get<Box<Person>>();
}
