// ignore_for_file: unused_local_variable, prefer_final_fields, unused_element

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

// import 'dart:async';

import '../../Models/app_enums.dart';
import '../../Models/models_on_isar /model_of_category.dart';
import '../../Models/models_on_isar /db_item_model.dart';
import '../../Models/models_on_isar /item_model.dart';
import '../../Models/models_on_isar /model_of_subcategory.dart';
import '../../Src/Helpers/category_helpers.dart';
import '../../Src/Helpers/helpers.dart';
import '../../Src/Helpers/sh_prefs_helper.dart';
import 'categories_provider.dart';

class ItemsDataBase extends ChangeNotifier {
  static late Isar isar;
//
  late List<ItemModel> _allExpenses = <ItemModel>[];
  List<ItemModel> get allExpenses => _allExpenses;
  final Map<Object, List<ItemModel>> _expensesSortedLists = {};
  Map<Object, List<ItemModel>> get expensesSortedLists => _expensesSortedLists;
  final Map<Object, double> _expensesCategorySummary = {};
  Map<Object, double> get expensesCategorySummary => _expensesCategorySummary;
  double _totalSumOfAllExpenses = 0;
  double get totalSumOfAllExpenses => _totalSumOfAllExpenses;

  List<ItemModel> _currentMonthExpenses = <ItemModel>[];
  List<ItemModel> get currentMonthExpenses => _currentMonthExpenses;
  final Map<Object, List<ItemModel>> _expensesOfThisMonthSortedLists = {};
  Map<Object, List<ItemModel>> get expensesOfThisMonthSortedLists =>
      _expensesOfThisMonthSortedLists;
  final Map<Object, double> _expensesCategorySummaryOfCurrentMonth = {};
  Map<Object, double> get expensesCategorySummaryOfCurrentMonth =>
      _expensesCategorySummaryOfCurrentMonth;
  double calculatedCurrentMonthTotal = 0.0;
  Map<String, double> _monthlyTotals = {};
  Map<String, double> get monthlyTotals => _monthlyTotals;

//
  late List<ItemModel> _allPurchases = <ItemModel>[];
  List<ItemModel> get allPurchases => _allPurchases;
  int _nextPurchaseId4Order = 0;

  late List<ItemModel> _allBlueprints = <ItemModel>[];
  List<ItemModel> get allBlueprints => _allBlueprints;
  final Map<Object, List<ItemModel>> _blueprintsSortedLists = {};
  Map<Object, List<ItemModel>> get blueprintsSortedLists =>
      _blueprintsSortedLists;

  final _blueprintsCategories = [...CategoriesEnum.values];
  List<CategoriesEnum> get blueprintsCategories => _blueprintsCategories;
  final _pieChartCategories = [...CategoriesEnum.values];
  List<CategoriesEnum> get pieChartCategories => _pieChartCategories;

/*
DB initialization & synchronization with SP&DB
 */

  Future<void> initializingOfDB() async {
    final dir = await getApplicationDocumentsDirectory();
    final isarInstance = await Isar.open([DBItemSchema], directory: dir.path);
    isar = isarInstance;
    await loadCategoriesFromShPrefs(true);
    await loadCategoriesFromShPrefs(false);
    notifyListeners();
  }

  Future<void> loadCategoriesFromShPrefs(bool isBlueprints) async {
    final List<CategoriesEnum> loadedCategoriesFromShPrefs = isBlueprints
        ? await SharedPreferencesHelper.loadCategoriesFromShPrefs(
            SharedPreferencesHelper.categoriesKey4Blueprints)
        : await SharedPreferencesHelper.loadCategoriesFromShPrefs(
            SharedPreferencesHelper.categoriesKey4PieChart);

    if (loadedCategoriesFromShPrefs.isEmpty) {
      final List<CategoriesEnum> categoriesToSave =
          isBlueprints ? _blueprintsCategories : _pieChartCategories;
      await SharedPreferencesHelper.saveCategoriesInShPref(
          categoriesToSave,
          isBlueprints
              ? SharedPreferencesHelper.categoriesKey4Blueprints
              : SharedPreferencesHelper.categoriesKey4PieChart);
    } else {
      if (isBlueprints == true) {
        _blueprintsCategories.clear();
        _blueprintsCategories.addAll(loadedCategoriesFromShPrefs);
      } else {
        _pieChartCategories.clear();
        _pieChartCategories.addAll(loadedCategoriesFromShPrefs);
      }
    }
  }

/*
READ & sorting data FROM DB methods
 */
  Future<void> readExpensesFromDB() async {
    List<DBItem> expenses = await isar.dBItems
        .where()
        .filter()
        .isPurchaseEqualTo(false)
        .and()
        .isBlueprintEqualTo(false)
        .findAll()
      ..sort((a, b) => a.date.compareTo(b.date));

    // _allExpenses = expenses
    //     .map(
    //       (expense) => ItemModel.fromDBItem(expense),
    //     )
    //     .toList();
    // _updateSortedExpensesLists();
  }

