import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../State_management/Src/Helpers/helpers.dart';
import '../Widgets/Buttons/static_buttons.dart';
import '../State_management/Src/Custom_icons/this_app_icons.dart';
import '../State_management/Src/Generated_code/by easy_localization/locale_keys.g.dart';

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
        middle: Padding(
          padding: const EdgeInsets.only(right: 127.0),
          child: Text(
            LocaleKeys.startScreen.tr(),
            style: cupertinoTheme.textTheme.navTitleTextStyle
                .copyWith(color: colorScheme.onSurface),
          ),
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
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            ],
          ),
        ),
      ),
    );
  }
}
