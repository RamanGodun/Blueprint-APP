// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../State_management/Helpers/Common/helpers.dart';
import '../../../State_management/Models/app_enums.dart';
import '../../../State_management/Services/auth_service.dart';
import '../../Components/Buttons/app_buttons.dart';
import '../../Components/Cards_and_tiles/sign_in_tile.dart';
import '../../Components/Images/image_widgets.dart';
import '../../Components/Mini_widgets/dividers.dart';
import '../../Components/Switchers/auth_mode_switcher.dart';
import '../../Components/Cashed_widgets/cashed_widgets.dart';
import '../../Components/Text_fields/text_form.dart';
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
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  TextEditingController? passwordConfirmationController;
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode? passwordConfirmationFocusNode;
  bool isLoading = false;
  late ThemeData theme;
  late ColorScheme colorScheme;
  late TextTheme textTheme;
  late Size deviceSize;

  @override
  void initState() {
    super.initState();
    if (!widget.isLoginPage) {
      passwordConfirmationController = TextEditingController();
      passwordConfirmationFocusNode = FocusNode();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    deviceSize = Helpers.deviceSizeGet(context);
    theme = Helpers.themeGet(context);
    colorScheme = theme.colorScheme;
    textTheme = theme.textTheme;
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? AppCashedWidgets.loadingWidget
        : CupertinoPageScaffold(
            backgroundColor: colorScheme.surface,
            child: Material(
              // color: AppColors.transparent,
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Form(
                    // Використовуємо Form
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(height: 50),
                        AppImages.appLogoWidget(deviceSize, colorScheme),
                        const SizedBox(height: 50),
                        AppTextWidgets.greetingsText(theme, widget.isLoginPage),
                        const SizedBox(height: 25),
                        AppTextFormField(
                          controller: emailController,
                          focusNode: emailFocusNode,
                          theme: theme,
                          hintText: 'Email',
                          // labelText: "enter email",
                          icon: Icons.mail,
                          validatorType: ValidatorType.email,
                        ),
                        AppTextFormField(
                          controller: passwordController,
                          focusNode: passwordFocusNode,
                          theme: theme,
                          hintText: 'Password',
                          // labelText: "enter password",
                          isObscureText: true,
                          icon: Icons.lock,
                          validatorType: ValidatorType.double,
                        ),
                        if (!widget.isLoginPage &&
                            passwordConfirmationController != null)
                          AppTextFormField(
                            controller: passwordConfirmationController!,
                            focusNode: passwordConfirmationFocusNode!,
                            theme: theme,
                            hintText: 'Confirm password',
                            // labelText: "confirm email",
                            isObscureText: true,
                            icon: Icons.lock_outline,
                            validatorType: ValidatorType.integer,
                          ),
                        if (widget.isLoginPage)
                          const ForgotPasswordTextWidget(),
                        const SizedBox(height: 45),
                        AppButtons.signInUp(context,
                            isLoginPage: widget.isLoginPage,
                            onPressed: () =>
                                _signUserInOrUp(widget.isLoginPage)),
                        const SizedBox(height: 50),
                        AppDividers.dividerForSignPage(theme),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SignInTile(
                                  onTap: _googleSignIn,
                                  logInType: LogInType.googleSignIn),
                              const SizedBox(width: 25),
                              SignInTile(
                                  onTap: () {},
                                  logInType: LogInType.appleSignIn),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 45.0, bottom: 20),
                          child: AuthModeSwitcher(
                              isLoginPage: widget.isLoginPage,
                              changeAuthMode: widget.changeAuthMode),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
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
    if (_formKey.currentState!.validate()) {
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
                passwordController.text ==
                    passwordConfirmationController!.text) {
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

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmationController?.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    passwordConfirmationFocusNode?.dispose();
    super.dispose();
  }
/* */
}
