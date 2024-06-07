import 'package:blueprint_4app/State_management/Services/isar_service.dart';
import 'package:blueprint_4app/State_management/Services/open_ai_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../UI_layout/Components/Static/Cashed_widgets_alt/cashed_on_get_it.dart';
import '../Models/models_4_FI_on_hive/model_4_hive.dart' as model_hive;
import '../Models/models_4_FI_on_hive/model_4fi_on_hive.dart'
    as question_model_hive;
import 'animation_controller_service.dart';

class DIServiceLocator {
  DIServiceLocator._internal();
  static final DIServiceLocator _singleton = DIServiceLocator._internal();

  static DIServiceLocator get instance => _singleton;

  final GetIt _getIt = GetIt.instance;
  GetIt get getIt => _getIt;

  Future<void> setupDependencies() async {
    await _setupSharedPreferences();
    _setupSecureStorage();
    _setupOpenAiService();
    _setupStaticWidgets();
    await _setupIsarService();
    await _setupHiveBox();
    _setupAnimationService();
    // _setupThemeService();
  }

  Future<void> _setupSharedPreferences() async {
    if (!_getIt.isRegistered<SharedPreferences>()) {
      final prefs = await SharedPreferences.getInstance();
      _getIt.registerSingleton<SharedPreferences>(prefs);
    }
  }

  void _setupSecureStorage() {
    if (!_getIt.isRegistered<FlutterSecureStorage>()) {
      const secureStorage = FlutterSecureStorage();
      _getIt.registerSingleton<FlutterSecureStorage>(secureStorage);
    }
  }

  void _setupOpenAiService() {
    if (!_getIt.isRegistered<OpenAiService>()) {
      _getIt.registerSingleton<OpenAiService>(OpenAiService());
    }
  }

  void _setupStaticWidgets() {
    if (!_getIt.isRegistered<StaticWidgetsOnGetIt>()) {
      getIt.registerSingleton<StaticWidgetsOnGetIt>(StaticWidgetsOnGetIt());
    }
  }

  Future<void> _setupIsarService() async {
    if (!_getIt.isRegistered<IsarService>()) {
      final isarService = IsarService();
      await isarService.initializeIsar();
      _getIt.registerSingleton<IsarService>(isarService);
    }
  }

  Future<void> _setupHiveBox() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(appDocumentDir.path);

    if (!_getIt.isRegistered<Box<model_hive.Person>>()) {
      Hive.registerAdapter(model_hive.PersonAdapter());
      var personBox = await Hive.openBox<model_hive.Person>('personBox');
      _getIt.registerSingleton<Box<model_hive.Person>>(personBox);
    }

    if (!_getIt
        .isRegistered<Box<question_model_hive.QuestionAndAnswersModelHive>>()) {
      Hive.registerAdapter(
          question_model_hive.QuestionAndAnswersModelHiveAdapter());
      var questionBox =
          await Hive.openBox<question_model_hive.QuestionAndAnswersModelHive>(
              'questionBox');
      _getIt.registerSingleton<
          Box<question_model_hive.QuestionAndAnswersModelHive>>(questionBox);
    }
  }

  void _setupAnimationService() {
    if (!_getIt.isRegistered<AnimationService>()) {
      _getIt.registerSingleton<AnimationService>(AnimationService());
    }
  }

  T get<T extends Object>() {
    return _getIt.get<T>();
  }

  Box<model_hive.Person> get personBox => _getIt.get<Box<model_hive.Person>>();
  Box<question_model_hive.QuestionAndAnswersModelHive> get questionBox =>
      _getIt.get<Box<question_model_hive.QuestionAndAnswersModelHive>>();
}



/*
  Future<void> _setupThemeService() async {
    if (!_getIt.isRegistered<ThemeService>()) {
      _getIt.registerLazySingleton<ThemeService>(() => ThemeService());
    }
  }
 */