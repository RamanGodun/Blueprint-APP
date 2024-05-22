import 'package:flutter/material.dart';
import 'inherit.dart';
import 'models 4 interviewer app/inherit_model.dart';
import 'models 4 interviewer app/question_model.dart';

class InheritedWidgetManager extends StatefulWidget {
  final Widget child;
  const InheritedWidgetManager({super.key, required this.child});

  @override
  State<InheritedWidgetManager> createState() => _InheritedWidgetManagerState();

  static InheritModel of(BuildContext context) {
    final _InheritedWidgetManagerState? state =
        context.findAncestorStateOfType<_InheritedWidgetManagerState>();
    assert(
        state != null, 'Cannot find DataProviderStateFull above this context');
    return state!.inheritModel;
  }
}

class _InheritedWidgetManagerState extends State<InheritedWidgetManager> {
  late final InheritModel inheritModel;

  @override
  void initState() {
    super.initState();
    inheritModel = InheritModel(selectedAnswers: []);
  }

  @override
  Widget build(BuildContext context) {
    return InheritedModelProvider(
      stateOfInheritedModel: inheritModel,
      child: widget.child,
    );
  }

// Methods for arguments changing
  void setAnswer(String answer) {
    setState(() {
      inheritModel = inheritModel.copyWith(
          selectedAnswers: [...?inheritModel.selectedAnswers, answer]);
    });
  }

  void setQuestionList(List<QuestionAndAnswersModel> selectedQuestionList) {
    setState(() {
      inheritModel =
          inheritModel.copyWith(selectedQuestions: selectedQuestionList);
    });
  }
}
