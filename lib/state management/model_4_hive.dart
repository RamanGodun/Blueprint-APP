import 'package:hive/hive.dart';

part 'model_4_hive.g.dart';

@HiveType(typeId: 0)
class Person {
/*
(!!!)
u can delete or rename fields, BUT
NEVER change id (in this case  @HiveField(0) index is 0),
new indexes only for new fields,
if field delete - never use it index later with other fields
also never change type of fields

so, to avoid problems good practice write comments like this:
"removed field of index 3, type: String"
 */

  @HiveField(0)
  final String name;

  @HiveField(1)
  final int age;

/*
also we can set RELATIONSHIPs with other Hive Models (which have another "typeId", 
previously their Hive-adapters should be registered and Hive-boxes are opened)
for this u need to create new fields with this data of type of these new Hive Models 
 */

  Person({required this.name, required this.age});
}
