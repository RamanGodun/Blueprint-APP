// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

import '../state management/model_4_hive.dart';

class HiveBoxPage extends StatefulWidget {
  static const routeName = '/hive_box';
  const HiveBoxPage({super.key});

  @override
  State<HiveBoxPage> createState() => _HiveBoxPageState();
}

class _HiveBoxPageState extends State<HiveBoxPage> {
  late Box<Person> box;

  @override
  void initState() {
    super.initState();
    box = GetIt.instance.get<Box<Person>>();
  }

  void _addPerson() {
    final person = Person(name: 'John Doe', age: 30);
    box.add(person);
    print('Person added: ${person.name}, Age: ${person.age}');
  }

  void _printFirstPerson() {
    final person = box.getAt(0);
    if (person != null) {
      print('Person retrieved: ${person.name}, Age: ${person.age}');
    } else {
      print('No person found at index 0');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hive Example'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: ElevatedButton(
                onPressed: _addPerson,
                child: const Text('Add Person'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: ElevatedButton(
                onPressed: _printFirstPerson,
                child: const Text('Print First Person'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
