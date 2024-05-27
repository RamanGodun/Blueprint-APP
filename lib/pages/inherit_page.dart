import 'package:flutter/material.dart';
import '../src/helpers/inherited_change_notifier.dart';
import '../state management/state 4 interviewer app/models 4 interviewer app/inherit_model.dart';

class WidgetWithInheritedMethods extends StatefulWidget {
  const WidgetWithInheritedMethods({super.key});

  @override
  State<WidgetWithInheritedMethods> createState() =>
      _WidgetWithInheritedMethodsState();
}

void goToNextQuestion(BuildContext context) {
  final inheritModel =
      ChangeNotifierProvider.watch<QuestionAndAnswersProvider>(context);
  if (inheritModel != null &&
      inheritModel.currentQuestion <
          (inheritModel.selectedQuestions?.length ?? 0) - 1) {
    inheritModel.setCurrentQuestion(inheritModel.currentQuestion + 1);
  }
}

void checkAnswer(BuildContext context, String userAnswer) {
  final inheritModel =
      ChangeNotifierProvider.watch<QuestionAndAnswersProvider>(context);
  if (inheritModel != null) {
    final correctAnswer = inheritModel
        .selectedQuestions?[inheritModel.currentQuestion].answers.first;
    inheritModel.setIsCurrentAnswerCorrect(userAnswer == correctAnswer);
  }
}

class _WidgetWithInheritedMethodsState
    extends State<WidgetWithInheritedMethods> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
