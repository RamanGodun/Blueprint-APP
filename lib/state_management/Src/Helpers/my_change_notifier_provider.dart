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

class MyChangeNotifierProvider2<T extends ChangeNotifier>
    extends InheritedNotifier<T> {
  const MyChangeNotifierProvider2({
    super.key,
    required super.child,
    required T notifier,
  }) : super(notifier: notifier);

  static T? watch<T extends ChangeNotifier>(BuildContext context) {
    final provider = context
        .dependOnInheritedWidgetOfExactType<MyChangeNotifierProvider2<T>>();
    return provider?.notifier;
  }

  static T? read<T extends ChangeNotifier>(BuildContext context) {
    final provider = context
        .getElementForInheritedWidgetOfExactType<MyChangeNotifierProvider2<T>>()
        ?.widget as MyChangeNotifierProvider2<T>;
    return provider.notifier;
  }
}
