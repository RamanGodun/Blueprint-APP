// ignore_for_file: avoid_print

import 'package:flutter/foundation.dart';
import '../Models/models_4_FI_on_hive/question_model.dart';

class QuestionAndAnswersProvider extends ChangeNotifier {
  QuestionAndAnswersProvider() {
    print("QuestionAndAnswersProvider initialized");
  }
  List<QuestionAndAnswersModel> _questions = [];
  int _currentQuestionIndex = 0;
  int _numCorrectAnswers = 0;
  int _numTotalQuestions = 0;

  List<QuestionAndAnswersModel> get questions => _questions;
  int get currentQuestionIndex => _currentQuestionIndex;
  int get numCorrectAnswers => _numCorrectAnswers;
  int get numTotalQuestions => _numTotalQuestions;
  QuestionAndAnswersModel? get currentQuestion =>
      _questions.isNotEmpty ? _questions[_currentQuestionIndex] : null;

  void setQuestions(List<QuestionAndAnswersModel> questions) {
    _questions = questions;
    notifyListeners();
  }

  void updateAnswer(String answer) {
    if (_questions.isNotEmpty) {
      var current = _questions[_currentQuestionIndex];
      current.userAnswer = answer;
      current.isUserAnswerIsCorrect = (answer == correctAnswer());
      current.quantityOfCorrectAndTotalAnswersOfCurrentQuestion[1]++;
      if (current.isUserAnswerIsCorrect) {
        current.quantityOfCorrectAndTotalAnswersOfCurrentQuestion[0]++;
      }
      current.correctAnswerPercentage =
          _calculateCorrectAnswerPercentage(current);
      notifyListeners();
    }
  }

  String correctAnswer() {
    return _questions[_currentQuestionIndex].answers.first;
  }

  double _calculateCorrectAnswerPercentage(QuestionAndAnswersModel question) {
    if (question.quantityOfCorrectAndTotalAnswersOfCurrentQuestion[1] == 0) {
      return 0.0;
    }
    return (question.quantityOfCorrectAndTotalAnswersOfCurrentQuestion[0] /
            question.quantityOfCorrectAndTotalAnswersOfCurrentQuestion[1]) *
        100;
  }

  List<String> get shuffledAnswers {
    return List.of(_questions[_currentQuestionIndex].answers)..shuffle();
  }

  void nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      _currentQuestionIndex++;
      notifyListeners();
    }
  }

  void prevQuestion() {
    if (_currentQuestionIndex > 0) {
      _currentQuestionIndex--;
      notifyListeners();
    }
  }

  void increaseNumberOfCorrectAnswers() {
    _numCorrectAnswers++;
    notifyListeners();
  }

  void increaseNumberOfTotalQuestions() {
    _numTotalQuestions++;
    notifyListeners();
  }
}
