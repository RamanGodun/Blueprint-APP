import 'package:flutter/foundation.dart';
import 'models 4 interviewer app/question_model.dart';

class QuestionAndAnswersProvider extends ChangeNotifier {
  List<QuestionAndAnswersModel>? _selectedQuestions;
  List<String>? _selectedAnswers;
  List<bool>? _listOfIsCorrectAnswer;
  int _currentQuestion = 0;
  bool _isCurrentAnswerCorrect = false;

  List<QuestionAndAnswersModel>? get selectedQuestions => _selectedQuestions;
  List<String>? get selectedAnswers => _selectedAnswers;
  List<bool>? get listOfIsCorrectAnswer => _listOfIsCorrectAnswer;
  int get currentQuestion => _currentQuestion;
  bool get isCurrentAnswerCorrect => _isCurrentAnswerCorrect;

  void setSelectedQuestions(List<QuestionAndAnswersModel> questions) {
    _selectedQuestions = questions;
    notifyListeners();
  }

  void addAnswer(String answer) {
    _selectedAnswers = [..._selectedAnswers ?? [], answer];
    notifyListeners();
  }

  void setCurrentQuestion(int questionIndex) {
    _currentQuestion = questionIndex;
    notifyListeners();
  }

  void setIsCurrentAnswerCorrect(bool isCorrect) {
    _isCurrentAnswerCorrect = isCorrect;
    notifyListeners();
  }
}
