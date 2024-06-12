// ignore_for_file: use_build_context_synchronously, avoid_print
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../State_management/Services/auth_service.dart';
import '../../../State_management/Helpers/Common/helpers.dart';
import '../../../State_management/Theme_configuration/app_colors.dart';
import '../../Components/Buttons/app_buttons.dart';
import '../../Components/Cards_and_tiles/sign_in_tile.dart';
import '../../Components/Mini_widgets/dividers.dart';
import '../../Components/Switchers/auth_mode_switcher.dart';
import '../../Components/Text_fields/app_text_fields.dart';
import '../../Components/Cashed_widgets/cashed_widgets.dart';
import '../../../State_management/Src/Generated_code/by spider/resources.dart';

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
            child: SafeArea(
              child: Material(
                child: Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 50),
                        // logo
                        Image.asset(
                          ThisAppImages.flutterLogo,
                          color: colorScheme.primary,
                          height: 70,
                        ),
                        const SizedBox(height: 50),
                        // welcome text
                        Text(
                          widget.isLoginPage
                              ? 'Welcome back, you\'ve been missed!'
                              : 'Let\'s create an account',
                          style: textTheme.titleMedium?.copyWith(
                            color: colorScheme.onSurface,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 25),
                        // email textfield
                        AppTextField(
                          theme: theme,
                          controller: emailController,
                          hintText: 'Email',
                          validateInput: () => validateInput(emailController),
                          isValid: isValid,
                          icon: Icons.mail,
                          isInCupertinoStyle: false,
                        ),
                        if (!isValid.value)
                          const Text(
                            'This field cannot be empty',
                            style: TextStyle(
                              color: AppColors.kErrorColor,
                              fontSize: 12,
                            ),
                          ),
                        // password textfield
                        AppTextField(
                          theme: theme,
                          controller: passwordController,
                          hintText: 'Password',
                          validateInput: () =>
                              validateInput(passwordController),
                          isValid: isValid,
                          icon: Icons.lock,
                          isInCupertinoStyle: false,
                          isObscureText: true,
                        ),
                        if (!widget.isLoginPage &&
                            passwordConfirmationController != null)
                          AppTextField(
                            theme: theme,
                            controller: passwordConfirmationController!,
                            hintText: 'Confirm password',
                            validateInput: () =>
                                validateInput(passwordConfirmationController!),
                            isValid: isValid,
                            icon: Icons.lock_outline,
                            isInCupertinoStyle: false,
                            isObscureText: true,
                          ),
                        if (widget.isLoginPage)
                          Align(
                            alignment: Alignment.topRight,
                            child: TextButton(
                              onPressed: () {
                                // Forgot password logic
                              },
                              child: Text(
                                'Forgot Password?',
                                style: textTheme.bodyMedium?.copyWith(
                                  color: colorScheme.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        const SizedBox(height: 35),
                        // sign in/sign up button
                        AppCustomButtons.signInUp(
                          context,
                          isLoginPage: widget.isLoginPage,
                          onPressed: () => _signUserInOrUp(widget.isLoginPage),
                        ),
                        const SizedBox(height: 50),
                        AppDividers.dividerForSignPage(theme),
                        const SizedBox(height: 20),
                        // google + apple sign in buttons
                        Row(
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
                        const SizedBox(height: 50),
                        AuthModeSwitcher(
                          isLoginPage: widget.isLoginPage,
                          changeAuthMode: widget.changeAuthMode,
                        ),
                      ],
                    ),
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

  void validateInput(TextEditingController controller) {
    isValid.value = controller.text.isNotEmpty;
  }

  Future<void> _googleSignIn() async {
    setState(() {
      isLoading = true;
    });
    try {
      final AuthService authService = AuthService();
      await authService.signInWithGoogle();
    } catch (error) {
      print(error);
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
      print(e);
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
