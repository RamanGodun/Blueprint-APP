import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../widgets/static/static_widgets.dart';
import '../start_page.dart';
import 'login_or_register_page.dart';

class AuthPage extends StatefulWidget {
  static const routeName = '/';
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // Покажемо індикатор завантаження, поки немає відповіді
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: StaticWidgets.loadingWidget);
          }

          // user is logged in
          if (snapshot.hasData) {
            return const StartPage();
          }

          // user is NOT logged in
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
