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
Important (!)
u can delete or rename fields, BUT
NEVER change id (in this case  @HiveField(0) index is 0),
new indexes only for new fields,
if field delete - never use it index later with other fields
also never change type of fields

so, to avoid problems good practice write comments like this:
"removed field of index 3, type: String"


also we can set RELATIONSHIPs with other Hive Models (which have another "typeId", 
previously their Hive-adapters should be registered and Hive-boxes are opened)
for this u need to create new fields with this data of type of these new Hive Models 
 */
