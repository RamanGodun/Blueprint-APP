import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../State_management/Providers/Provider_4_FI/_custom_provider_4fi_app.dart';
import '../../State_management/Src/Helpers/helpers.dart';
import '../../State_management/Theme_configuration/App_colors_palette/this_app_colors.dart';
import 'manager_of_questions.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Helpers.textTheme(context);
    final colorScheme = Helpers.colorScheme(context);
    final deviceHeight = Helpers.deviceHeight(context);
    final provider = InheritedQuestionManager.of(context)!;
    final currentQuestion = provider.currentQuestion;

    if (currentQuestion == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(height: deviceHeight * 0.15),
            Flexible(
              flex: 2,
              child: Text(
                currentQuestion.questionText,
                style: textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: deviceHeight * 0.03),
            Flexible(
              flex: 6,
              child: Column(
                children: [
                  ...currentQuestion.shuffledAnswers.map((answer) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            provider.updateAnswer(answer);
                            showResultDialog(
                                context, provider, textTheme, colorScheme);
                          },
                          child: Text(answer, style: textTheme.bodyMedium),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showResultDialog(
      BuildContext context,
      QuestionAndAnswersProvider provider,
      TextTheme textTheme,
      ColorScheme colorScheme) {
    final currentQuestion = provider.currentQuestion!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return CupertinoAlertDialog(
          title: Text(
            currentQuestion.isUserAnswerIsCorrect ? 'Correct!' : 'Incorrect',
            style: textTheme.titleMedium?.copyWith(
              color: currentQuestion.isUserAnswerIsCorrect
                  ? ThisAppColors.green
                  : colorScheme.error,
            ),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(
                currentQuestion.isUserAnswerIsCorrect
                    ? 'Your answer:'
                    : 'Correct answer:',
                style: textTheme.bodySmall,
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                runAlignment: WrapAlignment.center,
                alignment: WrapAlignment.center,
                children: [
                  Text(
                    ' ${currentQuestion.correctAnswer()}',
                    style: textTheme.titleMedium
                        ?.copyWith(color: ThisAppColors.green),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'You answered this question correctly in ',
                  style: textTheme.bodySmall,
                  children: [
                    TextSpan(
                      text:
                          '${currentQuestion.correctAnswerPercentage.toStringAsFixed(1)}%',
                      style: textTheme.bodySmall
                          ?.copyWith(color: ThisAppColors.green),
                    ),
                    TextSpan(text: ' of cases.', style: textTheme.bodySmall),
                  ],
                ),
              ),
            ],
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              child: const Text('OK'),
              onPressed: () {
                if (currentQuestion.isUserAnswerIsCorrect) {
                  provider.increaseNumberOfCorrectAnswers();
                }
                provider.increaseNumberOfTotalQuestions();
                Navigator.pop(dialogContext);
                if (provider.currentQuestionIndex <
                    provider.questions.length - 1) {
                  provider.nextQuestion();
                } else {
                  context.push('/start_page/question_handler/fi_results');
                }
              },
            ),
          ],
        );
      },
    ).then((_) {
      if (provider.currentQuestionIndex >= provider.questions.length) {
        context.push('/start_page/question_handler/fi_results');
      }
    });
  }

//
}
