import 'package:flutter/foundation.dart';
import 'question_model.dart';

class AppStateModel {
  final List<QuestionAndAnswersModel>? selectedQuestions;
  final List<String>? selectedAnswers;
  AppStateModel(
      {this.selectedQuestions = const [],
      this.selectedAnswers = const <String>[]});

  AppStateModel copyWith({
    List<QuestionAndAnswersModel>? selectedQuestions,
    List<String>? selectedAnswers,
  }) =>
      AppStateModel(
        selectedQuestions: selectedQuestions ?? this.selectedQuestions,
        selectedAnswers: selectedAnswers ?? this.selectedAnswers,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppStateModel &&
          runtimeType == other.runtimeType &&
          listEquals(selectedAnswers, other.selectedAnswers) &&
          listEquals(selectedQuestions, other.selectedQuestions);

  @override
  int get hashCode => selectedAnswers.hashCode ^ selectedQuestions.hashCode;
}
