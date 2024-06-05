// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_4fi_on_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuestionAndAnswersModelHiveAdapter
    extends TypeAdapter<QuestionAndAnswersModelHive> {
  @override
  final int typeId = 1;

  @override
  QuestionAndAnswersModelHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuestionAndAnswersModelHive(
      questionText: fields[0] as String,
      answers: (fields[1] as List).cast<String>(),
      userAnswer: fields[2] as String,
      isUserAnswerIsCorrect: fields[3] as bool,
      quantityOfCorrectAndTotalAnswersOfCurrentQuestion:
          (fields[4] as List).cast<int>(),
      correctAnswerPercentage: fields[5] as double,
    );
  }

  @override
  void write(BinaryWriter writer, QuestionAndAnswersModelHive obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.questionText)
      ..writeByte(1)
      ..write(obj.answers)
      ..writeByte(2)
      ..write(obj.userAnswer)
      ..writeByte(3)
      ..write(obj.isUserAnswerIsCorrect)
      ..writeByte(4)
      ..write(obj.quantityOfCorrectAndTotalAnswersOfCurrentQuestion)
      ..writeByte(5)
      ..write(obj.correctAnswerPercentage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuestionAndAnswersModelHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
