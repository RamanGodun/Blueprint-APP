import 'package:json_annotation/json_annotation.dart';
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

  ItemModel({
    this.id = -1,
    required this.name,
    this.quantity = 1,
    this.measurementUnit = "шт",
    this.totalAmount = 0,
    required this.date,
    this.isPurchase = true,
    this.isBlueprint = false,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemModelToJson(this);
}
