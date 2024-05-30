import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import '../src/generated code/by easy_localization/locale_keys.g.dart';
import '../state_management/const_data/this_app_icons.dart';
import '../widgets/static/buttons/icon_button_4_language_changing.dart';
import '../widgets/static/buttons/static_buttons.dart';
import '../widgets/static/buttons/theme_changing_button.dart';
import '../widgets/static/dialogs/icons_dialog.dart';

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
                  StaticCustomButtons.customButton2(
                    context,
                    onPressed: () {
                      context.pushNamed('ApiKeyInputPage');
                    },
                    buttonText: "To enter GPT API key",
                  )
                ],
              ),
      ),
    );
  }
}
