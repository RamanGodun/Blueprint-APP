import 'package:flutter/material.dart';

import '../../../UI_Components/Static/widgets_on_get_it.dart';
import '../../Src/Helpers/my_change_notifier_provider.dart';
import 'provider_of_theme.dart';

class InheritedThemeManager extends StatefulWidget {
  final Widget child;
  const InheritedThemeManager({required this.child, super.key});

  @override
  State<InheritedThemeManager> createState() => _InheritedThemeManagerState();

  static ThemeProvider? of(BuildContext context) {
    return MyChangeNotifierProvider.watch<ThemeProvider>(context);
  }
}

class _InheritedThemeManagerState extends State<InheritedThemeManager> {
  late ThemeProvider themeProvider;

  @override
  void initState() {
    super.initState();

    themeProvider = ThemeProvider.instance;
  }

  @override
  Widget build(BuildContext context) {
    final widgetManager = getIt<StaticWidgetsOnGetIt>();
    return FutureBuilder(
      future: themeProvider.loadSettings(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: widgetManager.loadingWidget);
        }

        return MyChangeNotifierProvider(
          notifier: themeProvider,
          child: widget.child,
        );
      },
    );
  }
}
