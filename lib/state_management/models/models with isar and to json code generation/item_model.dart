import 'package:json_annotation/json_annotation.dart';

import 'category_model.dart';
part 'item_model.g.dart';

/*
for code generation run in terminal: 
flutter pub run build_runner build --delete-conflicting-outputs 
 */
@JsonSerializable()
class ItemModel {
  // @JsonKey()
  int id;
  final String name;
  double quantity;
  final String measurementUnit;
  double totalAmount;
  final DateTime date;
  bool isPurchase;
  bool isBlueprint;
  Category? selectedCategory;

  ItemModel({
    this.id = -1,
    required this.name,
    this.quantity = 1,
    this.measurementUnit = "шт",
    this.totalAmount = 0,
    required this.date,
    this.isPurchase = true,
    this.isBlueprint = false,
    this.selectedCategory,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemModelToJson(this);
}

/*
import '../../src/utils/categories_helper.dart';
import '../../src/utils/text_4_localization.dart';
import 'category_model.dart';
import 'db_item.dart';

class ItemModel {
  int id;
  int id4Order;
  final String name;
  double quantity;
  final String measurementUnit;
  double totalAmount;
  double amount;
  final DateTime date;
  final bool isPurchase;
  final bool isBlueprint;
  Category? selectedCategory;
  SubCategory? selectedSubCategory;

  ItemModel({
    this.id = -1,
    this.id4Order = -1,
    required this.name,
    this.quantity = 1,
    this.measurementUnit = "шт",
    this.totalAmount = 0,
    this.amount = 0,
    required this.date,
    this.selectedCategory,
    this.selectedSubCategory,
    this.isPurchase = true,
    this.isBlueprint = false,
  }) {
    calculateTotalAmount();
  }

  DBItem toDBItem() {
    return DBItem(
      id4Order: id4Order,
      name: name,
      quantity: quantity,
      measurementUnit: measurementUnit,
      totalAmount: totalAmount,
      amount: amount,
      date: date,
      categoryName: selectedCategory!.title,
      isPurchase: isPurchase,
      isBlueprint: isBlueprint,
      subCategoryName:
          selectedSubCategory?.title ?? TextForLocalization.withoutSubCategory,
    );
  }

  factory ItemModel.fromDBItem(DBItem dbItem) {
    final selectedCategory = CategoriesHelper.getCategoryFromDBItem(dbItem);
    final selectedSubCategory =
        CategoriesHelper.getSubCategoryFromDBItem(dbItem);

    return ItemModel(
      id: dbItem.id,
      id4Order: dbItem.id4Order,
      name: dbItem.name,
      quantity: dbItem.quantity,
      measurementUnit: dbItem.measurementUnit,
      totalAmount: dbItem.totalAmount,
      amount: dbItem.amount,
      date: dbItem.date,
      selectedCategory: selectedCategory,
      selectedSubCategory: selectedSubCategory,
      isPurchase: dbItem.isPurchase,
      isBlueprint: dbItem.isBlueprint,
    );
  }

  ItemModel copyWith({
    int? id,
    int? id4Order,
    String? name,
    double? quantity,
    String? measurementUnit,
    double? totalAmount,
    double? amount,
    DateTime? date,
    Category? selectedCategory,
    SubCategory? selectedSubCategory,
    bool? isPurchase,
    bool? isBlueprint,
  }) {
    return ItemModel(
      id: id ?? this.id,
      id4Order: id4Order ?? this.id4Order,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      measurementUnit: measurementUnit ?? this.measurementUnit,
      totalAmount: totalAmount ?? this.totalAmount,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      selectedSubCategory: selectedSubCategory ?? this.selectedSubCategory,
      isPurchase: isPurchase ?? this.isPurchase,
      isBlueprint: isBlueprint ?? this.isBlueprint,
    );
  }

  void calculateTotalAmount() {
    totalAmount = amount * quantity;
  }
//
}

 */