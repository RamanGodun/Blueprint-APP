import 'package:json_annotation/json_annotation.dart';
part 'question_model.g.dart';

@JsonSerializable()
class QuestionAndAnswersModel {
  final String questionText;
  final List<String> answers;
  String userAnswer;
  bool isUserAnswerIsCorrect;
  List<int> quantityOfCorrectAndTotalAnswersOfCurrentQuestion;
  double correctAnswerPercentage;

  QuestionAndAnswersModel({
    required this.questionText,
    required this.answers,
    this.userAnswer = '',
    this.isUserAnswerIsCorrect = false,
    this.quantityOfCorrectAndTotalAnswersOfCurrentQuestion = const [0, 0],
    this.correctAnswerPercentage = 0.0,
  }) {
    correctAnswerPercentage = _calculateCorrectAnswerPercentage();
  }

  double _calculateCorrectAnswerPercentage() {
    if (quantityOfCorrectAndTotalAnswersOfCurrentQuestion[1] == 0) {
      return 0.0;
    }
    return quantityOfCorrectAndTotalAnswersOfCurrentQuestion[0] /
        quantityOfCorrectAndTotalAnswersOfCurrentQuestion[1] *
        100;
  }

  List<String> get shuffledAnswers {
    final shuffledList = List.of(answers)..shuffle();
    return shuffledList;
  }

  void updateAnswer(String answer) {
    userAnswer = answer;
    isUserAnswerIsCorrect = (answer == correctAnswer());
    quantityOfCorrectAndTotalAnswersOfCurrentQuestion[1]++;
    if (isUserAnswerIsCorrect) {
      quantityOfCorrectAndTotalAnswersOfCurrentQuestion[0]++;
    }
    correctAnswerPercentage = _calculateCorrectAnswerPercentage();
  }

  String correctAnswer() {
    return answers.first;
  }

  factory QuestionAndAnswersModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionAndAnswersModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionAndAnswersModelToJson(this);
}
