// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../State_management/Services/google_signing_service.dart';
import '../../Widgets/Buttons/static_buttons.dart';
import '../../Widgets/Others/square_tile.dart';
import '../../Widgets/Static/static_widgets.dart';
import '../../Widgets/Text_fields.dart/textfield1.dart';
import '../../State_management/Src/Generated_code/by spider/resources.dart';

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

  @override
  void initState() {
    super.initState();
    if (!widget.isLoginPage) {
      passwordConfirmationController = TextEditingController();
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmationController?.dispose();
    super.dispose();
  }

  Future<void> googleSignIn() async {
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
          if (passwordConfirmationController != null &&
              passwordController.text == passwordConfirmationController!.text) {
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

  @override
  Widget build(BuildContext context) {
    return isLoading
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
                        widget.isLoginPage
                            ? 'Welcome back, you\'ve been missed!'
                            : 'Let\'s create an account',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontWeight: FontWeight.w600,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 25),
                      // email textfield
                      CustomTextFields.customTextField1(
                        context: context,
                        controller: emailController,
                        hintText: 'Email',
                        isObscureText: false,
                        icon: Icons.mail,
                      ),
                      // password textfield
                      CustomTextFields.customTextField1(
                        context: context,
                        controller: passwordController,
                        hintText: 'Password',
                        isObscureText: true,
                        icon: Icons.lock,
                      ),
                      if (!widget.isLoginPage &&
                          passwordConfirmationController != null)
                        CustomTextFields.customTextField1(
                          context: context,
                          controller: passwordConfirmationController!,
                          hintText: 'Confirm password',
                          isObscureText: true,
                          icon: Icons.lock_outline,
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
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ),
                      const SizedBox(height: 35),
                      // sign in/sign up button
                      StaticCustomButtons.customButton(
                        context,
                        buttonText: widget.isLoginPage ? 'Sign In' : 'Sign Up',
                        onPressed: () => signUserInOrUp(widget.isLoginPage),
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
                                    fontWeight: FontWeight.w500,
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
                            widget.isLoginPage
                                ? 'Not a member?'
                                : 'Already have an account?',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          const SizedBox(width: 4),
                          GestureDetector(
                            onTap: widget.changeAuthMode,
                            child: Text(
                              widget.isLoginPage
                                  ? 'Register now'
                                  : 'Log in now',
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