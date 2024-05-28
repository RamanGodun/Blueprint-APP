// ignore_for_file: use_build_context_synchronously
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../src/images src gen by spider/resources.dart';
import '../../theme configuration/app_colorscheme.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_textfield.dart';
import '../../widgets/square_tile.dart';
import '../../widgets/static/static_widgets.dart';

class LoginOrRegisterPage extends StatefulWidget {
  final Function() changeAuthMode;
  final bool isLoginPage;

  const LoginOrRegisterPage({
    Key? key,
    required this.changeAuthMode,
    required this.isLoginPage,
  }) : super(key: key);

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  //
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  TextEditingController? passwordConfirmationController;

  @override
  void didUpdateWidget(LoginOrRegisterPage oldWidget) {
    if (oldWidget.isLoginPage != widget.isLoginPage) {
      if (widget.isLoginPage) {
        // Якщо сторінка переходить на логін, очистіть passwordConfirmationController
        passwordConfirmationController?.clear();
        passwordConfirmationController = null;
      } else {
        // Якщо сторінка переходить на реєстрацію, створіть новий passwordConfirmationController
        passwordConfirmationController = TextEditingController();
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                // logo
                Image.asset(
                  ThisAppImages.flutterLogo,
                  color: Theme.of(context).colorScheme.inversePrimary,
                  height: 70,
                ),
                const SizedBox(height: 50),

                StaticWidgets.text4LoginPageWidget(
                  context,
                  (widget.isLoginPage == true)
                      ? 'Welcome back you\'ve been missed!'
                      : 'Let\'s create an account',
                  color: ThisAppColors.grey700,
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
                  icon: Icons.password,
                ),

                if (widget.isLoginPage == false &&
                    passwordConfirmationController != null)
                  MyTextField(
                    controller: passwordConfirmationController!,
                    hintText: 'Confirm password',
                    isObscureText: true,
                    icon: Icons.password_outlined,
                  ),

                // forgot password?
                if (widget.isLoginPage == true)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StaticWidgets.text4LoginPageWidget(
                          context,
                          'Forgot Password?',
                          color: Colors.grey[600],
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 35),

                // sign in button
                MyButton(
                  buttonText:
                      (widget.isLoginPage == true) ? 'Sign In' : 'Sign Up',
                  onTap: () => signUserInOrUp(widget.isLoginPage),
                ),
                const SizedBox(height: 50),

                // or continue with
                StaticWidgets.divider4LoginPage(),
                const SizedBox(height: 30),

                // google + apple sign in buttons
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // google button
                    SquareTile(imagePath: ThisAppImages.google),
                    SizedBox(width: 25),
                    // apple button
                    SquareTile(imagePath: ThisAppImages.apple)
                  ],
                ),
                const SizedBox(height: 50),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StaticWidgets.text4LoginPageWidget(
                      context,
                      (widget.isLoginPage == true)
                          ? 'Not a member?'
                          : 'Already have an account?',
                      color: ThisAppColors.grey700,
                    ),
                    const SizedBox(width: 4),
                    InkWell(
                      onTap: widget.changeAuthMode,
                      child: Text(
                        (widget.isLoginPage == true)
                            ? 'Register now'
                            : 'Log in now',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

// sign user in method
  void signUserInOrUp(bool isLoginPage) async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      isLoginPage
          ? await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: emailController.text,
              password: passwordController.text,
            )
          : (passwordConfirmationController != null &&
                  passwordController.text ==
                      passwordConfirmationController!.text)
              ? await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: emailController.text,
                  password: passwordController.text,
                )
              : wrongEmailOrPasswordMessage('Passwords don\'t match');
      // pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      // WRONG EMAIL
      if (e.code == 'user-not-found') {
        wrongEmailOrPasswordMessage('Incorrect Email');
      }
      // WRONG PASSWORD
      else if (e.code == 'wrong-password') {
        wrongEmailOrPasswordMessage('Incorrect Password');
      }
    }
  }

  // wrong email or password message popup
  void wrongEmailOrPasswordMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    emailController.clear();
    passwordController.clear();
    if (widget.isLoginPage == false) {
      passwordConfirmationController!.clear();
    }
    super.dispose();
  }
}
