import 'package:hive/hive.dart';
part 'model_4_hive.g.dart';

@HiveType(typeId: 0)
class Person {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final int age;

  Person({required this.name, required this.age});
}
