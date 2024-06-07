import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../UI_layout/Components/Static/Cashed_widgets_alt/cashed_on_get_it.dart';
import '../../Helpers/Common/my_change_notifier_provider.dart';
import 'provider_of_theme.dart';
import 'theme_provider_helper.dart';

class InheritedThemeManager extends StatefulWidget {
  final Widget child;
  const InheritedThemeManager({required this.child, super.key});

  @override
  State<InheritedThemeManager> createState() => _InheritedThemeManagerState();

  static ThemeProvider? of(BuildContext context) {
    return MyChangeNotifierProvider.watch<ThemeProvider>(context);
  }

  static ColorScheme? colorScheme(BuildContext context) {
    final themeProvider = of(context);
    if (themeProvider != null) {
      return ThemeProviderHelper.getSelectedTheme(themeProvider.value)
          ?.colorScheme;
    }
    return Theme.of(context).colorScheme;
  }

  static ThemeData? theme(BuildContext context) {
    final themeProvider = of(context);
    if (themeProvider != null) {
      return ThemeProviderHelper.getSelectedTheme(themeProvider.value);
    }
    return Theme.of(context);
  }

  static TextTheme textTheme(BuildContext context) {
    return theme(context)!.textTheme;
  }

  static bool isDarkMode(BuildContext context) {
    return theme(context)!.brightness == Brightness.dark;
  }

  static CupertinoThemeData cupertinoTheme(BuildContext context) {
    return CupertinoTheme.of(context);
  }

  static CupertinoTextThemeData cupertinoTextTheme(BuildContext context) {
    return CupertinoTheme.of(context).textTheme;
  }

  static double deviceHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double deviceWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
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
