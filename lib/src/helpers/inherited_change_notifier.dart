import 'package:flutter/material.dart';

class ChangeNotifierProvider<T extends ChangeNotifier>
    extends InheritedNotifier<T> {
  const ChangeNotifierProvider({
    super.key,
    required super.child,
    required T notifier,
  }) : super(notifier: notifier);

  static T? watch<T extends ChangeNotifier>(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<ChangeNotifierProvider<T>>();
    return provider?.notifier;
  }

  static T? read<T extends ChangeNotifier>(BuildContext context) {
    final provider = context
        .getElementForInheritedWidgetOfExactType<ChangeNotifierProvider<T>>()
        ?.widget as ChangeNotifierProvider<T>;
    return provider.notifier;
  }
}
