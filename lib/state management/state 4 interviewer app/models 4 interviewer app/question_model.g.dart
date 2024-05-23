// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionAndAnswersModel _$QuestionAndAnswersModelFromJson(
        Map<String, dynamic> json) =>
    QuestionAndAnswersModel(
      json['text'] as String,
      (json['answers'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$QuestionAndAnswersModelToJson(
        QuestionAndAnswersModel instance) =>
    <String, dynamic>{
      'text': instance.text,
      'answers': instance.answers,
    };
