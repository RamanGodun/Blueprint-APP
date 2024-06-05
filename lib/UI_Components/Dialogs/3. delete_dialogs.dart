import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../State_management/Const_data/strings_4_app.dart';
import '../../State_management/Models/models_4_tracker_on_isar /model_of_category.dart';
import '../../State_management/Models/models_4_tracker_on_isar /model_of_subcategory.dart';
import '../../State_management/Src/Helpers/Common/helpers.dart';

class DeleteDialog {
  /*
  D E L E T E   ITEMS dialogs
  */

  static void showItemDeleteDialog({
    required BuildContext context,
    required VoidCallback refreshFunction,
    required GlobalKey<ScaffoldState> scaffoldKey,
    Function? refreshingOfItemsData,
    int? expenseId,
    bool? isPurchase,
    bool? isBlueprint,
    bool? isSubCategory,
    Category? selectedCategory,
    SubCategory? deletingSubCategory,
  }) {
    showCupertinoModalPopup(
        context: context,
        builder: (context) {
          TextTheme textTheme = Helpers.textTheme(context);
          ColorScheme colorScheme = Helpers.colorScheme(context);
          //

          return Padding(
            padding:
                EdgeInsets.only(bottom: Helpers.deviceHeight(context) / 10),
            child: CupertinoAlertDialog(
              insetAnimationDuration: const Duration(milliseconds: 30),
              title: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  AppStrings.deleting,
                  textAlign: TextAlign.center,
                  style: textTheme.displayLarge!.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
              ),
              content: Text(
                AppStrings.deletingAssurance,
                style: textTheme.titleSmall,
                textAlign: TextAlign.left,
              ),
              actions: const [
                // CustomButtons.cancelButton(
                //   context: context,
                //   isFromDeleteDialog: true,
                // ),
                // (isSubCategory != null)
                //     ? ButtonForSubCategories(
                //         context: context,
                //         scaffoldKey: scaffoldKey,
                //         isDeleting: true,
                //         refreshFunction: refreshFunction,
                //         selectedCategory: selectedCategory!,
                //         selectedSubCategory: deletingSubCategory,
                //         refreshingOfItemsData: refreshingOfItemsData!,
                //       )
                //     : CustomButtons.deleteButton(
                //         context: context,
                //         id: (isSubCategory == null) ? expenseId! : null,
                //         isPurchase: (isSubCategory == null)
                //             ? ((isPurchase != null) ? true : false)
                //             : null,
                //         refreshFunction: refreshFunction,
                //         isBlueprint: (isSubCategory == null)
                //             ? (isBlueprint ?? false)
                //             : null,
                //         scaffoldKey: scaffoldKey,
                //       ),
              ],
            ),
          );
        });
  }
}
