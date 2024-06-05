// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import '../../State_management/Providers/Provider_4_FI/_custom_provider_4fi_app.dart';
import '../../UI_Components/Cards_and_tiles/list_tile_4fi_app.dart';
import 'manager_of_questions.dart';

class ResultsScreen extends StatefulWidget {
  static const routeName = '/start_page/question_handler/fi_results';
  const ResultsScreen({super.key});

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  late QuestionAndAnswersProvider? questionsProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    questionsProvider = InheritedQuestionManager.of(context);
    if (questionsProvider == null) {
      print("Questions provider is null");
    } else {
      print(
          "Questions provider loaded with ${questionsProvider!.questions.length} questions");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (questionsProvider == null || questionsProvider!.questions.isEmpty) {
      print("No questions available or provider is not initialized.");
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Results'),
      ),
      body: questionsProvider != null && questionsProvider!.questions.isNotEmpty
          ? ListView.builder(
              itemCount: questionsProvider!.questions.length,
              itemBuilder: (context, index) {
                var question = questionsProvider!.questions[index];
                return CustomListTile(
                  isCorrectAnswer: question.isUserAnswerIsCorrect,
                  itemData: question,
                  questionIndex: index,
                  onEditPressed: (ctx) {},
                );
              },
            )
          : const Center(
              child: Text(
                "No results to display.",
              ),
            ),
    );
  }
}
