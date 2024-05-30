import 'package:isar/isar.dart';
import '../../const_data/strings_4_app.dart';
part 'db_item.g.dart';

@Collection()
class DBItem {
  Id id = Isar.autoIncrement;
  int id4Order;
  final String name;
  final double quantity;
  final String measurementUnit;
  final double amount;
  final double totalAmount;
  final DateTime date;
  final bool isPurchase;
  final bool isBlueprint;
  String categoryName;
  String subCategoryName;

  DBItem({
    required this.name,
    this.id4Order = 0,
    this.quantity = 1,
    this.measurementUnit = AppStrings.pieces,
    this.amount = 0,
    this.totalAmount = 0,
    required this.date,
    this.isPurchase = true,
    this.isBlueprint = false,
    this.categoryName = AppStrings.other,
    this.subCategoryName = AppStrings.withoutSubCategory,
  });
}

/*
next line is needed to generate isar file (run cmd in terminal)
" dart run build_runner build "
or " flutter pub run build_runner build --delete-conflicting-outputs  "

dependencies need to added
   isar, isar_flutter_libs, path_provider, isar_generator, build_runner
 */