  void _updateSortedExpensesLists() {
    _expensesSortedLists.clear();
    _expensesCategorySummary.clear();
    _expensesCategorySummaryOfCurrentMonth.clear();
    _expensesOfThisMonthSortedLists.clear();

    for (var categoryEnum in CategoriesEnum.values) {
      final categoryName = CategoriesHelper.categoryDisplayedName(categoryEnum);
      final allExpensesOfCategory = _allExpenses
          .where((expense) => expense.selectedCategory?.title == categoryName)
          .toList();
      double totalAmount = allExpensesOfCategory.fold(
          0, (sum, expense) => sum + expense.totalAmount);

      _expensesSortedLists[categoryEnum] = allExpensesOfCategory;
      _expensesCategorySummary[categoryEnum] = totalAmount;

      final thisMonthExpensesOfCategory = _allExpenses
          .where((expense) =>
              expense.selectedCategory?.title == categoryName &&
              expense.date.year == Helpers.currentYear() &&
              expense.date.month == Helpers.currentMonth())
          .toList();
      double totalAmountThisMonth = thisMonthExpensesOfCategory.fold(
          0, (sum, expense) => sum + expense.totalAmount);

      _expensesOfThisMonthSortedLists[categoryEnum] =
          thisMonthExpensesOfCategory;
      _expensesCategorySummaryOfCurrentMonth[categoryEnum] =
          totalAmountThisMonth;
    }
    notifyListeners();
  }

  Future<void> readPurchasesFromDB() async {
    List<DBItem> purchasesFromDB = await isar.dBItems
        .where()
        .filter()
        .isPurchaseEqualTo(true)
        .and()
        .isBlueprintEqualTo(false)
        .findAll()
      ..sort((a, b) => a.id4Order.compareTo(b.id4Order));

    // _allPurchases = purchasesFromDB
    //     .map(
    //       (expense) => ItemModel.fromDBItem(expense),
    //     )
    //     .toList();
    if (_allPurchases.length != _nextPurchaseId4Order) {
      _nextPurchaseId4Order = _allPurchases.length - 1;
    }
    notifyListeners();
  }

  Future<void> readBlueprintsFromDB() async {
    List<DBItem> blueprints =
        await isar.dBItems.where().filter().isBlueprintEqualTo(true).findAll();
    // _allBlueprints = blueprints
    //     .map(
    //       (expense) => ItemModel.fromDBItem(expense),
    //     )
    //     .toList();
    _updateSortedBlueprintsLists();
  }

  void _updateSortedBlueprintsLists() {
    _blueprintsSortedLists.clear();
    for (var categoryEnum in CategoriesEnum.values) {
      final categoryName = CategoriesHelper.categoryDisplayedName(categoryEnum);
      final blueprintsOfCategory = _allBlueprints
          .where(
              (blueprint) => blueprint.selectedCategory?.title == categoryName)
          .toList();
      _blueprintsSortedLists[categoryEnum] = blueprintsOfCategory;
    }
    notifyListeners();
  }

