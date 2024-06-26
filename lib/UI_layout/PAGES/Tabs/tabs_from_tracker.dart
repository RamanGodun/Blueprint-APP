import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../State_management/Src/Const_data/strings_4_app.dart';
import '../../../State_management/Src/Custom_icons/app_icons.dart';
import '../../../State_management/Helpers/Common/helpers.dart';
import '../../Components/Cashed_widgets/cashed_widgets.dart';
import '../0_MAIN/placeholder_screen.dart';

class MyAnimatedBottomNavigationBar extends StatefulWidget {
  const MyAnimatedBottomNavigationBar({super.key});

  @override
  State<MyAnimatedBottomNavigationBar> createState() =>
      _MyAnimatedBottomNavigationBarState();
}

class _MyAnimatedBottomNavigationBarState
    extends State<MyAnimatedBottomNavigationBar> {
  static final List<Widget> widgetPages = [
    const PlaceholderScreen(number: 1),
    const PlaceholderScreen(number: 2),
    const PlaceholderScreen(number: 3),
  ];
  int _currentIndex = 1;
  // bool _showAllExpenses = true;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Helpers.colorSchemeGet(context);
    final bool isDarkScheme = Helpers.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Text(AppStrings.appBarTitles[_currentIndex]),
          ],
        ),
        actions: [
          if (_currentIndex == 0)
            Padding(
                padding: const EdgeInsets.only(right: 20),
                child: IconButton(
                  icon: AppIcons.pieCharIcon(Helpers.isDarkMode(context)),
                  onPressed: () {
                    _showPieChartDialog(context);
                  },
                )),
          if (_currentIndex == 2)
            Padding(
                padding: const EdgeInsets.only(right: 20),
                child: IconButton(
                  icon: AppIcons.infoIcon(Helpers.isDarkMode(context)),
                  onPressed: () {
                    _showInfoDialog(context);
                  },
                )),
          if (_currentIndex == 1)
            IconButton(
              icon: const Icon(Icons.language),
              onPressed: () {
                context.locale == const Locale('en', 'US')
                    ? context.setLocale(const Locale('uk', 'UA'))
                    : context.setLocale(const Locale('en', 'US'));
              },
            ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Container(),
        ),
      ),

      body: widgetPages[_currentIndex],

      // next is bottomNavigation for all app
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(right: 55, left: 55, bottom: 8),
        // color: colorScheme.surface.withOpacity(isDarkScheme ? 0.5 : 0.87),
        child: GNav(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 19),
          textStyle: Theme.of(context).textTheme.displaySmall,
          color: colorScheme.primary,
          activeColor: colorScheme.primary,
          rippleColor:
              colorScheme.primary.withOpacity(isDarkScheme ? 0.06 : 0.03),
          tabBorderRadius: 20,
          gap: 5,
          iconSize: 23,
          selectedIndex: _currentIndex,
          onTabChange: (index) {
            if (_currentIndex != index) {
              setState(() {
                _currentIndex = index;
              });
            }
          },
          tabs: List.generate(
            AppIcons.icons.length,
            (index) => _buildGButton(
              AppIcons.icons[index],
              AppStrings.iconTitles[index],
              Theme.of(context),
              Helpers.isDarkMode(context)
                  ? AppCashedWidgets.border4DarkThemeGNavButton
                  : AppCashedWidgets.border4LightThemeGNavButtonConst,
              colorScheme,
            ),
          ),
        ),
      ),
    );
  }

  GButton _buildGButton(IconData icon, String text, ThemeData themeData,
      Border activeBorderStyle, ColorScheme colorScheme) {
    return GButton(
      padding: const EdgeInsets.only(left: 13, right: 13, top: 2, bottom: 11),
      duration: const Duration(milliseconds: 750),
      activeBorder: activeBorderStyle,
      iconActiveColor: themeData.focusColor.withOpacity(0.5),
      // iconColor: themeData.colorScheme.onSurface.withOpacity(0.2),
      icon: icon,
      text: text,
      textStyle: themeData.textTheme.titleSmall!.copyWith(
          color: colorScheme.secondary
              .withOpacity(Helpers.isDarkMode(context) ? 0.4 : 0.7)),
    );
  }

  void _showInfoDialog(BuildContext context) async {
    // showCupertinoModalPopup(
    //   context: context,
    //   builder: (context) {
    //     return StatefulBuilder(
    //       builder: (BuildContext context, StateSetter setState) {
    //         return InfoDialog().show(
    //           context,
    //           (bool newValue) {
    //             setState(() {
    //               //
    //             });
    //           },
    //         );
    //       },
    //     );
    //   },
    // );
  }

  void _showPieChartDialog(BuildContext context) async {
    // _loadPieChartCategoriesFromShPrefs();
    // final pieChartDialog = PieChartDialog();
    // showCupertinoModalPopup(
    //   context: context,
    //   builder: (context) {
    //     return StatefulBuilder(
    //       builder: (BuildContext context, StateSetter setState) {
    //         return pieChartDialog.build(
    //           context,
    //           _showAllExpenses,
    //           (bool newValue) {
    //             setState(() {
    //               _showAllExpenses = newValue;
    //               pieChartDialog.updateReorderableListKey();
    //             });
    //           },
    //         );
    //       },
    //     );
    //   },
    // );
  }

  // Future<void> _loadPieChartCategoriesFromShPrefs() async {
  //   await Provider.of<ItemsDataBase>(context, listen: false)
  //       .loadCategoriesFromShPrefs(false);
  //   setState(() {});
  // }

//
}
