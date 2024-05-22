import 'package:flutter/material.dart';
import '../../src/helpers/inherited_change_notifier.dart';
import 'models 4 interviewer app/inherit_model.dart';

class InheritedWidgetManager extends StatefulWidget {
  final Widget child;
  const InheritedWidgetManager({super.key, required this.child});

  @override
  State<InheritedWidgetManager> createState() => _InheritedWidgetManagerState();
}

class _InheritedWidgetManagerState extends State<InheritedWidgetManager> {
  late final InheritModel inheritModel;

  @override
  void initState() {
    super.initState();
    inheritModel = InheritModel();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<InheritModel>(
      notifier: inheritModel,
      child: widget.child,
    );
  }
}
