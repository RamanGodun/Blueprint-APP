import '../models/models 4 interviewer app/question_model.dart';

class QuestionAndAnswers {
  final listOfQuestionsAndAnswers = [
    QuestionAndAnswersModel(
      '     What are the main building blocks of Flutter UIs?',
      [
        '     Widgets',
        '     Components',
        '     Blocks',
        '     Functions',
      ],
    ),
    QuestionAndAnswersModel(
      '     How are Flutter UIs built?',
      [
        '     By combining widgets in code',
        '     By combining widgets in a visual editor',
        '     By defining widgets in config files',
        '     By using XCode for iOS and Android Studio for Android',
      ],
    ),
    QuestionAndAnswersModel(
      '     What\'s the purpose of a StatefulWidget?',
      [
        '     Update UI as data changes',
        '     Update data as UI changes',
        '     Ignore data changes',
        '     Render UI that does not depend on data',
      ],
    ),
    QuestionAndAnswersModel(
      '     Which widget should you try to use more often: StatelessWidget or StatefulWidget?',
      [
        '     StatelessWidget',
        '     StatefulWidget',
        '     Both are equally good',
        '     None of the above',
      ],
    ),
    QuestionAndAnswersModel(
      '     Which widget should you try to use more often: StatelessWidget or StatefulWidget? This must be long question',
      [
        '     Here must be max long answer to check the UI rendering, ok?',
        '     StatefulWidget',
        '     Both are equally good',
        '     None of the above',
      ],
    ),
    QuestionAndAnswersModel(
      '     What happens if you change data in a StatelessWidget?',
      [
        '     The UI is not updated',
        '     The UI is updated',
        '     The closest StatefulWidget is updated',
        '     Any nested StatefulWidgets are updated',
      ],
    ),
    QuestionAndAnswersModel(
      '     How should you update data inside of StatefulWidgets?',
      [
        '     By calling setState()',
        '     By calling updateData()',
        '     By calling updateUI()',
        '     By calling updateState()',
      ],
    ),
  ];

  List<QuestionAndAnswersModel> generateRandomQuestionsList(
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
