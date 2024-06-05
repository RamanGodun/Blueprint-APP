import '../Models/models_4_FI_on_hive/question_model.dart';

class QuestionAndAnswers {
  static final listOfQuestionsAndAnswers = [
    QuestionAndAnswersModel(
      questionText: '     What are the main building blocks of Flutter UIs?',
      answers: [
        '     Widgets',
        '     Components',
        '     Blocks',
        '     Functions',
      ],
    ),
    QuestionAndAnswersModel(
      questionText: '     How are Flutter UIs built?',
      answers: [
        '     By combining widgets in code',
        '     By combining widgets in a visual editor',
        '     By defining widgets in config files',
        '     By using XCode for iOS and Android Studio for Android',
      ],
    ),
    QuestionAndAnswersModel(
      questionText: '     What\'s the purpose of a StatefulWidget?',
      answers: [
        '     Update UI as data changes',
        '     Update data as UI changes',
        '     Ignore data changes',
        '     Render UI that does not depend on data',
      ],
    ),
    QuestionAndAnswersModel(
      questionText:
          '     Which widget should you try to use more often: StatelessWidget or StatefulWidget?',
      answers: [
        '     StatelessWidget',
        '     StatefulWidget',
        '     Both are equally good',
        '     None of the above',
      ],
    ),
    QuestionAndAnswersModel(
      questionText:
          '     Which widget should you try to use more often: StatelessWidget or StatefulWidget? This must be long question',
      answers: [
        '     Here must be max long answer to check the UI rendering, ok?',
        '     StatefulWidget',
        '     Both are equally good',
        '     None of the above',
      ],
    ),
    QuestionAndAnswersModel(
      questionText:
          '     What happens if you change data in a StatelessWidget?',
      answers: [
        '     The UI is not updated',
        '     The UI is updated',
        '     The closest StatefulWidget is updated',
        '     Any nested StatefulWidgets are updated',
      ],
    ),
    QuestionAndAnswersModel(
      questionText:
          '     How should you update data inside of StatefulWidgets?',
      answers: [
        '     By calling setState()',
        '     By calling updateData()',
        '     By calling updateUI()',
        '     By calling updateState()',
      ],
    ),
  ];

  static List<QuestionAndAnswersModel> generateRandomQuestionsList(
      int selectedQuantityOfQuestions) {
    final shuffledListOfQuestionAndAnswers = List.of(listOfQuestionsAndAnswers)
      ..shuffle();
    final generateRandomQuestionsList = shuffledListOfQuestionAndAnswers
        .take(selectedQuantityOfQuestions)
        .toList();
    return generateRandomQuestionsList;
  }
//
}
