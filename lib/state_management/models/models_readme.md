## Щодо серіалізації

- **Додай імпорт та примітки**
  import 'package:json_annotation/json_annotation.dart';
  part 'item_model.g.dart';
  @JsonSerializable()

- **Вкажи методи у моделі і запусти команди з терміналу**
  factory ItemModel.fromJson(Map<String, dynamic> json) =>
  \_$ItemModelFromJson(json);

  Map<String, dynamic> toJson() => \_$ItemModelToJson(this);

/_
for code generation run in terminal:
flutter pub run build_runner build --delete-conflicting-outputs
_/

- **Особливості моделей HIVE**
  /\*
  (!!!)
  u can delete or rename fields, BUT
  NEVER change id (in this case @HiveField(0) index is 0),
  new indexes only for new fields,
  if field delete - never use it index later with other fields
  also never change type of fields

so, to avoid problems good practice write comments like this:
"removed field of index 3, type: String"
\*/
/_
also we can set RELATIONSHIPs with other Hive Models (which have another "typeId",
previously their Hive-adapters should be registered and Hive-boxes are opened)
for this u need to create new fields with this data of type of these new Hive Models
_/

- **Особливості моделей ISAR**
  /\*
  next line is needed to generate isar file (run cmd in terminal)
  " dart run build_runner build "
  or " flutter pub run build_runner build --delete-conflicting-outputs "

dependencies need to added
isar, isar_flutter_libs, path_provider, isar_generator, build_runner
\*/
