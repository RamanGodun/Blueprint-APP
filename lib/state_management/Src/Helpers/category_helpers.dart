import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../Const_data/strings_4_app.dart';
import '../../Models/app_enums.dart';
import '../../Models/models_4_tracker_on_isar /model_of_category.dart';
import '../../Models/models_4_tracker_on_isar /db_item_model.dart';
import '../../Models/models_4_tracker_on_isar /model_of_subcategory.dart';
import '../../Providers/providers/categories_provider.dart';
import '../../Theme_configuration/App_colors_palette/this_app_colors.dart';
import '../Custom_icons/app_icons.dart';

class CategoriesHelper {
  static final CategoriesProvider _subCategoriesProvider = CategoriesProvider();

  static String categoryDisplayedName(CategoriesEnum categoryName) {
    return AppStrings.categoryNames[categoryName.index];
  }

  static CategoriesEnum categoryToEnum(String categoryName) {
    final CategoriesEnum categoryEnum = CategoriesEnum.values.firstWhere(
      (item) => CategoriesHelper.categoryDisplayedName(item) == categoryName,
      orElse: () => CategoriesEnum.other,
    );
    return categoryEnum;
  }

  static SubCategory? getSubCategoryByName(
      String categoryName, String subCategoryName) {
    final CategoriesEnum categoryEnum = categoryToEnum(categoryName);
    final List<SubCategory>? subCategories =
        CategoriesProvider().kSubCategoriesData[categoryEnum];
    if (subCategories != null) {
      return subCategories.firstWhere(
        (subCategory) => subCategory.title == subCategoryName,
        orElse: () =>
            CategoriesProvider().kSubCategoriesData[CategoriesEnum.other]![0],
      );
    }
    return null;
  }

  static Category getCategoryFromDBItem(DBItem dbItem) {
    CategoriesEnum categoryEnum = CategoriesEnum.other;
    if (CategoriesEnum.values.isNotEmpty) {
      categoryEnum = CategoriesEnum.values.firstWhereOrNull(
            (item) => categoryDisplayedName(item) == dbItem.categoryName,
          ) ??
          CategoriesEnum.other;
    }
    return _subCategoriesProvider.kCategoriesData[categoryEnum] ??
        Category(
          title: categoryDisplayedName(categoryEnum),
          color: const Color.fromARGB(255, 154, 159, 159),
          iconData: Icons.category,
        );
  }

  static SubCategory? getSubCategoryFromDBItem(DBItem dbItem) {
    return getSubCategoryByName(dbItem.categoryName, dbItem.subCategoryName);
  }

  static final Map<CategoriesEnum, List<SubCategory>> subCategoriesBlueprint = {
    for (var i = 0; i < CategoriesEnum.values.length; i++)
      CategoriesEnum.values[i]: [
        SubCategory(
          title: AppStrings.withoutSubCategory,
          color: ThisAppColors.categoriesColors[i],
          iconData: AppIcons.categoryIcon[i],
        ),
      ],
  };
}
