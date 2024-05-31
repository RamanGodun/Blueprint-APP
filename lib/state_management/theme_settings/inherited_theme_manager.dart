import 'package:flutter/material.dart';
import '../../widgets/static/widgets_on_get_it.dart';
import 'theme_provider.dart';

class InheritedThemeManager extends StatefulWidget {
  final Widget child;
  const InheritedThemeManager({required this.child, super.key});

  @override
  State<InheritedThemeManager> createState() => _InheritedThemeManagerState();

  static ThemeProvider? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_InheritedNotifier>()!
        .notifier;
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

        return _InheritedNotifier(
          notifier: themeProvider,
          child: widget.child,
        );
      },
    );
  }
}

class _InheritedNotifier extends InheritedNotifier<ThemeProvider> {
  const _InheritedNotifier({
    required ThemeProvider super.notifier,
    required super.child,
  });
}
