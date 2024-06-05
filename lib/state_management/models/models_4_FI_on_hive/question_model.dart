import 'package:json_annotation/json_annotation.dart';
part 'question_model.g.dart';

/*
for code generation run in terminal: 
flutter pub run build_runner build --delete-conflicting-outputs 
*/
@JsonSerializable()
class QuestionAndAnswersModel {
  final String questionText;
  final List<String> answers;
  int currentQuestion;
  String userAnswer;
  bool isUserAnswerIsCorrect;
  List<int>
      quantityOfCorrectAndTotalAnswersOfCurrentQuestion; // in such way will be [1, 5]
  double correctAnswerPercentage;

  QuestionAndAnswersModel({
    required this.questionText,
    required this.answers,
    this.currentQuestion = 0,
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


/*
Оновлення завантаження даних з локальної бази
Future<List<QuestionAndAnswersModel>> loadQuestionsFromDatabase() async {
  // Завантажте JSON з локальної бази даних
  final jsonData = await fetchJsonFromDatabase();
  // Конвертуйте JSON у список моделей
  final questions = (jsonData as List)
      .map((json) => QuestionAndAnswersModel.fromJson(json))
      .toList();
  return questions;
}

Future<List<Map<String, dynamic>>> fetchJsonFromDatabase() async {
  // Реалізуйте цей метод для отримання JSON з вашої бази даних
  // Це може бути Hive, SQLite або будь-яка інша база даних
  return [];
}

 */