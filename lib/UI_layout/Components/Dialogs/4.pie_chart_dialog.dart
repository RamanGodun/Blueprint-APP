import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../State_management/Src/Const_data/strings_4_app.dart';
import '../../../State_management/Models/app_enums.dart';
import '../../../State_management/Providers/Provider_4_tracker/categories_provider.dart';
import '../../../State_management/Providers/Provider_4_tracker/items_provider.dart';
import '../../../State_management/Src/Custom_icons/app_icons.dart';
import '../../../State_management/Helpers/For_tracker/category_helpers.dart';
import '../../../State_management/Helpers/Common/helpers.dart';
import '../../../State_management/Theme_configuration/app_colors.dart';
import '../Cards_and_tiles/list_tile.dart';
import '../Static/dividers.dart';
import '../Text_widgets/text_widgets2.dart';

class PieChartDialog {
  Key _reorderableListKey = GlobalKey();
  void updateReorderableListKey() {
    _reorderableListKey = GlobalKey();
  }

  bool isExpanded = false;

  Widget build(
    BuildContext context,
    bool showAllExpenses,
    Function(bool) setShowAllExpenses,
  ) {
    ItemsDataBase provider = Provider.of<ItemsDataBase>(context);
    bool allExpensesAreZero = CategoriesEnum.values.every(
      (categoryEnum) => provider.expensesCategorySummary[categoryEnum] == 0,
    );
    double mQHeight = Helpers.deviceHeight(context);
    double mQWidth = Helpers.deviceWidth(context);
    TextTheme textTheme = Helpers.textTheme(context);
    ColorScheme colorScheme = Helpers.colorScheme(context);
    bool isDarkTheme = Helpers.isDarkTheme(context);
    String totalExpensesText = showAllExpenses
        ? AppStrings.totalExpenses
        : "${AppStrings.expensesIn} ${Helpers().getCurrentMonthName()}";

    return Material(
      color: AppColors.kDarkAndroidBackground
          .withOpacity(Helpers.isDarkTheme(context) ? 0.2 : 0.05),
      child: Padding(
        padding: EdgeInsets.only(bottom: mQHeight / 100),
        child: CupertinoAlertDialog(
          // title
          title: Container(
            padding: EdgeInsets.only(left: mQWidth / 8),
            height: 30,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  totalExpensesText,
                  style: textTheme.titleSmall,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: IconButton(
                    icon: const Icon(
                      Icons.flip_camera_android_outlined,
                      size: 15,
                      color: AppColors.kAppPrimaryColor,
                    ),
                    onPressed: () {
                      setShowAllExpenses(!showAllExpenses);
                    },
                  ),
                ),
              ],
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              // PIE Chart
              Stack(
                alignment: Alignment.center,
                children: [
                  if (!allExpensesAreZero)
                    SizedBox(
                      height: mQHeight / 6.5,
                      width: mQWidth,
                      child: PieChart(
                        swapAnimationDuration:
                            const Duration(milliseconds: 1150),
                        PieChartData(
                          sections: _getSectionsData(
                              context, showAllExpenses, textTheme, colorScheme),
                        ),
                      ),
                    ),
                  // total sum inside pie chart
                  (allExpensesAreZero)
                      ? const SizedBox()
                      : (provider.calculatedCurrentMonthTotal == 0 &&
                              !showAllExpenses)
                          ? TextWidgets.text4EmptyField(
                              AppStrings.textForEmptyPages["pieChart"]!,
                              context)
                          : Text(
                              showAllExpenses
                                  ? "${NumberFormat.compact().format(provider.totalSumOfAllExpenses)} ${AppStrings.localCurrencySymbol1}"
                                  : " ${NumberFormat.compact().format(provider.calculatedCurrentMonthTotal)} ${AppStrings.localCurrencySymbol1}",
                              style: textTheme.labelMedium,
                            ),
                ],
              ),
              // content for "no expenses"
              if (allExpensesAreZero)
                SizedBox(
                  height: mQHeight / 2,
                  child: Center(
                    child: TextWidgets.text4EmptyField(
                        AppStrings.textForEmptyPages["expenses"]!, context),
                  ),
                ),
              const SizedBox(height: 20),
              // Categories list
              if (!allExpensesAreZero)
                Stack(
                  children: [
                    SizedBox(
                      height: mQHeight / 2.5,
                      width: mQWidth,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AppDividers.divider(isDarkTheme, true),
                          const SizedBox(height: 5),
                          Expanded(
                            child: ReorderableListView.builder(
                              key: _reorderableListKey,
                              itemCount: provider.pieChartCategories.length,
                              itemBuilder: (context, index) {
                                final category =
                                    provider.pieChartCategories[index];
                                final expensesForCategory = showAllExpenses
                                    ? provider.expensesSortedLists[category]
                                    : provider.expensesOfThisMonthSortedLists[
                                            category] ??
                                        [];
                                double categoryValue = showAllExpenses
                                    ? provider.expensesCategorySummary[
                                        provider.pieChartCategories[index]]!
                                    : (!showAllExpenses
                                        ? provider
                                                .expensesCategorySummaryOfCurrentMonth[
                                            provider.pieChartCategories[index]]!
                                        : 0.0);
                                String percentageOfTotalAmount =
                                    NumberFormat.percentPattern().format(
                                  showAllExpenses
                                      ? categoryValue /
                                          provider.totalSumOfAllExpenses
                                      : categoryValue /
                                          provider.calculatedCurrentMonthTotal,
                                );

                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  key: ValueKey(category),
                                  children: [
                                    ExpansionTile(
                                      dense: true,
                                      visualDensity: VisualDensity.compact,
                                      initiallyExpanded: false,
                                      tilePadding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      iconColor: colorScheme.primary
                                          .withOpacity(isDarkTheme ? 0.5 : 0.7),
                                      collapsedIconColor: colorScheme.primary
                                          .withOpacity(isDarkTheme ? 0.5 : 0.7),
                                      expansionAnimationStyle: AnimationStyle(
                                        duration:
                                            const Duration(milliseconds: 75),
                                      ),
                                      leading: Icon(
                                        CategoriesProvider()
                                            .kCategoriesData[category]!
                                            .iconData,
                                        color: CategoriesProvider()
                                            .kCategoriesData[category]!
                                            .color,
                                      ),
                                      title: Stack(
                                        children: [
                                          Row(children: [
                                            const Spacer(),
                                            AppIcons.infoIcons(
                                              isDropAndDrugAble: true,
                                              isSwipeAble: false,
                                              isFromPieChart: true,
                                            ),
                                          ]),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                CategoriesHelper
                                                    .categoryDisplayedName(
                                                        category),
                                                style: textTheme.displaySmall,
                                              ),
                                              const SizedBox(width: 15),
                                              //
                                              Text(
                                                "${AppStrings.totally}${Helpers().formatAmount(categoryValue)} ($percentageOfTotalAmount ${AppStrings.fromAll})",
                                                style: textTheme.bodySmall,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      onExpansionChanged: (value) {
                                        isExpanded = value;
                                      },
                                      children: [
                                        if (expensesForCategory == null ||
                                            expensesForCategory.isEmpty)
                                          Center(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 35.0,
                                                  top: 30,
                                                  left: 10,
                                                  right: 10),
                                              child: FittedBox(
                                                fit: BoxFit.contain,
                                                child: Text(
                                                  AppStrings
                                                      .noExpensesOfThisCategory,
                                                  style: textTheme.bodyMedium!
                                                      .copyWith(
                                                    fontStyle: FontStyle.italic,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        else
                                          // expenses list                                          //
                                          ...List.generate(
                                            expensesForCategory.length,
                                            (index) => SizedBox(
                                              height: 45,
                                              child: CustomListTile(
                                                key: ValueKey(
                                                    expensesForCategory[index]
                                                        .id),
                                                itemData:
                                                    expensesForCategory[index],
                                                isExpense: true,
                                                isPieChart: true,
                                                onEditPressed: null,
                                                onDeletePressed: null,
                                                isDropAndDrugAble: false,
                                                isSwipeAble: false,
                                              ),
                                            ),
                                          ),
                                        const SizedBox(height: 10),
                                      ],
                                    ),
                                  ],
                                );
                              },
                              // re-ordering method
                              onReorder: (int oldIndex, int newIndex) async {
                                provider.updateListOrderInProvider(
                                    oldIndex, newIndex, "pie chart");
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    // bottom divider
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: AppDividers.divider(isDarkTheme, true),
                    ),
                  ],
                ),
            ],
          ),
          actions: [
            CupertinoDialogAction(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                AppStrings.toClose,
                style: textTheme.displayLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> _getSectionsData(BuildContext context,
      bool showAllExpenses, TextTheme textTheme, ColorScheme colorScheme) {
    ItemsDataBase provider = Provider.of<ItemsDataBase>(context);

    List<CategoriesEnum> shuffledCategories = List.from(CategoriesEnum.values)
      ..shuffle();

    return shuffledCategories.map((categoryEnum) {
      double value = showAllExpenses
          ? provider.expensesCategorySummary[categoryEnum]!
          : (!showAllExpenses
              ? provider.expensesCategorySummaryOfCurrentMonth[categoryEnum]!
              : 0.0);
      String titleText = NumberFormat.percentPattern().format(
        showAllExpenses
            ? value / provider.totalSumOfAllExpenses
            : value / provider.calculatedCurrentMonthTotal,
      );
      bool shouldShowTitle = (showAllExpenses &&
              value / provider.totalSumOfAllExpenses > 0.05) ||
          (!showAllExpenses && value / provider.totalSumOfAllExpenses > 0.05);

      return PieChartSectionData(
        color: CategoriesProvider().kCategoriesData[categoryEnum]!.color,
        value: value,
        title: shouldShowTitle ? titleText : "",
        titlePositionPercentageOffset: 0.45,
        radius: 20,
        titleStyle:
            textTheme.bodyMedium!.copyWith(color: colorScheme.onPrimary),
        badgeWidget: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Icon(
              CategoriesProvider().kCategoriesData[categoryEnum]!.iconData,
              size: shouldShowTitle ? 13 : 7,
              color: CategoriesProvider().kCategoriesData[categoryEnum]!.color,
            ),
            const SizedBox(width: 1),
            Text(
              (!shouldShowTitle && titleText.trim() != "0%")
                  ? "- $titleText"
                  : (titleText.trim() == "0%")
                      ? "<1%"
                      : "",
              style: textTheme.bodySmall!.copyWith(fontSize: 7),
            ),
          ],
        ),
        badgePositionPercentageOffset: !shouldShowTitle ? 1.45 : 1.37,
      );
    }).toList();
  }
}
