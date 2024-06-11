import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../State_management/Helpers/Common/helpers.dart';
import '../../Components/Buttons/icon_buttons.dart';
import '../../Components/Buttons/app_buttons.dart';
import '../../../State_management/Src/Generated_code/by easy_localization/locale_keys.g.dart';
import '../../Components/Text_widgets/text_widgets.dart';

class StartPage extends StatefulWidget {
  static const routeName = '/start_page';
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  late CupertinoThemeData cupertinoTheme;
  late ThemeData theme;
  late ColorScheme colorScheme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    cupertinoTheme = Helpers.cupertinoThemeGet(context);
    theme = Helpers.themeGet(context);
    colorScheme = theme.colorScheme;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Row(
          children: [
            const SizedBox(width: 50),
            AppTextWidgetsStyles.forAppBarTitle(context,
                theme: theme, text: LocaleKeys.startScreen.tr()),
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
                AppCustomButtons.goToTextFieldPage(context),
                const SizedBox(height: 20),
                AppCustomButtons.goToHivePage(context),
                const SizedBox(height: 20),
                AppCustomButtons.goToGPTPage(context),
                const SizedBox(height: 20),
                AppCustomButtons.goToQuestionManager(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
