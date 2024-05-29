// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/cupertino.dart';
import '../../src/generated code/by spider/resources.dart';
import '../../src/services/google_signing_service.dart';
import '../../widgets/buttons/my_button.dart';
import '../../widgets/text_fields.dart/custom_textfield.dart';
import '../../widgets/square_tile.dart';
import '../../widgets/static/static_widgets.dart';

class LoginOrRegisterPage extends HookWidget {
  final Function() changeAuthMode;
  final bool isLoginPage;

  const LoginOrRegisterPage({
    super.key,
    required this.changeAuthMode,
    required this.isLoginPage,
  });

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final passwordConfirmationController =
        useState<TextEditingController?>(null);
    final isLoading = useState(false);

    useEffect(() {
      if (!isLoginPage) {
        passwordConfirmationController.value = TextEditingController();
      } else {
        passwordConfirmationController.value?.dispose();
        passwordConfirmationController.value = null;
      }
      return () => passwordConfirmationController.value?.dispose();
    }, [isLoginPage]);

    Future<void> googleSignIn() async {
      isLoading.value = true;
      try {
        final AuthService authService = AuthService();
        await authService.signInWithGoogle();
      } catch (error) {
        print(error);
      }
      isLoading.value = false;
    }

    void wrongEmailOrPasswordMessage(BuildContext context, String message) {
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

    Future<void> signUserInOrUp(bool isLoginPage) async {
      showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        },
      );
      try {
        if (emailController.text.isNotEmpty &&
            passwordController.text.isNotEmpty) {
          if (isLoginPage) {
            await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: emailController.text,
              password: passwordController.text,
            );
          } else {
            if (passwordConfirmationController.value != null &&
                passwordController.text ==
                    passwordConfirmationController.value!.text) {
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: emailController.text,
                password: passwordController.text,
              );
            } else {
              Navigator.pop(context);
              return wrongEmailOrPasswordMessage(
                  context, 'Passwords don\'t match');
            }
          }
        }
        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        if (e.code == 'user-not-found') {
          wrongEmailOrPasswordMessage(context, 'Incorrect Email');
        } else if (e.code == 'wrong-password') {
          wrongEmailOrPasswordMessage(context, 'Incorrect Password');
        }
      }
    }

    return isLoading.value
        ? StaticWidgets.loadingWidget
        : Scaffold(
            backgroundColor: Theme.of(context).colorScheme.surface,
            body: SafeArea(
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
                        color: Theme.of(context).colorScheme.primary,
                        height: 70,
                      ),
                      const SizedBox(height: 50),
                      // welcome text
                      Text(
                        isLoginPage
                            ? 'Welcome back, you\'ve been missed!'
                            : 'Let\'s create an account',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 25),
                      // email textfield
                      MyTextField(
                        controller: emailController,
                        hintText: 'Email',
                        isObscureText: false,
                        icon: Icons.mail,
                      ),
                      // password textfield
                      MyTextField(
                        controller: passwordController,
                        hintText: 'Password',
                        isObscureText: true,
                        icon: Icons.lock,
                      ),
                      if (!isLoginPage &&
                          passwordConfirmationController.value != null)
                        MyTextField(
                          controller: passwordConfirmationController.value!,
                          hintText: 'Confirm password',
                          isObscureText: true,
                          icon: Icons.lock_outline,
                        ),
                      if (isLoginPage)
                        Align(
                          alignment: Alignment.topRight,
                          child: TextButton(
                            onPressed: () {
                              // Forgot password logic
                            },
                            child: Text(
                              'Forgot Password?',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                            ),
                          ),
                        ),
                      const SizedBox(height: 35),
                      // sign in/sign up button
                      MyButton(
                        buttonText: isLoginPage ? 'Sign In' : 'Sign Up',
                        onTap: () => signUserInOrUp(isLoginPage),
                      ),
                      const SizedBox(height: 50),
                      // or continue with
                      Row(
                        children: <Widget>[
                          const Expanded(child: Divider()),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "or continue with",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                  ),
                            ),
                          ),
                          const Expanded(child: Divider()),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // google + apple sign in buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SquareTile(
                            imagePath: ThisAppImages.google,
                            onTap: googleSignIn,
                          ),
                          const SizedBox(width: 25),
                          SquareTile(
                            imagePath: ThisAppImages.apple,
                            onTap: () {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                      // not a member? register now
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            isLoginPage
                                ? 'Not a member?'
                                : 'Already have an account?',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                ),
                          ),
                          const SizedBox(width: 4),
                          GestureDetector(
                            onTap: changeAuthMode,
                            child: Text(
                              isLoginPage ? 'Register now' : 'Log in now',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