  Future<void> readAllDataFromDB() async {
    await readExpensesFromDB();
    await getCurrentMonthExpanses();
    await readPurchasesFromDB();
    await readBlueprintsFromDB();
    await calculatedTotals(true);
    notifyListeners();
  }

/*
SAVE data ON DB methods
 */
  Future<void> createNewItemOnDB(
    ItemModel newItem,
    bool? isPurchase,
  ) async {
    if (isPurchase != null) {
      // newItem.id4Order = _nextPurchaseId4Order++;
    }
    // await isar.writeTxn(() => isar.dBItems.put(newItem.toDBItem()));

    if (!newItem.isPurchase && !newItem.isBlueprint) {
      _allExpenses.add(newItem);
      await readExpensesFromDB();
    }
    if (newItem.isPurchase && !newItem.isBlueprint) {
      _allPurchases.add(newItem);
      await readPurchasesFromDB();
    }
    if (newItem.isBlueprint) {
      _allBlueprints.add(newItem);
      await readBlueprintsFromDB();
    }
  }

/*
EDIT data ON DB methods
 */
  Future<void> updateExpenseItemOnDB(
    int id,
    ItemModel item,
    String typeOfItem,
  ) async {
    // DBItem changedItem = item.toDBItem();
    // changedItem.id = id;
    // await isar.writeTxn(() => isar.dBItems.put(changedItem));

    switch (typeOfItem) {
      case 'purchase':
        await readPurchasesFromDB();
        break;
      case 'blueprint':
        await readBlueprintsFromDB();
        break;
      case 'expense':
        await readExpensesFromDB();
        break;
      case '':
        await readBlueprintsFromDB();
        await readExpensesFromDB();
        break;
      default:
        await readAllDataFromDB();
        break;
    }
  }

/*
DELETE data ON DB methods
 */
  Future<void> deleteItemOnDB(
    int id,
    bool? isPurchase,
    String typeOfItem,
  ) async {
    await isar.writeTxn(() => isar.dBItems.delete(id));
    if (isPurchase != null) {
      _allPurchases.removeWhere((item) => item.id == id);
      _nextPurchaseId4Order--;
      await updatePurchasesOrderOnDB();
    }
    switch (typeOfItem) {
      case 'purchase':
        await readPurchasesFromDB();
        break;
      case 'blueprint':
        await readBlueprintsFromDB();
        break;
      case 'expense':
        await readExpensesFromDB();
        break;
      default:
        await readAllDataFromDB();
        break;
    }
  }

  Future<void> updatePurchasesOrderOnDB() async {
    await isar.writeTxn(() async {
      for (int i = 0; i < _allPurchases.length; i++) {
        final ItemModel item = _allPurchases[i];
        // final DBItem changedItem = item.toDBItem();
        // changedItem.id = item.id;
        // await isar.dBItems.put(changedItem);
      }
    });
  }

/*
FOR ReOrderable ListView
 */
  void updateListOrderInProvider(
      int oldIndex, int newIndex, String typeOfItem) async {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }

    switch (typeOfItem) {
      case "purchase":
        final ItemModel item = _allPurchases.removeAt(oldIndex);
        _allPurchases.insert(newIndex, item);
        for (int i = 0; i < _allPurchases.length; i++) {
          // _allPurchases[i].id4Order = i;
        }
        break;
      case "blueprint":
        final CategoriesEnum category =
            _blueprintsCategories.removeAt(oldIndex);
        _blueprintsCategories.insert(newIndex, category);
        await SharedPreferencesHelper.saveCategoriesInShPref(
            _blueprintsCategories,
            SharedPreferencesHelper.categoriesKey4Blueprints);
        break;
      default:
        final CategoriesEnum category = _pieChartCategories.removeAt(oldIndex);
        _pieChartCategories.insert(newIndex, category);
        await SharedPreferencesHelper.saveCategoriesInShPref(
            _pieChartCategories,
            SharedPreferencesHelper.categoriesKey4PieChart);
    }

    notifyListeners();
  }

