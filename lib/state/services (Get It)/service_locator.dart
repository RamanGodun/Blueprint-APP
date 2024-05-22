import 'package:get_it/get_it.dart';
import '../../theme/theme_controller.dart';
import '../../theme/theme_service.dart';

final GetIt getIt = GetIt.instance;

void setupOfGetItDependencies() {
  getIt.registerSingleton<ThemeService>(ThemeService());
  getIt.registerSingleton<ThemeController>(
    ThemeController(getIt<ThemeService>()),
  );
}
