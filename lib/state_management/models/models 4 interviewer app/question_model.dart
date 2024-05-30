import 'package:json_annotation/json_annotation.dart';
part 'question_model.g.dart';

/*
for code generation run in terminal: 
flutter pub run build_runner build --delete-conflicting-outputs 
 */
@JsonSerializable()
class QuestionAndAnswersModel {
  // @JsonKey()
  final String text;
  final List<String> answers;

  QuestionAndAnswersModel(this.text, this.answers);

  List<String> get shuffledAnswers {
    final shuffledList = List.of(answers)..shuffle();
    return shuffledList;
  }

  factory QuestionAndAnswersModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionAndAnswersModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionAndAnswersModelToJson(this);
}
