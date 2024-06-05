import 'package:path_provider/path_provider.dart';
import 'package:isar/isar.dart';
import '../Models/models_4_tracker_on_isar /db_item_model.dart';

class IsarService {
  late Isar isar;

  Future<void> initializeIsar() async {
    final dir = await getApplicationSupportDirectory();
    isar = await Isar.open([DBItemSchema], directory: dir.path);
  }
}
