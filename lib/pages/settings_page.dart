import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:get_it/get_it.dart';
import '../../src/generated code/by easy_localization/locale_keys.g.dart';
import '../../state_management/const_data/this_app_icons.dart';
import '../state_management/services/animation_controller.dart';
import '../widgets/buttons/static_buttons.dart';
import '../widgets/buttons/theme_changing_button.dart';
import '../widgets/dialogs/custom_dialog.dart';
import '../widgets/others/icons_grid_view.dart';

class SettingsPage extends StatefulWidget {
  static const routeName = '/start_page/settings';
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with TickerProviderStateMixin {
  User? user;
  late ColorScheme colorScheme;
  late TextTheme textTheme;
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
    textTheme = Theme.of(context).textTheme;
    colorScheme = Theme.of(context).colorScheme;
  }

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

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          LocaleKeys.startScreen.tr(),
          style: textTheme.titleMedium?.copyWith(color: colorScheme.onSurface),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            StaticCustomButtons.changeLanguageButton(context),
            CupertinoButton(
              padding: EdgeInsets.zero,
              child: Icon(
                ThisAppIcons.crown,
                color: colorScheme.onSurface,
                size: 25,
              ),
              onPressed: () => showCustomCupertinoDialog(
                context,
                IconsGridView(
                  colorScheme: colorScheme,
                ),
              ),
            ),
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () => signUserOut(),
              child: Icon(Icons.logout, color: colorScheme.onSurface, size: 25),
            ),
          ],
        ),
      ),
      child: Center(
        child: user == null
            ? Text(
                "User is not logged in",
                style: TextStyle(color: colorScheme.onSurface),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const ThemeChangingButton(),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: StaticCustomButtons.customButton2(
                      context,
                      onPressed: () {
                        context.pushNamed('ApiKeyInputPage');
                      },
                      buttonText: "To enter GPT API key",
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
