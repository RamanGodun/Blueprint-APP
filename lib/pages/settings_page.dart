import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../src/localization/gen by easy_localization/locale_keys.g.dart';
import '../theme/this_app_icons_icons.dart';
import '../widgets/icon_button_4_language_changing.dart';
import '../widgets/icons_dialog.dart';
import '../widgets/theme_drop_down_button.dart';

class SettingsPage extends StatefulWidget {
  static const routeName = '/settings';
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
              builder: (BuildContext context) => const CustomIconsDialog(),
            ),
          ),
        ],
      ),
      body: const Center(
        child: ThemeChangingButton(),
      ),
    );
  }
}
