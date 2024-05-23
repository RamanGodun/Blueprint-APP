import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../theme configuration/theme_controller.dart';
import 'theme_service.dart';
import 'isar_service.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupOfGetItDependencies() async {
  // Ініціалізація та реєстрація FlutterSecureStorage та SharedPreferences
  const secureStorage = FlutterSecureStorage();
  getIt.registerSingleton<FlutterSecureStorage>(secureStorage);
  final sharedPrefs = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPrefs);

  // Реєстрація ThemeService та ThemeController
  getIt.registerSingleton<ThemeService>(ThemeService());
  getIt.registerSingleton<ThemeController>(
      ThemeController(getIt<ThemeService>()));

  // Ініціалізація та реєстрація IsarService
  final isarService = IsarService();
  await isarService.initializeIsar();
  getIt.registerSingleton<IsarService>(isarService);
}
