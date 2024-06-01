import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import '../../Const_data/strings_4_app.dart';

class Helpers {
/*
Here some useful methods, used across all app
*/

/* Styling and MQ methods
*/
  static bool isDarkTheme(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return isDarkTheme;
  }

  static CupertinoThemeData cupertinoThemeData(BuildContext context) {
    return CupertinoTheme.of(context);
  }

  static ColorScheme colorScheme(BuildContext context) {
    return Theme.of(context).colorScheme;
  }

  static TextTheme textTheme(BuildContext context) {
    return Theme.of(context).textTheme;
  }

  static double deviceHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double deviceWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
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

/*
  IF during APP loading need to paint system bars we can use next:
import 'package:flutter/services.dart';

  static Future<void> setSystemColors() async {
    bool isDarkThemeMode =
        await SharedPreferencesHelper.getThemeModeFromShPrefs();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
      statusBarBrightness: isDarkThemeMode ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: isDarkThemeMode
          ? ThisThisAppColors.kDarkIOSBackground
          : ThisThisAppColors.kLightIOSBackground,
      systemNavigationBarIconBrightness:
          isDarkThemeMode ? Brightness.light : Brightness.dark,
    ));
  }

WHERE

 */
}
