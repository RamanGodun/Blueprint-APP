import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../../Theme_configuration/Themes_provider/manager_of_themes.dart';
import '../../Src/Const_data/strings_4_app.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class Helpers {
  /*
  Here some useful methods, used across all app
  */
  /// Get the current theme data.
  static ThemeData theme(BuildContext context) {
    return InheritedThemeManager.theme(context)!;
  }

  /// Get the color scheme from the current theme.
  static ColorScheme colorScheme(BuildContext context) {
    return theme(context).colorScheme;
  }

  /// Get the text theme from the current theme.
  static TextTheme textTheme(BuildContext context) {
    return theme(context).textTheme;
  }

  /// Determine if the current theme is dark mode.
  static bool isDarkTheme(BuildContext context) {
    return theme(context).brightness == Brightness.dark;
  }

  /// Determine if the given theme data is in dark mode.
  static bool isDark(ThemeData theme) {
    return theme.brightness == Brightness.dark;
  }

  /// Get the Cupertino theme data.
  static CupertinoThemeData cupertinoTheme(BuildContext context) {
    return InheritedThemeManager.cupertinoTheme(context);
  }

  /// Get the Cupertino text theme from the Cupertino theme data.
  static CupertinoTextThemeData cupertinoTextTheme(BuildContext context) {
    return cupertinoTheme(context).textTheme;
  }

  /// Get the device size.
  static Size deviceSize(BuildContext context) {
    return InheritedThemeManager.deviceSize(context);
  }

  /// Get the device height.
  static double deviceHeight(BuildContext context) {
    return deviceSize(context).height;
  }

  /// Get the device width.
  static double deviceWidth(BuildContext context) {
    return deviceSize(context).width;
  }

/* Converting & formatting of data
*/
  double convertStringToDouble(String inputString) {
    double? amount = double.tryParse(inputString);
    return amount ?? 0;
  }

  String formattedTime(DateTime dateTime) {
    return DateFormat.yMMMMd().format(dateTime);
  }

  String formatAmount(double inputAmount) {
    String formattedAmount;
    if (inputAmount >= 1000) {
      formattedAmount = NumberFormat.compact().format(inputAmount.round());
    } else {
      formattedAmount = NumberFormat.currency(
        locale: 'uk_UA',
        symbol: '₴',
        decimalDigits: 1,
      ).format(inputAmount);
    }
    if (inputAmount >= 1000) {
      formattedAmount += '₴';
    }
    return formattedAmount;
  }

/* Operations with dates
*/
  static DateTime now() {
    return DateTime.now();
  }

  static int currentMonth() {
    return DateTime.now().month;
  }

  static int currentYear() {
    return DateTime.now().year;
  }

  static int getStartMonth() {
    final now = DateTime.now();
    DateTime oneYearAgo = DateTime(now.year - 1, now.month, now.day);
    return oneYearAgo.month;
  }

  static int getStartYear() {
    final now = DateTime.now();
    DateTime oneYearAgo = DateTime(now.year - 1, now.month, now.day);
    return oneYearAgo.year;
  }

  static int calculatedMonthCount() {
    int monthCount = (currentYear() - getStartYear()) * 12 +
        currentMonth() -
        getStartMonth() +
        1;
    return monthCount;
  }

  String getCurrentMonthName() {
    DateTime now = DateTime.now();
    return AppStrings.monthsName[now.month - 1];
  }

/* Navigation methods
*/
  static void push(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  static void pop(BuildContext context) {
    Navigator.pop(context);
  }

  void callSnackBar(BuildContext context, String content) {
    return SchedulerBinding.instance.addPostFrameCallback((_) {
      Helpers.showSnackBar(context, content);
    });
  }

/* Snackbars
*/
  static void clearSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }

  static void showSnackBar(BuildContext ctx, String content) {
    bool isDarkTheme = Helpers.isDarkTheme(ctx);
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        backgroundColor: !isDarkTheme
            ? colorScheme(ctx).surface.withOpacity(0.75)
            : colorScheme(ctx).surface.withOpacity(0.9),
        content: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Text(
            content,
            style: Helpers.textTheme(ctx)
                .titleSmall!
                .copyWith(color: Helpers.colorScheme(ctx).secondary),
          ),
        ),
        duration: const Duration(milliseconds: 2350),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(bottom: Helpers.deviceHeight(ctx) * 0.85),
      ),
    );
  }

//   IF during APP loading need to paint system bars we can use next:
// import 'package:flutter/services.dart';
  static Future<void> setSystemColors() async {
    // bool isDarkThemeMode =
    //     await SharedPreferencesHelper.getThemeModeFromShPrefs();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
    ));
  }

  static Future<bool> checkInternetConnectivity(BuildContext context) async {
    final scaffoldContext = ScaffoldMessenger.of(context);
    final connectivityResult = await Connectivity().checkConnectivity();
    // ignore: unrelated_type_equality_checks
    final hasInternetConnection = connectivityResult != ConnectivityResult.none;

    if (!hasInternetConnection) {
      scaffoldContext.showSnackBar(
        const SnackBar(
          content: Text('Немає з\'єднання з Інтернетом'),
          duration: Duration(seconds: 3),
        ),
      );
    }
    return hasInternetConnection;
  }
/*
 */
}
