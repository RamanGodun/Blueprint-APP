// ignore_for_file: use_build_context_synchronously
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../src/images src gen by spider/resources.dart';
import '../../theme configuration/app_colorscheme.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_textfield.dart';
import '../../widgets/square_tile.dart';
import '../../widgets/static/static_widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              // logo
              Image.asset(
                ThisAppImages.flutterLogo,
                height: 70,
              ),
              const SizedBox(height: 50),

              StaticWidgets.text4LoginPageWidget(
                context,
                'Welcome back you\'ve been missed!',
                color: ThisAppColors.grey700,
              ),
              const SizedBox(height: 25),

              // email textfield
              MyTextField(
                controller: emailController,
                hintText: 'Email',
                isObscureText: false,
              ),

              const SizedBox(height: 10),

              // password textfield
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                isObscureText: true,
              ),

              const SizedBox(height: 10),

              // forgot password?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    StaticWidgets.text4LoginPageWidget(
                      context,
                      'Forgot Password?',
                      color: Colors.grey[600],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // sign in button
              MyButton(onTap: signUserIn),
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
                    'Not a member?',
                    color: ThisAppColors.grey700,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Register now',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

// sign user in method
  void signUserIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
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
          backgroundColor: Colors.greenAccent,
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
}
