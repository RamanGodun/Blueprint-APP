import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../UI_layout/Components/Cashed_widgets/cashed_widgets.dart';
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

  static ThemeData? theme(BuildContext context) {
    final themeProvider = of(context);
    if (themeProvider != null) {
      return ThemeProviderHelper.getSelectedTheme(themeProvider.value);
    }
    return Theme.of(context);
  }

  static bool isDarkMode(BuildContext context) {
    return theme(context)!.brightness == Brightness.dark;
  }

  static ColorScheme colorScheme(BuildContext context) {
    return theme(context)!.colorScheme;
  }

  static TextTheme textTheme(BuildContext context) {
    return theme(context)!.textTheme;
  }

  static CupertinoThemeData cupertinoTheme(BuildContext context) {
    return CupertinoTheme.of(context);
  }

  static CupertinoTextThemeData cupertinoTextTheme(BuildContext context) {
    return cupertinoTheme(context).textTheme;
  }

  static Size deviceSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double deviceHeight(BuildContext context) {
    return deviceSize(context).height;
  }

  static double deviceWidth(BuildContext context) {
    return deviceSize(context).width;
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
    return FutureBuilder(
      future: themeProvider.loadSettings(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: AppCashedWidgets.loadingWidget);
        }

        return MyChangeNotifierProvider(
          notifier: themeProvider,
          child: widget.child,
        );
      },
    );
  }
}
