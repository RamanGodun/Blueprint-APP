import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../src/localization/gen by easy_localization/locale_keys.g.dart';
import '../theme configuration/this_app_icons_icons.dart';

class StartPage extends StatefulWidget {
  static const routeName = '/start_page';
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.startScreen.tr(),
        ),
        actions: [
          IconButton(
            icon: const Icon(ThisAppIcons.settings),
            onPressed: () {
              context.pushNamed('SettingsPage');
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(LocaleKeys.thisIsStartScreen.tr()),
            ElevatedButton(
              onPressed: () {
                context.pushNamed('TextFieldPage');
              },
              child: Text(
                LocaleKeys.goToTextfield.tr(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                context.pushNamed('HiveBoxPage');
              },
              child: Text(
                LocaleKeys.goToHiveBox.tr(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                context.pushNamed('SendPromptPage');
              },
              child: Text(
                "To Chat GPT prompts",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
