// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// import '../../State_management/Const_data/strings_4_app.dart';
// import '../../State_management/Providers/_custom_provider_4fi_app.dart';
// import '../../State_management/Src/Helpers/helpers.dart';
// import '../../State_management/Theme_configuration/App_colors_palette/this_app_colors.dart';
// import '../../UI_Components/Cards_and_tiles/list_tile_4fi_app.dart';
// import '../../UI_Components/Images/pictures_widgets.dart';
// import '../../UI_Components/Static/mini_widgets.dart';
// import '../../UI_Components/Text_widgets/text_widgets2.dart';
// import 'manager_of_questions.dart';

// class ResultsScreen extends StatefulWidget {
//   static const routeName = '/start_page/fi_results';
//   const ResultsScreen({
//     super.key,
//   });

//   @override
//   State<ResultsScreen> createState() => _ResultsScreenState();
// }

// class _ResultsScreenState extends State<ResultsScreen> {
//   late TextTheme textTheme;
//   late ColorScheme colorScheme;
//   late bool isDarkMode;
//   late QuestionAndAnswersProvider questionsProvider;

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     textTheme = Helpers.textTheme(context);
//     colorScheme = Helpers.colorScheme(context);
//     isDarkMode = Helpers.isDarkTheme(context);
//     questionsProvider = InheritedQuestionManager.of(context)!;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.transparent,
//       child: Stack(
//         children: [
//           AppImages.getBackground(opacity: 0.3),
//           SafeArea(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 MiniWidgets.boldDivider(isDarkMode),

//                 TextWidgets.titleForResultScreen(
//                     context: context,
//                     numCorrectQuestions: questionsProvider.numCorrectQuestions,
//                     numTotalQuestions: questionsProvider.numTotalQuestions,
//                     colorScheme: colorScheme,
//                     textTheme: textTheme),

//                 Expanded(
//                     child: Scrollbar(
//                   child: ListView.builder(
//                     itemCount: questionsProvider.questions!.length,
//                     itemBuilder: (context, index) {
//                       var question = questionsProvider.questions![index];
//                       return CustomListTile(
//                         isCorrectAnswer: question.isUserAnswerIsCorrect,
//                         itemData: question,
//                         questionIndex: index,
//                         onEditPressed: (context) =>
//                             showDialogWihInfoOfThisQuestion(context, index,
//                                 questionsProvider, textTheme, colorScheme),
//                       );
//                     },
//                   ),
//                 )),

//                 MiniWidgets.boldDivider(isDarkMode),
//                 //
//                 Padding(
//                   padding: const EdgeInsets.only(top: 10.0, bottom: 15),
//                   child: TextButton.icon(
//                     onPressed: null,
//                     icon: Icon(
//                       Icons.refresh,
//                       color: colorScheme.primary,
//                     ),
//                     label: Text(
//                       AppStrings.restartQuiz,
//                       style: textTheme.titleLarge?.copyWith(
//                         color: colorScheme.primary,
//                         decoration: TextDecoration.underline,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   int get getNumberOfCorrectlyAnsweredQuestions {
//     //  write code of getter here
//     return 5;
//   }

//   void showDialogWihInfoOfThisQuestion(
//     BuildContext context,
//     int index,
//     QuestionAndAnswersProvider provider,
//     TextTheme textTheme,
//     ColorScheme colorScheme,
//   ) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return CupertinoAlertDialog(
//           title: Text(
//             provider.questions![index].isUserAnswerIsCorrect
//                 ? 'Correct!'
//                 : 'Incorrect',
//             style: textTheme.titleMedium?.copyWith(
//               color: provider.questions![index].isUserAnswerIsCorrect
//                   ? ThisAppColors.green
//                   : colorScheme.error,
//             ),
//           ),
//           content: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 10),
//               Text(
//                 (provider.questions![index].isUserAnswerIsCorrect)
//                     ? 'Your answer:'
//                     : 'Correct answer:',
//                 style: textTheme.bodySmall,
//               ),
//               Wrap(
//                 crossAxisAlignment: WrapCrossAlignment.center,
//                 runAlignment: WrapAlignment.center,
//                 alignment: WrapAlignment.center,
//                 children: [
//                   Text(
//                     ' ${provider.questions![index].correctAnswer()}',
//                     style: textTheme.titleMedium
//                         ?.copyWith(color: ThisAppColors.green),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 10),
//               RichText(
//                 text: TextSpan(
//                   text: 'You answered this question correctly in ',
//                   style: textTheme.bodySmall,
//                   children: [
//                     TextSpan(
//                       text:
//                           '${provider.questions![index].correctAnswerPercentage.toStringAsFixed(1)}%',
//                       style: textTheme.bodySmall
//                           ?.copyWith(color: ThisAppColors.green),
//                     ),
//                     TextSpan(
//                       text: ' of cases.',
//                       style: textTheme.bodySmall,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           actions: <Widget>[
//             CupertinoDialogAction(
//               isDefaultAction: true,
//               child: const Text('OK'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
