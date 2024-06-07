import 'package:blueprint_4app/UI_layout/Components/Buttons/_icon_buttons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../State_management/Services/animation_controller_service.dart';
import '../../../State_management/Helpers/Common/helpers.dart';
import '../../Components/Buttons/_app_buttons.dart';
import '../../Components/Buttons/_dd_buttons.dart';
import '../../Components/Dialogs/custom_dialog.dart';
import '../../Components/Others/icons_grid_view.dart';
import '../../../State_management/Src/Generated_code/by easy_localization/locale_keys.g.dart';
import '../../Components/Text_widgets/text_widgets2.dart';

class SettingsPage extends StatefulWidget {
  static const routeName = '/start_page/settings';
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with TickerProviderStateMixin {
  User? user;
  late CupertinoThemeData cupertinoTheme;
  late ThemeData theme;
  late ColorScheme colorScheme;
  late TextTheme textTheme;
  late bool isDark;
  late AnimationService animationService;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    animationService = GetIt.instance<AnimationService>();
    animationService.init(this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    cupertinoTheme = Helpers.cupertinoTheme(context);
    theme = Helpers.theme(context);
    textTheme = Helpers.textTheme(context);
    colorScheme = Helpers.colorScheme(context);
    isDark = Helpers.isDarkTheme(context);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: AppIconButtons.backIcon(context, colorScheme: colorScheme),
        middle: Row(
          children: [
            TextWidgets.appBarTitle(context, LocaleKeys.startScreen.tr()),
            const Spacer(),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppIconButtons.changeLanguageButton(context),
            AppIconButtons.dialogIconButton(context,
                onPressed: () => showCustomCupertinoDialog(
                      context,
                      const IconsGridView(),
                    )),
            AppIconButtons.signOutButton(context,
                onPressed: () => signUserOut()),
          ],
        ),
      ),
      child: Material(
        child: Center(
          child: user == null
              ? Text(
                  "User is not logged in",
                  style: TextStyle(color: colorScheme.onSurface),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppDDButtons.forThemeChanging(
                      context,
                      theme: theme,
                      isDarkMode: isDark,
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: AppCustomButtons.goToGPTApiKeyPage(context,
                          colorScheme: colorScheme),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

/*
Methods next
 */
  @override
  void dispose() {
    animationService.dispose();
    super.dispose();
  }

  void signUserOut() async {
    await FirebaseAuth.instance.signOut();
    if (!mounted) return;
    user = null;
    context.pushNamed('AuthPage');
  }

  void showCustomCupertinoDialog(BuildContext context, Widget contentWidget) {
    animationService.controller.forward();
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CustomCupertinoDialog(
          contentWidget: contentWidget,
        );
      },
    ).then((_) {
      animationService.controller.reverse();
    });
  }
}
