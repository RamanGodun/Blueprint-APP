import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../src/generated code/by easy_localization/locale_keys.g.dart';
import '../state_management/const_data/this_app_icons.dart';
import '../widgets/static/buttons/static_buttons.dart';
import '../widgets/static/text_widgets.dart';

class StartPage extends StatefulWidget {
  static const routeName = '/start_page';
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  late TextTheme textTheme;
  late ColorScheme colorScheme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    textTheme = Theme.of(context).textTheme;
    colorScheme = Theme.of(context).colorScheme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StaticTextWidgets.themedText(
          context,
          LocaleKeys.startScreen.tr(),
          color: colorScheme.onPrimary,
          fontSize: 20,
        ),
        actions: [
          IconButton(
            icon: Icon(ThisAppIcons.settings, color: colorScheme.onPrimary),
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
            StaticTextWidgets.themedText(
              context,
              LocaleKeys.thisIsStartScreen.tr(),
              color: colorScheme.inverseSurface,
            ),
            StaticCustomButtons.customButton(
              context,
              onPressed: () {
                context.pushNamed('TextFieldPage');
              },
              buttonText: LocaleKeys.goToTextfield.tr(),
            ),
            const SizedBox(height: 50),
            StaticCustomButtons.customButton(
              context,
              onPressed: () {
                context.pushNamed('HiveBoxPage');
              },
              buttonText: LocaleKeys.goToHiveBox.tr(),
            ),
            const SizedBox(height: 50),
            StaticCustomButtons.customButton(
              context,
              onPressed: () {
                context.pushNamed('SendPromptPage');
              },
              buttonText: "To Chat GPT prompts",
            ),
          ],
        ),
      ),
    );
  }
}