/*
methods 4 EXPENSES 
 */
  Future<void> getCurrentMonthExpanses() async {
    List<ItemModel> currentMonthExpenses = allExpenses.where((expense) {
      return expense.date.year == Helpers.currentYear() &&
          expense.date.month == Helpers.currentMonth();
    }).toList();
    _currentMonthExpenses = currentMonthExpenses;
  }

  Future<Map<String, double>> calculatedTotals(bool? isNeedToCalculate) async {
    await readExpensesFromDB();
    Map<String, double> monthsTotals = {};

    if (isNeedToCalculate == true) {
      for (var expense in _allExpenses) {
        int indexMonth = expense.date.month;
        int indexYear = expense.date.year;
        String yearMonth = '$indexYear-$indexMonth';

        monthsTotals[yearMonth] ??= 0;
        monthsTotals[yearMonth] =
            monthsTotals[yearMonth]! + expense.totalAmount;
      }
      _monthlyTotals = monthsTotals;

      calculatedCurrentMonthTotal =
          monthlyTotals['${Helpers.currentYear()}-${Helpers.currentMonth()}'] ??
              0;
      double total = 0.0;
      expensesCategorySummary.forEach((key, value) {
        total += value;
      });
      _totalSumOfAllExpenses = total;
    } else {
      monthsTotals = _monthlyTotals;
    }
    notifyListeners();
    return monthsTotals;
  }

//
  Future<void> handleSubCategoryChangingInExistingItems(
    SubCategory selectedSubCategory, {
    required Category selectedCategory,
    Category? previousCategory,
    bool isDeleting = false,
    bool isCategoryWasChanged = false,
    String? newSubCategoryTitle,
    // List<ItemModel>? allItems,
  }) async {
    // final List<ItemModel> allItems = await getAllItemsFromDB();
    final CategoriesEnum categoryEnum =
        CategoriesHelper.categoryToEnum(selectedCategory.title);
    final SubCategory initialSubCategory =
        CategoriesProvider().kSubCategoriesData[categoryEnum]![0];

    // if (allItems.isNotEmpty) {
    //   final List<ItemModel> localVarOfUpdatedItems = allItems
    //       .where((item) => isCategoryWasChanged
    //           ? (item.selectedCategory?.title == previousCategory!.title &&
    //               item.selectedSubCategory?.title == selectedSubCategory.title)
    //           : (item.selectedSubCategory?.title == selectedSubCategory.title))
    //       .map((item) {
    //     final updatedSubCategory = isDeleting
    //         ? initialSubCategory
    //         : selectedSubCategory.updateTitle(
    //             (newSubCategoryTitle != null && newSubCategoryTitle.isNotEmpty)
    //                 ? newSubCategoryTitle
    //                 : selectedSubCategory.title);

    //   return item.copyWith(
    //     selectedCategory: selectedCategory,
    //     selectedSubCategory: updatedSubCategory,
    //   );
    // }).toList();

    // if (localVarOfUpdatedItems.isNotEmpty) {
    //   await isar.writeTxn(() async {
    //     final listOfItemsOnDBToUpdate = isCategoryWasChanged
    //         ? await isar.dBItems
    //             .filter()
    //             .subCategoryNameEqualTo(selectedSubCategory.title)
    //             .and()
    //             .categoryNameEqualTo(previousCategory!.title)
    //             .findAll()
    //         : await isar.dBItems
    //             .filter()
    //             .subCategoryNameEqualTo(selectedSubCategory.title)
    //             .findAll();

    //   for (var item in listOfItemsOnDBToUpdate) {
    //     DBItem? itemToUpdate = await isar.dBItems.get(item.id);
    //     final blueprint4itemToUpdate = localVarOfUpdatedItems
    //         .firstWhere((element) => element.id == item.id);
    //     itemToUpdate?.subCategoryName =
    //         blueprint4itemToUpdate.selectedSubCategory!.title;
    //     if (isCategoryWasChanged) {
    //       itemToUpdate?.categoryName =
    //           blueprint4itemToUpdate.selectedCategory!.title;
    //     }
    //     await isar.dBItems.put(itemToUpdate!);
    //   }
    // });
    // }
  }
}

// Future<List<ItemModel>> getAllItemsFromDB() async {
  // List<DBItem> allItemsInDBModelType =
  //     await isar.dBItems.where().anyId().findAll();
  // List<ItemModel> allItemsFromDB = allItemsInDBModelType
  //     .map(
  //       (item) => ItemModel.fromDBItem(item),
  //     )
  //     .toList();
  // return allItemsFromDB;
  // }
//
// }


