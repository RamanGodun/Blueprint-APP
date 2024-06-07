import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Components/Static/cashed_widgets.dart';
import '../0_MAIN/start_page.dart';
import 'login_or_register_page.dart';

class AuthHandler extends StatefulWidget {
  static const routeName = '/';
  const AuthHandler({super.key});

  @override
  State<AuthHandler> createState() => _AuthHandlerState();
}

class _AuthHandlerState extends State<AuthHandler> {
  bool showLoginPage = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return AppCashedWidgets.loadingWidget;
          }

          if (snapshot.hasData) {
            return const StartPage();
          }

          return LoginOrRegisterPage(
            changeAuthMode: toggleLoginOrRegisterPageMode,
            isLoginPage: showLoginPage,
          );
        },
      ),
    );
  }

  void toggleLoginOrRegisterPageMode() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }
}
