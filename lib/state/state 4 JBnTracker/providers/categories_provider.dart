// import 'package:flutter/material.dart';

// class CategoriesProvider extends ChangeNotifier {
//   static final CategoriesProvider _instance = CategoriesProvider._();
//   factory CategoriesProvider() {
//     return _instance;
//   }

//   CategoriesProvider._() {
//     initializingOfSubCategories();
//   }

//   final Map<CategoriesEnum, List<SubCategory>> _subCategoriesInput =
//       CategoriesHelper.subCategoriesBlueprint;

//   Future<void> initializingOfSubCategories() async {
//     final Map<CategoriesEnum, List<SubCategory>>
//         loadedSubCategoriesFromShPrefs =
//         await SharedPreferencesHelper.loadSubCategories();

//     if (loadedSubCategoriesFromShPrefs.isEmpty) {
//       await SharedPreferencesHelper.saveSubCategories(
//           CategoriesHelper.subCategoriesBlueprint);
//     } else {
//       refreshSubCategories(loadedSubCategoriesFromShPrefs);
//     }
//     notifyListeners();
//   }

//   void refreshSubCategories(
//       Map<CategoriesEnum, List<SubCategory>> loadedSubCategoriesFromShPrefs) {
//     _subCategoriesInput.clear();
//     _subCategoriesInput.addAll(loadedSubCategoriesFromShPrefs);
//   }

//   Map<CategoriesEnum, List<SubCategory>> get kSubCategoriesData {
//     final Map<CategoriesEnum, List<SubCategory>> updatedSubCategoriesData = {
//       for (var i = 0; i < CategoriesEnum.values.length; i++)
//         CategoriesEnum.values[i]: [
//           for (var j = 0;
//               j < _subCategoriesInput[CategoriesEnum.values[i]]!.length;
//               j++)
//             SubCategory(
//               title: _subCategoriesInput[CategoriesEnum.values[i]]![j].title,
//               iconData:
//                   _subCategoriesInput[CategoriesEnum.values[i]]![j].iconData,
//               color: _subCategoriesInput[CategoriesEnum.values[i]]![j].color,
//             ),
//         ],
//     };
//     return updatedSubCategoriesData;
//   }

//   final Map<CategoriesEnum, Category> kCategoriesData = {
//     for (var i = 0; i < CategoriesEnum.values.length; i++)
//       CategoriesEnum.values[i]: Category(
//         title: TextForLocalization.categoryNames[i],
//         color: AppColors.categoriesColors[i],
//         iconData: AppIcons.categoryIcon[i],
//       ),
//   };

//   void updateCategoryExpansion(CategoriesEnum category, bool isExpanded) {
//     kCategoriesData[category]!.isExpanded = isExpanded;
//     notifyListeners();
//   }

//   Map<CategoriesEnum, List<SubCategory>> updatedSubCategories() {
//     Map<CategoriesEnum, List<SubCategory>> updatedSubCategories =
//         kSubCategoriesData;
//     return updatedSubCategories;
//   }
// }
