/*


ти в ролі досвідченого високопрофесійного флаттер розробника , який пише максимально чистий та оптимізований код

ось код main мого додатку

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'setting_of_localization_and_providers.dart';
import 'State_management/Services/_service_locator.dart';
import 'State_management/Src/Generated_code/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await DIServiceLocator.instance.setupDependencies();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Helpers.init();
  runApp(const AppLocalization());
}


де код сервіс локатору наступний
import 'package:blueprint_4app/State_management/Services/isar_service.dart';
import 'package:blueprint_4app/State_management/Services/open_ai_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../UI_layout/Components/Cashed_widgets/cashed_on_get_it.dart';
import '../Models/models_4_FI_on_hive/model_4_hive.dart' as model_hive;
import '../Models/models_4_FI_on_hive/model_4fi_on_hive.dart'
    as question_model_hive;
import 'animation_controller_service.dart';
import 'text_validation_service.dart';

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
    _setupTextValidation();
    // _setupMappingHelperService();
    // _setupThemeService();
  }

/*TextFieldValidationService */

  void _setupTextValidation() {
    if (!_getIt.isRegistered<TextFieldValidationService>()) {
      _getIt.registerSingleton<TextFieldValidationService>(
          TextFieldValidationService());
    }
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
    if (!_getIt.isRegistered<AppCashedWidgets1>()) {
      getIt.registerSingleton<AppCashedWidgets1>(AppCashedWidgets1());
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


ось код сторінки
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../State_management/Models/app_enums.dart';
import '../../../State_management/Services/auth_service.dart';
import '../../../State_management/Helpers/Common/helpers.dart';
import '../../Components/Buttons/app_buttons.dart';
import '../../Components/Cards_and_tiles/sign_in_tile.dart';
import '../../Components/Images/image_widgets.dart';
import '../../Components/Mini_widgets/dividers.dart';
import '../../Components/Switchers/auth_mode_switcher.dart';
import '../../Components/Text_fields/app_text_fields.dart';
import '../../Components/Cashed_widgets/cashed_widgets.dart';
import '../../Components/Text_widgets/forgot_password.dart';
import '../../Components/Text_widgets/text_widgets.dart';

class LoginOrRegisterPage extends StatefulWidget {
  final Function() changeAuthMode;
  final bool isLoginPage;

  const LoginOrRegisterPage({
    super.key,
    required this.changeAuthMode,
    required this.isLoginPage,
  });

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  TextEditingController? passwordConfirmationController;
  bool isLoading = false;
  late ThemeData theme;
  late ColorScheme colorScheme;
  late TextTheme textTheme;
  late Size deviceSize;
  late ValueNotifier<bool> isValid;

  @override
  void initState() {
    super.initState();
    if (!widget.isLoginPage) {
      passwordConfirmationController = TextEditingController();
    }
    isValid = ValueNotifier(true);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    deviceSize = Helpers.deviceSizeGet(context);
    theme = Helpers.themeGet(context);
    textTheme = theme.textTheme;
    colorScheme = theme.colorScheme;
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? AppCashedWidgets.loadingWidget
        : CupertinoPageScaffold(
            backgroundColor: colorScheme.surface,
            child: Material(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 50),
                      AppImages.appLogoWidget(deviceSize, colorScheme),
                      const SizedBox(height: 50),
                      AppTextWidgets.greetingsText(theme, widget.isLoginPage),
                      const SizedBox(height: 25),
                      /* email textfield */
                      AppTextField(
                        theme: theme,
                        controller: emailController,
                        hintText: 'Email',
                        isValid: isValid,
                        icon: Icons.mail,
                        validatorType: ValidatorType.email,
                      ),
                      if (!isValid.value)
                        AppTextWidgets.textForNotValidText(theme),
                      /* password textfield */
                      AppTextField(
                        theme: theme,
                        controller: passwordController,
                        hintText: 'Password',
                        isValid: isValid,
                        icon: Icons.lock,
                        isObscureText: true,
                        validatorType: ValidatorType.double,
                      ),
                      if (!widget.isLoginPage &&
                          passwordConfirmationController != null)
                        AppTextField(
                          theme: theme,
                          controller: passwordConfirmationController!,
                          hintText: 'Confirm password',
                          isValid: isValid,
                          icon: Icons.lock_outline,
                          isObscureText: true,
                          validatorType: ValidatorType.integer,
                        ),
                      if (widget.isLoginPage) const ForgotPasswordTextWidget(),
                      const SizedBox(height: 45),
                      /* sign in/sign up button */
                      AppButtons.signInUp(
                        context,
                        isLoginPage: widget.isLoginPage,
                        onPressed: () => _signUserInOrUp(widget.isLoginPage),
                      ),
                      const SizedBox(height: 50),
                      AppDividers.dividerForSignPage(theme),
                      const SizedBox(height: 20),
                      /* google + apple sign in buttons */
                      SizedBox(
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SignInTile(
                              onTap: _googleSignIn,
                              logInType: LogInType.googleSignIn,
                            ),
                            const SizedBox(width: 25),
                            SignInTile(
                              onTap: () {},
                              logInType: LogInType.appleSignIn,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 45.0, bottom: 20),
                        child: AuthModeSwitcher(
                          isLoginPage: widget.isLoginPage,
                          changeAuthMode: widget.changeAuthMode,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmationController?.dispose();
    super.dispose();
  }

  Future<void> _googleSignIn() async {
    setState(() {
      isLoading = true;
    });
    try {
      final AuthService authService = AuthService();
      await authService.signInWithGoogle();
    } catch (error) {
      //
    }
    setState(() {
      isLoading = false;
    });
  }

  Future<void> _signUserInOrUp(bool isLoginPage) async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: AppCashedWidgets.loadingWidget);
      },
    );
    try {
      if (emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty) {
        final AuthService authService = AuthService();
        if (isLoginPage) {
          await authService.signInWithEmailAndPassword(
            emailController.text,
            passwordController.text,
          );
        } else {
          if (passwordConfirmationController != null &&
              passwordController.text == passwordConfirmationController!.text) {
            await authService.createUserWithEmailAndPassword(
              emailController.text,
              passwordController.text,
            );
          } else {
            Navigator.pop(context);
            return _wrongEmailOrPasswordMessage(
                context, 'Passwords don\'t match');
          }
        }
      }
      Navigator.pop(context);
    } catch (e) {
      Navigator.pop(context);
    }
  }

  void _wrongEmailOrPasswordMessage(BuildContext context, String message) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            CupertinoDialogAction(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}


напиши сервіс, який викликатиме діалоги і щоб, наприклад,  в результаті у файлі коду сторінки  залишався лиш назва  та аргументи методу виклику діалогу з цього сервісу  (тобто я викликав відповідний метод цього сервісу, передаючи в якості аргументу контекст та String message)  

для цього методу зроби це
  void _wrongEmailOrPasswordMessage(BuildContext context, String message) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            CupertinoDialogAction(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

 */