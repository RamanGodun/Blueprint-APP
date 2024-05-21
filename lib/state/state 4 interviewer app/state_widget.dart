import 'package:flutter/material.dart';
import 'models 4 interviewer app/app_state_model.dart';
import 'models 4 interviewer app/question_model.dart';

class DataProviderStateFull extends StatefulWidget {
  final Widget child;
  const DataProviderStateFull({super.key, required this.child});

  @override
  State<StatefulWidget> createState() => _StateWidgetState();

  static AppStateModel of(BuildContext context) {
    final _StateWidgetState? state =
        context.findAncestorStateOfType<_StateWidgetState>();
    assert(
        state != null, 'Cannot find DataProviderStateFull above this context');
    return state!.appState;
  }
}

class _StateWidgetState extends State<DataProviderStateFull> {
  late final AppStateModel appState;

  @override
  void initState() {
    super.initState();
    appState = AppStateModel(selectedAnswers: []);
  }

  void setAnswer(String answer) {
    setState(() {
      appState = appState
          .copyWith(selectedAnswers: [...?appState.selectedAnswers, answer]);
    });
  }

  void setQuestionList(List<QuestionAndAnswersModel> selectedQuestionList) {
    setState(() {
      appState = appState.copyWith(selectedQuestions: selectedQuestionList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DataProviderInherited(
      appState: appState,
      child: widget.child,
    );
  }
}

class DataProviderInherited extends InheritedWidget {
  final AppStateModel appState;

  const DataProviderInherited({
    super.key,
    required this.appState,
    required super.child,
  });

  static AppStateModel? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<DataProviderInherited>()
        ?.appState;
  }

  @override
  bool updateShouldNotify(DataProviderInherited oldWidget) =>
      oldWidget.appState != appState;
}
