import 'package:flutter/material.dart';
import '../src/helpers/inherited_change_notifier.dart';
import 'models/inherit_model.dart';

class InheritedWidgetManager extends StatefulWidget {
  final Widget child;
  const InheritedWidgetManager({super.key, required this.child});

  @override
  State<InheritedWidgetManager> createState() => _InheritedWidgetManagerState();
}

class _InheritedWidgetManagerState extends State<InheritedWidgetManager> {
  late final QuestionAndAnswersProvider inheritModel;

  @override
  void initState() {
    super.initState();
    inheritModel = QuestionAndAnswersProvider();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuestionAndAnswersProvider>(
      notifier: inheritModel,
      child: widget.child,
    );
  }
}
