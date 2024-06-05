// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionAndAnswersModel _$QuestionAndAnswersModelFromJson(
        Map<String, dynamic> json) =>
    QuestionAndAnswersModel(
      questionText: json['questionText'] as String,
      answers:
          (json['answers'] as List<dynamic>).map((e) => e as String).toList(),
      currentQuestion: (json['currentQuestion'] as num?)?.toInt() ?? 0,
      userAnswer: json['userAnswer'] as String? ?? '',
      isUserAnswerIsCorrect: json['isUserAnswerIsCorrect'] as bool? ?? false,
      quantityOfCorrectAndTotalAnswersOfCurrentQuestion:
          (json['quantityOfCorrectAndTotalAnswersOfCurrentQuestion']
                      as List<dynamic>?)
                  ?.map((e) => (e as num).toInt())
                  .toList() ??
              const [0, 0],
      correctAnswerPercentage:
          (json['correctAnswerPercentage'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$QuestionAndAnswersModelToJson(
        QuestionAndAnswersModel instance) =>
    <String, dynamic>{
      'questionText': instance.questionText,
      'answers': instance.answers,
      'currentQuestion': instance.currentQuestion,
      'userAnswer': instance.userAnswer,
      'isUserAnswerIsCorrect': instance.isUserAnswerIsCorrect,
      'quantityOfCorrectAndTotalAnswersOfCurrentQuestion':
          instance.quantityOfCorrectAndTotalAnswersOfCurrentQuestion,
      'correctAnswerPercentage': instance.correctAnswerPercentage,
    };
