import 'package:flutter/material.dart';

import '../../State_management/Const_data/data_4_questions.dart';
import '../../State_management/Const_data/strings_4_app.dart';
import '../../State_management/Src/Helpers/helpers.dart';
import '../../UI_Components/Cards_and_tiles/list_tile_2.dart';
import '../../UI_Components/Images/pictures_widgets.dart';
import '../../UI_Components/Static/mini_widgets.dart';
import '../../UI_Components/Text_widgets/text_widgets2.dart';

class ResultsScreen extends StatefulWidget {
  final void Function() onRestart;
  final List<String> chosenAnswers;
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  late TextTheme textTheme;
  late ColorScheme colorScheme;
  late int numTotalQuestions;
  late int numCorrectQuestions;
  late bool isDarkMode;

  @override
  void initState() {
    super.initState();
    numTotalQuestions = QuestionAndAnswers.listOfQuestionsAndAnswers.length;
    numCorrectQuestions = summaryData
        .where((data) => data['user_answer'] == data['correct_answer'])
        .length;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    textTheme = Helpers.textTheme(context);
    colorScheme = Helpers.colorScheme(context);
    isDarkMode = Helpers.isDarkTheme(context);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          AppImages.getBackground(opacity: 0.3),
          SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MiniWidgets.boldDivider(isDarkMode),

                TextWidgets.titleForResultScreen(
                    context: context,
                    numCorrectQuestions: numCorrectQuestions,
                    numTotalQuestions: numTotalQuestions,
                    colorScheme: colorScheme,
                    textTheme: textTheme),

                Expanded(
                    child: Scrollbar(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 10, bottom: 25),
                    itemCount: summaryData.length,
                    itemBuilder: (context, index) {
                      final itemData = summaryData[index];
                      final isCorrectAnswer =
                          itemData['user_answer'] == itemData['correct_answer'];

                      return Container(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 5, top: 15, bottom: 5),
                        child: CustomListTile(
                          isCorrectAnswer: isCorrectAnswer,
                          itemData: itemData,
                          onEditPressed: null,
                        ),
                      );
                    },
                  ),
                )),

                MiniWidgets.boldDivider(isDarkMode),
                //
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 15),
                  child: TextButton.icon(
                    onPressed: widget.onRestart,
                    icon: Icon(
                      Icons.refresh,
                      color: colorScheme.primary,
                    ),
                    label: Text(
                      AppStrings.restartQuiz,
                      style: textTheme.titleLarge?.copyWith(
                        color: colorScheme.primary,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = <Map<String, Object>>[];
    for (var i = 0; i < widget.chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': QuestionAndAnswers.listOfQuestionsAndAnswers[i].text,
          'correct_answer':
              QuestionAndAnswers.listOfQuestionsAndAnswers[i].answers[0],
          'user_answer': widget.chosenAnswers[i],
        },
      );
    }
    return summary;
  }
}


/*
Враховуючи це, якщо значення summaryData не змінюється під час життєвого циклу об'єкта та може бути визначене як константа, 
то краще залишити його як гетер та додати ключове слово const перед конструктором. 
Таким чином, ми зможемо забезпечити ефективність та консистентність коду.

Однак, якщо summaryData може змінюватися під час життєвого циклу об'єкта або не може бути визначено як константа,
 тоді перенесення логіки обчислення у конструктор без ключового слова const може бути прийнятним компромісом 
між продуктивністю та зручністю.


АЛЬТЕРНАТИВНИЙ ВАРІАНТ
class ResultsScreen extends StatelessWidget {
  final void Function() onRestart;
  final List<String> chosenAnswers;
  final List<Map<String, Object>> summaryData;

  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  })  : summaryData = _generateSummaryData(chosenAnswers);

  static List<Map<String, Object>> _generateSummaryData(
      List<String> chosenAnswers) {
    final List<Map<String, Object>> summary = <Map<String, Object>>[];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': QuestionAndAnswers.listOfQuestionsAndAnswers[i].text,
          'correct_answer':
              QuestionAndAnswers.listOfQuestionsAndAnswers[i].answers[0],
          'user_answer': chosenAnswers[i],
        },
      );
    }
    return summary;
  }
 */