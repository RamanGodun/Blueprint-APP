import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../../../State_management/Src/Const_data/strings_4_app.dart';
import '../../../../State_management/Models/app_enums.dart';
import '../../../../State_management/Models/models_4_tracker_on_isar /model_of_category.dart';
import '../../../../State_management/Models/models_4_tracker_on_isar /model_of_subcategory.dart';
import '../../../../State_management/Providers/Provider_4_tracker/categories_provider.dart';
import '../../../../State_management/Providers/Provider_4_tracker/items_provider.dart';
import '../../../../State_management/Helpers/Common/helpers.dart';
import '../../../../State_management/Helpers/For_tracker/category_helpers.dart';
import '../../../../State_management/Helpers/For_tracker/sh_prefs_helper.dart';
import '../../_Widgets_STYLING/_text_styles_for_components.dart';

class ButtonForSubCategories extends StatelessWidget {
  const ButtonForSubCategories({
    super.key,
    required this.scaffoldKey,
    required this.context,
    required this.refreshFunction,
    required this.selectedCategory,
    required this.selectedSubCategory,
    required this.refreshingOfItemsData,
    this.previousCategory,
    this.isNewSubcategory,
    this.isDeleting,
    this.isCategoryWasChanged,
    this.nameController,
    // this.allItems,
    this.colorForSubCategory,
    this.iconOfSubCategory,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;
  final BuildContext context;
  final VoidCallback refreshFunction;
  final Category selectedCategory;
  final SubCategory? selectedSubCategory;
  final Category? previousCategory;
  final bool? isNewSubcategory;
  final bool? isDeleting;
  final bool? isCategoryWasChanged;
  final TextEditingController? nameController;
  // final List<ItemModel>? allItems;
  final Function refreshingOfItemsData;
  final Color? colorForSubCategory;
  final IconData? iconOfSubCategory;

  @override
  Widget build(BuildContext context) {
    late String newSubCategoryTitle;

    return CupertinoDialogAction(
      isDefaultAction: true,
      onPressed: () async {
        Navigator.pop(context);
        final Map<CategoriesEnum, List<SubCategory>>
            subCategoriesOfSelectedCategory =
            CategoriesProvider().kSubCategoriesData;
        final CategoriesEnum selectedCategoryEnum =
            CategoriesHelper.categoryToEnum(selectedCategory.title);

        // saving of new SubCategory
        if (isNewSubcategory ?? false) {
          newSubCategoryTitle = nameController!.text.isNotEmpty
              ? nameController!.text
              : "без назви"; //need to add validation, names must be unique
          subCategoriesOfSelectedCategory[selectedCategoryEnum]!.add(
            getSubCategory(
                newSubCategoryTitle, iconOfSubCategory, colorForSubCategory),
          );
        } else if (isDeleting ?? false) {
          // selected SubCategory deleting
          subCategoriesOfSelectedCategory[selectedCategoryEnum]!.removeWhere(
              (subCategory) => subCategory.title == selectedSubCategory!.title);
          await ItemsDataBase().handleSubCategoryChangingInExistingItems(
            selectedSubCategory!,
            selectedCategory: selectedCategory,
            isDeleting: true,
          );
        } else if (isCategoryWasChanged ?? false) {
          //  selected SubCategory editing with condition "isCategoryChanged == true"
          subCategoriesOfSelectedCategory[
                  CategoriesHelper.categoryToEnum(previousCategory!.title)]!
              .removeWhere((subCategory) =>
                  subCategory.title == selectedSubCategory!.title);
          newSubCategoryTitle = nameController!.text.isNotEmpty
              ? nameController!.text
              : selectedSubCategory!.title;
          subCategoriesOfSelectedCategory[selectedCategoryEnum]!.add(
            getSubCategory(
                newSubCategoryTitle, iconOfSubCategory, colorForSubCategory),
          );
          await ItemsDataBase().handleSubCategoryChangingInExistingItems(
            selectedSubCategory!,
            selectedCategory: selectedCategory,
            previousCategory: previousCategory,
            isCategoryWasChanged: true,
          );
        } else {
          //  selected SubCategory editing with condition "isCategoryChanged == false"
          final index = subCategoriesOfSelectedCategory[selectedCategoryEnum]!
              .indexWhere((subCategory) =>
                  subCategory.title == selectedSubCategory!.title);
          final String newSubCategoryTitle = nameController!.text.isNotEmpty
              ? nameController!.text
              : selectedSubCategory!.title;
          if (index != -1) {
            subCategoriesOfSelectedCategory[selectedCategoryEnum]![index] =
                getSubCategory(newSubCategoryTitle, iconOfSubCategory,
                    colorForSubCategory);
            await ItemsDataBase().handleSubCategoryChangingInExistingItems(
              selectedSubCategory!,
              selectedCategory: selectedCategory,
              newSubCategoryTitle: newSubCategoryTitle,
            );
          }
        }

        // saving in Shared Preferences and then triggering of refreshing data
        await SharedPreferencesHelper.saveSubCategories(
            subCategoriesOfSelectedCategory);
        refreshFunction();
        refreshingOfItemsData();
        await ItemsDataBase().readAllDataFromDB();
        // binding & calling snackbar
        SchedulerBinding.instance.addPostFrameCallback((_) {
          Helpers.showSnackBar(
              context, "Ok, ${AppStrings.successfullyAddedList}");
        });
        //   controller's clearing
        if (nameController != null) {
          nameController!.clear();
        }
      },
      child: Text(
        (selectedSubCategory == null)
            ? AppStrings.add
            : (isDeleting == true)
                ? AppStrings.delete
                : AppStrings.change,
        style: TextStyle4Components.buttonTextStyle(context),
      ),
    );
  }

//
  SubCategory getSubCategory(
    String newSubCategoryTitle,
    IconData? iconOfSubcategory,
    Color? colorForSubCategory,
  ) {
    return SubCategory(
      title: newSubCategoryTitle,
      iconData: iconOfSubcategory!,
      color: colorForSubCategory!,
    );
  }
//
}
