import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import '../../state_management/models/model_4_hive.dart';

class HiveBoxPage extends StatefulWidget {
  final Box<Person> box;
  static const routeName = '/start_page/hive_box';

  const HiveBoxPage({super.key, required this.box});

  @override
  State<HiveBoxPage> createState() => _HiveBoxPageState();
}

class _HiveBoxPageState extends State<HiveBoxPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Hive Example'),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: CupertinoButton.filled(
                onPressed: _addPerson,
                child: const Text('Add Person'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: CupertinoButton.filled(
                onPressed: _printFirstPerson,
                child: const Text('Print Person'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addPerson() {
    final person = Person(name: 'John Doe', age: 30);
    widget.box.put("person", person);
    // print('Person added: ${person.name}, Age: ${person.age}');
  }

  void _printFirstPerson() {
    final person = widget.box.get("person");
    if (person != null) {
      // print('Person retrieved: ${person.name}, Age: ${person.age}');
    } else {
      // print('No person found at index 0');
    }
  }

  @override
  void dispose() {
    widget.box.compact(); // to delete temporary trash
    widget.box.close();
    super.dispose();
  }
}
