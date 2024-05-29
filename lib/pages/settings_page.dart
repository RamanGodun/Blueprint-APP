import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../src/localization/gen by easy_localization/locale_keys.g.dart';
import '../theme configuration/this_app_icons_icons.dart';
import '../widgets/icon_button_4_language_changing.dart';
import '../widgets/icons_dialog.dart';
import '../widgets/theme_drop_down_button.dart';

class SettingsPage extends StatefulWidget {
  static const routeName = '/start_page/settings';
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  User? user;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
  }

  void signUserOut() async {
    await FirebaseAuth.instance.signOut();
    if (!mounted) return;
    user = null;
    context.pushNamed('AuthPage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.startScreen.tr()),
        actions: [
          LanguageToggleButton(onUpdate: () => setState(() {})),
          IconButton(
            icon: const Icon(ThisAppIcons.crown),
            onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) => const CustomIconsDialog()),
          ),
          IconButton(
            onPressed: signUserOut,
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: Center(
        child: user == null
            ? const Text("User is not logged in")
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const ThemeChangingButton(),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      context.pushNamed('ApiKeyInputPage');
                    },
                    child: Text(
                      "To enter GPT API key",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
