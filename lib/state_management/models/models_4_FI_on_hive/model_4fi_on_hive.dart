import 'package:hive/hive.dart';
part 'model_4fi_on_hive.g.dart';

@HiveType(typeId: 1)
class QuestionAndAnswersModelHive {
  @HiveField(0)
  final String questionText;
  @HiveField(1)
  final List<String> answers;
  @HiveField(2)
  String userAnswer;
  @HiveField(3)
  bool isUserAnswerIsCorrect;
  @HiveField(4)
  List<int> quantityOfCorrectAndTotalAnswersOfCurrentQuestion;
  @HiveField(5)
  double correctAnswerPercentage;

  QuestionAndAnswersModelHive({
    required this.questionText,
    required this.answers,
    this.userAnswer = '',
    this.isUserAnswerIsCorrect = false,
    this.quantityOfCorrectAndTotalAnswersOfCurrentQuestion = const [0, 0],
    this.correctAnswerPercentage = 0.0,
  });
}
/*
also we can set RELATIONSHIPs with other Hive Models (which have another "typeId", 
previously their Hive-adapters should be registered and Hive-boxes are opened)
for this u need to create new fields with this data of type of these new Hive Models 
 */
