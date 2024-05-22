import 'package:flutter/foundation.dart';
import 'question_model.dart';

class AppStateModel {
  final List<QuestionAndAnswersModel>? selectedQuestions;
  final List<String>? selectedAnswers;
  final int currentQuestion;
  final bool isCurrentAnswerCorrect;

  AppStateModel({
    this.selectedQuestions = const [],
    this.selectedAnswers = const <String>[],
    this.currentQuestion = 0,
    this.isCurrentAnswerCorrect = false,
  });

  AppStateModel copyWith({
    List<QuestionAndAnswersModel>? selectedQuestions,
    List<String>? selectedAnswers,
    int? currentQuestion,
    bool? isCurrentAnswerCorrect,
  }) =>
      AppStateModel(
        selectedQuestions: selectedQuestions ?? this.selectedQuestions,
        selectedAnswers: selectedAnswers ?? this.selectedAnswers,
        currentQuestion: currentQuestion ?? this.currentQuestion,
        isCurrentAnswerCorrect:
            isCurrentAnswerCorrect ?? this.isCurrentAnswerCorrect,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppStateModel &&
          runtimeType == other.runtimeType &&
          listEquals(selectedAnswers, other.selectedAnswers) &&
          listEquals(selectedQuestions, other.selectedQuestions) &&
          currentQuestion == other.currentQuestion &&
          isCurrentAnswerCorrect == other.isCurrentAnswerCorrect;

  @override
  int get hashCode =>
      selectedAnswers.hashCode ^
      selectedQuestions.hashCode ^
      currentQuestion.hashCode ^
      isCurrentAnswerCorrect.hashCode;
}
