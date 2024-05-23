import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import '../../state management/model_4_hive.dart';
import '../../theme configuration/theme_controller.dart';
import 'theme_service.dart';
import 'isar_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupOfGetItDependencies() async {
// SharedPreferences&FlutterSecureStorage registration
  const secureStorage = FlutterSecureStorage();
  getIt.registerSingleton<FlutterSecureStorage>(secureStorage);

  final sharedPrefs = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPrefs);

// theme service&controller registration
  getIt.registerSingleton<ThemeService>(ThemeService());
  getIt.registerSingleton<ThemeController>(
    ThemeController(getIt<ThemeService>()),
  );

// isar registration
  final isarService = IsarService();
  await isarService.initializeIsar();
  getIt.registerSingleton<IsarService>(isarService);

  // Registering Hive boxes
  final appDocumentDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDir.path);
  Hive.registerAdapter(PersonAdapter());
  var personBox = await Hive.openBox<Person>('personBox');
// nice feature "lazy box"
  getIt.registerSingleton<Box<Person>>(personBox);
}
