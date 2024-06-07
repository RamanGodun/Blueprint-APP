import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../State_management/Helpers/Common/helpers.dart';
import '../../Components/Buttons/_icon_buttons.dart';
import '../../Components/Buttons/_app_buttons.dart';
import '../../../State_management/Src/Generated_code/by easy_localization/locale_keys.g.dart';
import '../../Components/_Widgets_STYLING/_text_styles_for_components.dart';

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
    cupertinoTheme = Helpers.cupertinoTheme(context);
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
                style: AppTextStyles.appBarTitle(
                    cupertinoTheme: cupertinoTheme, colorScheme: colorScheme)),
            const Spacer(),
          ],
        ),
        trailing: AppIconButtons.toSettingsPageIconButton(context),
      ),
      child: Material(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 35),
            child: ListView(
              children: [
                const SizedBox(height: 20),
                AppCustomButtons.goToTextFieldPage(context,
                    colorScheme: colorScheme),
                const SizedBox(height: 20),
                AppCustomButtons.goToHivePage(context,
                    colorScheme: colorScheme),
                const SizedBox(height: 20),
                AppCustomButtons.goToGPTPage(context, colorScheme),
                const SizedBox(height: 20),
                AppCustomButtons.goToQuestionManager(context, colorScheme),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
