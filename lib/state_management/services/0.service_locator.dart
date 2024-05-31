import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../widgets/static/widgets_on_get_it.dart';
import '../models/model_4_hive.dart';
import 'animation_controller.dart';
import 'open_ai_service.dart';
import 'isar_service.dart';

class DIServiceLocator {
  DIServiceLocator._internal();
  static final DIServiceLocator _singleton = DIServiceLocator._internal();

  static DIServiceLocator get instance => _singleton;

  final GetIt _getIt = GetIt.instance;
  GetIt get getIt => _getIt;

  Future<void> setupDependencies() async {
    if (!_getIt.isRegistered<SharedPreferences>()) {
      final prefs = await SharedPreferences.getInstance();
      _getIt.registerSingleton<SharedPreferences>(prefs);
    }
    if (!_getIt.isRegistered<FlutterSecureStorage>()) {
      const secureStorage = FlutterSecureStorage();
      _getIt.registerSingleton<FlutterSecureStorage>(secureStorage);
    }

    if (!_getIt.isRegistered<OpenAiService>()) {
      _getIt.registerSingleton<OpenAiService>(OpenAiService());
    }

    if (!_getIt.isRegistered<StaticWidgetsOnGetIt>()) {
      getIt.registerSingleton<StaticWidgetsOnGetIt>(StaticWidgetsOnGetIt());
    }

    if (!_getIt.isRegistered<IsarService>()) {
      final isarService = IsarService();
      await isarService.initializeIsar();
      _getIt.registerSingleton<IsarService>(isarService);
    }

    if (!_getIt.isRegistered<Box<Person>>()) {
      final appDocumentDir = await getApplicationDocumentsDirectory();
      await Hive.initFlutter(appDocumentDir.path);
      Hive.registerAdapter(PersonAdapter());
      var personBox = await Hive.openBox<Person>('personBox');
      _getIt.registerSingleton<Box<Person>>(personBox);
    }

    if (!_getIt.isRegistered<AnimationService>()) {
      _getIt.registerSingleton<AnimationService>(AnimationService());
    }
  }

  T get<T extends Object>() {
    return _getIt.get<T>();
  }

  Box<Person> get personBox => _getIt.get<Box<Person>>();
}
