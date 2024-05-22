class QuestionAndAnswersModel {
  const QuestionAndAnswersModel(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> get shuffledAnswers {
    final shuffledList = List.of(answers)..shuffle();
    return shuffledList;
  }
}
