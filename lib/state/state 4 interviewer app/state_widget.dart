import 'package:flutter/material.dart';
import 'models 4 interviewer app/app_state_model.dart';
import 'models 4 interviewer app/question_model.dart';
import 'strings_4_app.dart';

class DataProviderStateFull extends StatefulWidget {
  final Widget child;
  const DataProviderStateFull({super.key, required this.child});

  @override
  State<StatefulWidget> createState() => _StateWidgetState();
}

class _StateWidgetState extends State<DataProviderStateFull> {
  late final AppStateModel appState;

  @override
  void initState() {
    super.initState();
    appState = AppStateModel();
  }

  void setAnswer(String answer) {
    setState(() {
      appState = appState.copyWith(
        selectedAnswers: [...appState.selectedAnswers!, answer],
      );
    });
  }

  void setQuestionList(List<QuestionAndAnswersModel> selectedQuestionList) {
    setState(() {
      appState = appState.copyWith(selectedQuestions: selectedQuestionList);
    });
  }

  @override
  Widget build(BuildContext context) => DataProviderInherited(
        key: const Key(AppStrings.key4StateWidget),
        appState: appState,
        stateWidget: widget,
        child: widget.child,
      );
}

class DataProviderInherited extends InheritedWidget {
  final AppStateModel appState;
  final DataProviderStateFull stateWidget;

  const DataProviderInherited({
    super.key,
    required super.child,
    required this.appState,
    required this.stateWidget,
  });

  static AppStateModel? of(BuildContext context) {
    final DataProviderInherited? result =
        context.dependOnInheritedWidgetOfExactType<DataProviderInherited>();
    assert(result != null, AppStrings.inheritedWidgetNotFound);
    return result?.appState;
  }

  @override
  bool updateShouldNotify(DataProviderInherited oldWidget) =>
      oldWidget.appState != appState;
}
