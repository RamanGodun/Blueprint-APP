import 'package:blueprint_4app/UI_layout/Components/Mini_widgets/dividers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../State_management/Src/Const_data/strings_4_app.dart';
import '../../../../State_management/Models/models_4_tracker_on_isar /item_model.dart';
import '../../../../State_management/Models/models_4_tracker_on_isar /model_of_subcategory.dart';
import '../../../../State_management/Src/Custom_icons/app_icons.dart';
import '../../../../State_management/Helpers/Common/helpers.dart';
import '../../_Widgets_STYLING/app_box_decoration.dart';
import '../../_Widgets_STYLING/app_text_styling.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    this.itemData,
    this.isPurchase,
    this.isExpense,
    this.isPieChart,
    required this.isDropAndDrugAble,
    required this.isSwipeAble,
    required this.onEditPressed,
    required this.onDeletePressed,
    this.onChanged,
    this.isSubCategoriesList,
    this.subcategory,
  });
  final ItemModel? itemData;
  final bool? isPurchase;
  final bool? isExpense;
  final bool? isPieChart;
  final bool isDropAndDrugAble;
  final bool isSwipeAble;
  final void Function(BuildContext)? onEditPressed;
  final void Function(BuildContext)? onDeletePressed;
  final void Function(BuildContext)? onChanged;
  final bool? isSubCategoriesList;
  final SubCategory? subcategory;

  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme = Helpers.isDarkMode(context);
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    if (isSubCategoriesList == null) {
      Color itemColor = itemData!.selectedCategory!.color;
      return Stack(
        children: [
          Slidable(
            endActionPane: (isPieChart == null)
                ? ActionPane(
                    motion: const StretchMotion(),
                    children: [
                      SlidableAction(
                        backgroundColor: colorScheme.surface
                            .withOpacity(isDarkTheme ? 0.27 : 0.19),
                        foregroundColor: colorScheme.primary
                            .withOpacity(isDarkTheme ? 0.5 : 0.7),
                        borderRadius: BorderRadius.circular(5),
                        onPressed: onEditPressed,
                        icon: Icons.settings,
                      ),
                      SlidableAction(
                        backgroundColor: colorScheme.error
                            .withOpacity(isDarkTheme ? 0.09 : 0.12),
                        foregroundColor: colorScheme.error
                            .withOpacity(isDarkTheme ? 0.95 : 0.99),
                        borderRadius: BorderRadius.circular(5),
                        onPressed: onDeletePressed,
                        icon: Icons.delete,
                      ),
                    ],
                  )
                : null,
            child: Container(
              padding: const EdgeInsets.only(left: 7, right: 7, bottom: 3.5),
              decoration:
                  AppBoxDecorations.listTileDecoration(context, isDarkTheme),
              child: ListTile(
                dense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 1),
                leading: SizedBox(
                  width: (isPurchase != null) ? 44 : 42,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          (itemData!.quantity < 1000)
                              ? itemData!.quantity.toStringAsFixed(1)
                              : itemData!.quantity.toStringAsFixed(0),
                          style: textTheme.bodyMedium,
                        ),
                      ),
                      const SizedBox(width: 2),
                      Text(
                        itemData!.measurementUnit,
                        style: textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                title: Stack(
                  children: [
                    Row(children: [
                      const Spacer(),
                      (isDropAndDrugAble && isSwipeAble)
                          ? AppIcons.infoIcons(
                              isDropAndDrugAble: true, isSwipeAble: true)
                          : (isDropAndDrugAble && !isSwipeAble)
                              ? AppIcons.infoIcons(
                                  isDropAndDrugAble: true, isSwipeAble: false)
                              : (!isDropAndDrugAble && isSwipeAble)
                                  ? AppIcons.infoIcons(
                                      isDropAndDrugAble: false,
                                      isSwipeAble: true)
                                  : AppIcons.infoIcons(
                                      isDropAndDrugAble: false,
                                      isSwipeAble: false),
                    ]),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(itemData!.name,
                            style: AppTextStyling.titleTextStyle(
                                textTheme, itemColor, isExpense!)),
                        Text(
                          (isPurchase != null)
                              ? ("${AppStrings.sum}: ${Helpers().formatAmount(itemData!.totalAmount)}")
                              : Helpers().formattedTime(itemData!.date),
                          style: textTheme.bodySmall?.copyWith(fontSize: 9),
                        ),
                      ],
                    ),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (isExpense == null)
                      Icon(
                        color: itemData!.selectedCategory!.color,
                        size: 15,
                        itemData!.selectedCategory!.iconData,
                      ),
                    if (isPurchase != null)
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Checkbox(
                          value: false,
                          onChanged: (value) {
                            if (value != null) {
                              onChanged?.call(context);
                            }
                          },
                          side: BorderSide(
                            width: 0.3,
                            color: colorScheme.onSurface,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                        ),
                      )
                    else
                      Text(
                        Helpers().formatAmount(itemData!.totalAmount),
                        style: textTheme.bodyMedium,
                      ),
                    if (isExpense != null && isPieChart == null)
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 7),
                        child: Icon(
                          color: itemData!.selectedCategory!.color,
                          size: 15,
                          itemData!.selectedCategory!.iconData,
                        ),
                      )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppDividers.divider(isDarkTheme),
          ),
        ],
      );
    } else {
      return Stack(
        children: [
          Slidable(
            endActionPane: ActionPane(
              motion: const StretchMotion(),
              children: [
                SlidableAction(
                  backgroundColor: colorScheme.surface
                      .withOpacity(isDarkTheme ? 0.27 : 0.19),
                  foregroundColor:
                      colorScheme.primary.withOpacity(isDarkTheme ? 0.5 : 0.7),
                  borderRadius: BorderRadius.circular(5),
                  onPressed: onEditPressed,
                  icon: Icons.settings,
                ),
                SlidableAction(
                  backgroundColor:
                      colorScheme.error.withOpacity(isDarkTheme ? 0.09 : 0.12),
                  foregroundColor:
                      colorScheme.error.withOpacity(isDarkTheme ? 0.95 : 0.99),
                  borderRadius: BorderRadius.circular(5),
                  onPressed: onDeletePressed,
                  icon: Icons.delete,
                ),
              ],
            ),
            child: Container(
              padding: const EdgeInsets.only(left: 7, right: 7, bottom: 3.5),
              decoration:
                  AppBoxDecorations.listTileDecoration(context, isDarkTheme),
              child: ListTile(
                dense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 1),
                title: Stack(
                  children: [
                    Row(children: [
                      const Spacer(),
                      (isDropAndDrugAble && isSwipeAble)
                          ? AppIcons.infoIcons(
                              isDropAndDrugAble: true, isSwipeAble: true)
                          : (isDropAndDrugAble && !isSwipeAble)
                              ? AppIcons.infoIcons(
                                  isDropAndDrugAble: true, isSwipeAble: false)
                              : (!isDropAndDrugAble && isSwipeAble)
                                  ? AppIcons.infoIcons(
                                      isDropAndDrugAble: false,
                                      isSwipeAble: true)
                                  : AppIcons.infoIcons(
                                      isDropAndDrugAble: false,
                                      isSwipeAble: false),
                    ]),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Row(
                        children: [
                          Icon(subcategory!.iconData,
                              color: subcategory!.color, size: 15),
                          const SizedBox(width: 10),
                          Text(
                            subcategory!.title,
                            style: TextStyle(color: subcategory!.color),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppDividers.divider(isDarkTheme),
          ),
        ],
      );
    }
  }
}
