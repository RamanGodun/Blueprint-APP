// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'manager_of_questions.dart';
import 'questions_widget.dart';

class QuestionHandler extends StatelessWidget {
  static const routeName = '/start_page/question_handler';

  const QuestionHandler({super.key});

  @override
  Widget build(BuildContext context) {
    return const InheritedQuestionManager(
      child: GetContextForInherited(),
    );
  }
}

class GetContextForInherited extends StatelessWidget {
  const GetContextForInherited({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Builder(
        builder: (context) {
          final provider = InheritedQuestionManager.of(context);
          final currentQuestion = provider?.currentQuestion;
          print(
              'Current question is: ${currentQuestion?.questionText ?? "null"}');
          if (currentQuestion == null) {
            print('No current question available, showing loading indicator.');
            return const Center(child: CircularProgressIndicator());
          }
          return const QuestionWidget();
        },
      ),
    );
  }
}
