import 'package:flutter/material.dart';

class MyChangeNotifierProvider<T extends ValueNotifier<Object?>>
    extends InheritedNotifier<T> {
  const MyChangeNotifierProvider({
    super.key,
    required super.child,
    required T notifier,
  }) : super(notifier: notifier);

  static T? watch<T extends ValueNotifier<Object?>>(BuildContext context) {
    final provider = context
        .dependOnInheritedWidgetOfExactType<MyChangeNotifierProvider<T>>();
    return provider?.notifier;
  }

  static T? read<T extends ValueNotifier<Object?>>(BuildContext context) {
    final provider = context
        .getElementForInheritedWidgetOfExactType<MyChangeNotifierProvider<T>>()
        ?.widget as MyChangeNotifierProvider<T>;
    return provider.notifier;
  }
}
