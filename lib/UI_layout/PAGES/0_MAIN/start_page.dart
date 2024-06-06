import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../State_management/Helpers/Common/helpers.dart';
import '../../Components/Buttons/static_buttons.dart';
import '../../../State_management/Src/Custom_icons/custom_icons_src.dart';
import '../../../State_management/Src/Generated_code/by easy_localization/locale_keys.g.dart';
import '../../Components/_Widgets_STYLING/0.text_styles_for_components.dart';

class StartPage extends StatefulWidget {
  static const routeName = '/start_page';
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  late CupertinoThemeData cupertinoTheme;
  late ColorScheme colorScheme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    cupertinoTheme = Helpers.cupertinoThemeData(context);
    colorScheme = Helpers.colorScheme(context);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Row(
          children: [
            const SizedBox(width: 50),
            Text(LocaleKeys.startScreen.tr(),
                style: TextStyle4Components.appBarTitle(
                    cupertinoTheme: cupertinoTheme, colorScheme: colorScheme)),
            const Spacer(),
          ],
        ),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child:
              Icon(ThisAppIcons.settings, color: cupertinoTheme.primaryColor),
          onPressed: () {
            context.pushNamed('SettingsPage');
          },
        ),
      ),
      child: Material(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 35),
            child: ListView(
              children: [
                const SizedBox(height: 20),
                StaticCustomButtons.customButton(
                  context,
                  onPressed: () {
                    context.pushNamed('TextFieldPage');
                  },
                  buttonText: LocaleKeys.goToTextfield.tr(),
                ),
                const SizedBox(height: 20),
                StaticCustomButtons.customButton(
                  context,
                  onPressed: () {
                    context.pushNamed('HiveBoxPage');
                  },
                  buttonText: LocaleKeys.goToHiveBox.tr(),
                ),
                const SizedBox(height: 20),
                StaticCustomButtons.customButton(
                  context,
                  onPressed: () {
                    context.pushNamed('SendPromptPage');
                  },
                  buttonText: "To Chat GPT prompts",
                ),
                const SizedBox(height: 20),
                StaticCustomButtons.customButton(
                  context,
                  onPressed: () {
                    context.pushNamed('QuestionHandler');
                  },
                  buttonText: "To Questions Manager",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
