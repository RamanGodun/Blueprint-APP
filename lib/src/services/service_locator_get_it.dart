import 'package:get_it/get_it.dart';
import '../../theme configuration/theme_controller.dart';
import '../../theme configuration/theme_service.dart';
import 'isar_service.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupOfGetItDependencies() async {
  // Реєстрація ThemeService та ThemeController
  getIt.registerSingleton<ThemeService>(ThemeService());
  getIt.registerSingleton<ThemeController>(
    ThemeController(getIt<ThemeService>()),
  );

  // Ініціалізація та реєстрація IsarService
  final isarService = IsarService();
  await isarService.initializeIsar();
  getIt.registerSingleton<IsarService>(isarService);
}