/*
 Future<void> handleSubCategoryChangingInExistingItems(
    SubCategory selectedSubCategory, {
    required Category selectedCategory,
    Category? previousCategory,
    bool isDeleting = false,
    bool isCategoryWasChanged = false,
    String? newSubCategoryTitle,
    // List<ItemModel>? allItems,
  }) async {
    print("isCategoryChanged from provider: $isCategoryWasChanged");
    print("selectedCategory from provider: ${selectedCategory.title}");
    if (previousCategory != null) {
      print("previousCategory from provider: ${previousCategory.title}");
    }
    print("selectedSubCategory from provider: ${selectedSubCategory.title}");

    if (isCategoryWasChanged) {
      final List<ItemModel> allItems = await getAllItemsFromDB();

      if (allItems.isNotEmpty) {
        final List<ItemModel> localVarOfUpdatedItems = allItems
            .where((item) => (item.selectedCategory?.title ==
                    previousCategory!.title &&
                item.selectedSubCategory?.title == selectedSubCategory.title))
            .map((item) {
          final updatedCategory = selectedCategory;
          final updatedSubCategory = selectedSubCategory
              .updateTitle(newSubCategoryTitle ?? selectedSubCategory.title);

          return item.copyWith(
            selectedCategory: updatedCategory,
            selectedSubCategory: updatedSubCategory,
          );
        }).toList();
        print(
            "localVarOfUpdatedItems[0] category ${localVarOfUpdatedItems[0].selectedCategory?.title}");
        print(
            "localVarOfUpdatedItems[0] subCategory ${localVarOfUpdatedItems[0].selectedSubCategory?.title}");

        if (localVarOfUpdatedItems.isNotEmpty) {
          await isar.writeTxn(() async {
            final listOfItemsOnDBToUpdate = await isar.dBItems
                .filter()
                .subCategoryNameEqualTo(selectedSubCategory.title)
                .and()
                .categoryNameEqualTo(previousCategory!.title)
                .findAll();
            print(
                "listOfItemsOnDBToUpdate.categoryName ${listOfItemsOnDBToUpdate[0].categoryName}");

            for (var item in listOfItemsOnDBToUpdate) {
              DBItem? itemToUpdate = await isar.dBItems.get(item.id);
              final blueprint4itemToUpdate = localVarOfUpdatedItems
                  .firstWhere((element) => element.id == item.id);
              itemToUpdate?.subCategoryName =
                  blueprint4itemToUpdate.selectedSubCategory!.title;
              itemToUpdate?.categoryName =
                  blueprint4itemToUpdate.selectedCategory!.title;
              await isar.dBItems.put(itemToUpdate!);
              print("+1");
            }
          });
        }
      }
    }
    {
      final List<ItemModel> allItems = await getAllItemsFromDB();
      final CategoriesEnum categoryEnum =
          CategoriesHelper.categoryToEnum(selectedCategory.title);
      final SubCategory initialSubCategory =
          CategoriesProvider().kSubCategoriesData[categoryEnum]![0];

      final List<ItemModel> listOfItemsToUpdate = allItems
          .where((item) =>
              item.selectedSubCategory!.title == selectedSubCategory.title)
          .map((item) {
        final updatedCategory = selectedCategory;
        final updatedSubCategory = isDeleting
            ? initialSubCategory
            : selectedSubCategory.updateTitle(newSubCategoryTitle!);
        return item.copyWith(
          selectedCategory: updatedCategory,
          selectedSubCategory: updatedSubCategory,
        );
      }).toList();
      print(listOfItemsToUpdate);

      await isar.writeTxn(() async {
        final itemsOfUpdatingSubCategory = await isar.dBItems
            .filter()
            .subCategoryNameEqualTo(selectedSubCategory.title)
            .findAll();
        for (ItemModel item in listOfItemsToUpdate) {
          DBItem? itemToUpdate = await isar.dBItems.get(
              itemsOfUpdatingSubCategory
                  .firstWhere((element) => element.id == item.id)
                  .id);
          itemToUpdate?.subCategoryName = isDeleting
              ? TextForLocalization.withoutSubCategory
              : newSubCategoryTitle!;
          await isar.dBItems.put(itemToUpdate!);
          print("+1");
        }
      });
    }
  }
 */