import 'model_4fi_on_hive.dart';
import 'question_model.dart';

class QuestionModelAdapter {
  static QuestionAndAnswersModel fromHiveModel(
      QuestionAndAnswersModelHive hiveModel) {
    return QuestionAndAnswersModel(
      questionText: hiveModel.questionText,
      answers: hiveModel.answers,
      userAnswer: hiveModel.userAnswer,
      isUserAnswerIsCorrect: hiveModel.isUserAnswerIsCorrect,
      quantityOfCorrectAndTotalAnswersOfCurrentQuestion:
          hiveModel.quantityOfCorrectAndTotalAnswersOfCurrentQuestion,
      correctAnswerPercentage: hiveModel.correctAnswerPercentage,
    );
  }

  static QuestionAndAnswersModelHive toHiveModel(
      QuestionAndAnswersModel model) {
    return QuestionAndAnswersModelHive(
      questionText: model.questionText,
      answers: model.answers,
      userAnswer: model.userAnswer,
      isUserAnswerIsCorrect: model.isUserAnswerIsCorrect,
      quantityOfCorrectAndTotalAnswersOfCurrentQuestion:
          model.quantityOfCorrectAndTotalAnswersOfCurrentQuestion,
      correctAnswerPercentage: model.correctAnswerPercentage,
    );
  }
}
