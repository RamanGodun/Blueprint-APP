import 'package:path_provider/path_provider.dart';
import 'package:isar/isar.dart';
import '../models/models with isar and to json code generation/db_item.dart';

class IsarService {
  late Isar isar;

  Future<void> initializeIsar() async {
    final dir = await getApplicationSupportDirectory();
    isar = await Isar.open([DBItemSchema], directory: dir.path);
  }
}
