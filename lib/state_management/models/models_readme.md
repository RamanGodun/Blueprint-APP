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
