import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Theme_configuration/this_app_colors.dart';
import 'custom_icons_list.dart';

class ThisAppIcons {
/*
*/
  static Icon toolTipIcon(BuildContext context, ColorScheme colorScheme) {
    return Icon(
      CupertinoIcons.info,
      color: colorScheme.primary,
    );
  }

/*
icons 4 bottom tab bar
*/
  static const List<IconData> icons = [
    Icons.account_balance_wallet,
    Icons.shopping_cart,
    Icons.format_list_bulleted
  ];

/*
icons for CATEGORIES
*/
  static const List<IconData> categoryIcon = [
    Icons.local_dining,
    Icons.directions_car,
    Icons.work,
    Icons.local_hotel,
    Icons.devices,
    Icons.favorite,
    Icons.local_hospital,
    Icons.home,
    Icons.category
  ];

/*
List of CUSTOM Icons 
*/
  static final List<IconData> customIcons =
      ThisAppCustomIcons().myCustomIconsList;

  static Widget themeIcon(bool isDarkTheme) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Icon(
        !isDarkTheme ? Icons.nightlight_round_sharp : Icons.wb_sunny,
        color: ThisAppColors.kAppPrimaryColor,
      ),
    );
  }

  static Widget flipIcon(double? size) {
    return Icon(
      Icons.flip_camera_android_outlined,
      color: ThisAppColors.kAppPrimaryColor,
      size: (size != null) ? size : 15,
    );
  }

  static Widget infoIcon(bool isDarkTheme) {
    return Icon(
      Icons.info_outlined,
      size: 20,
      color: isDarkTheme
          ? ThisAppColors.kSecondaryDarkColor
          : ThisAppColors.kSecondaryColor,
    );
  }

  static Widget addSubCategory(bool isDarkTheme) {
    return Icon(
      Icons.edit,
      size: 18,
      color: isDarkTheme
          ? ThisAppColors.kSecondaryDarkColor
          : ThisAppColors.kSecondaryColor,
    );
  }

  static Widget pieCharIcon(bool isDarkTheme) {
    return Icon(
      Icons.pie_chart,
      size: 25,
      color: isDarkTheme
          ? ThisAppColors.kSecondaryDarkColor
          : ThisAppColors.kSecondaryColor,
    );
  }

  static Widget calendar() {
    return const Icon(
      Icons.calendar_month,
      color: ThisAppColors.kAppPrimaryColor,
      size: 20,
    );
  }

// icons 4 slider on entry screen
  static Widget arrowIcon() {
    return Icon(
      Icons.arrow_forward_ios,
      color: ThisAppColors.grey300,
      size: 27,
    );
  }

  static Widget checkIcon4Slider() {
    return Icon(
      Icons.check_circle_outline_sharp,
      size: 50,
      color: ThisAppColors.kAppPrimaryColor.withOpacity(0.6),
    );
  }

// info icons for list tiles
  static Widget infoIcons({
    required bool isDropAndDrugAble,
    required bool isSwipeAble,
    bool? isFromPieChart,
    bool? isForInfoDialog,
    BuildContext? context,
  }) {
    return SizedBox(
      width: (isFromPieChart == null && isForInfoDialog == null) ? 65 : 30,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (isDropAndDrugAble && isFromPieChart == null)
            Icon(
              Icons.touch_app,
              size: (isForInfoDialog == null) ? 15 : 25,
              color: ThisAppColors.grey600.withOpacity(0.13),
            ),
          if (isDropAndDrugAble)
            Padding(
              padding:
                  EdgeInsets.only(left: (isForInfoDialog != null) ? 5.0 : 0.0),
              child: Icon(
                Icons.swap_vert_sharp,
                size: (isForInfoDialog == null) ? 15 : 25,
                color: (isForInfoDialog == null)
                    ? ThisAppColors.grey600.withOpacity(0.13)
                    : Theme.of(context!).colorScheme.onSurface.withOpacity(0.2),
              ),
            ),
          const SizedBox(width: 5),
          if (isSwipeAble)
            Padding(
              padding:
                  EdgeInsets.only(right: (isForInfoDialog != null) ? 5 : 0.0),
              child: Icon(
                Icons.keyboard_double_arrow_left_sharp,
                size: (isForInfoDialog == null) ? 15 : 25,
                color: (isForInfoDialog == null)
                    ? ThisAppColors.grey600.withOpacity(0.13)
                    : Theme.of(context!).colorScheme.onSurface.withOpacity(0.2),
              ),
            ),
        ],
      ),
    );
  }

// choose category icon
  static Widget chooseCategoryIcon() {
    return const Icon(
      Icons.add_task_sharp,
      color: ThisAppColors.kAppPrimaryColor,
      size: 20,
    );
  }

  static Widget backIcon(BuildContext context, ColorScheme colorScheme) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: Icon(
        CupertinoIcons.back,
        color: colorScheme.onSurface,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

//
}
