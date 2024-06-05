// ignore_for_file: avoid_print

import 'package:blueprint_4app/UI_Components/Static/static_widgets.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../State_management/Const_data/data_4_questions.dart';
import '../../State_management/Models/models_4_FI_on_hive/hive_adapter.dart';
import '../../State_management/Models/models_4_FI_on_hive/model_4fi_on_hive.dart';
import '../../State_management/Services/0.service_locator.dart';
import '../../State_management/Src/Helpers/Common/my_change_notifier_provider.dart';
import '../../State_management/Providers/Provider_4_FI/_custom_provider_4fi_app.dart';
import '../../State_management/Models/models_4_FI_on_hive/question_model.dart';

class InheritedQuestionManager extends StatefulWidget {
  final Widget child;
  const InheritedQuestionManager({required this.child, super.key});

  @override
  State<InheritedQuestionManager> createState() =>
      InheritedQuestionManagerState();

  static QuestionAndAnswersProvider? of(BuildContext context) {
    return MyChangeNotifierProvider2.watch<QuestionAndAnswersProvider>(context);
  }
}

class InheritedQuestionManagerState extends State<InheritedQuestionManager> {
  late QuestionAndAnswersProvider questionProvider;
  Future? _initQuestionsFuture;

  @override
  void initState() {
    super.initState();
    questionProvider = QuestionAndAnswersProvider();
    _initQuestionsFuture = _loadQuestions();
  }

  Future<void> _loadQuestions() async {
    final questionsBox =
        DIServiceLocator.instance.get<Box<QuestionAndAnswersModelHive>>();
    print('Loading questions from the database...');
    if (questionsBox.isEmpty) {
      print('Questions box is empty, adding initial questions.');
      List<QuestionAndAnswersModelHive> hiveQuestions = QuestionAndAnswers
          .listOfQuestionsAndAnswers
          .map((model) => QuestionModelAdapter.toHiveModel(model))
          .toList();
      await questionsBox.addAll(hiveQuestions);
    }
    List<QuestionAndAnswersModel> questions = questionsBox.values
        .map((hiveModel) => QuestionModelAdapter.fromHiveModel(hiveModel))
        .toList();
    questionProvider.setQuestions(questions);
    print('Questions loaded and set: ${questions.length}');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initQuestionsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          print('Still waiting for questions to load...');
          return const Center(child: StaticWidgets.loadingWidget);
        }
        if (snapshot.hasError) {
          print('Error loading questions: ${snapshot.error}');
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Error loading questions: ${snapshot.error.toString()}'),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    print('Retrying to load questions...');
                    setState(() {
                      _initQuestionsFuture = _loadQuestions();
                    });
                  },
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }
        print('Questions loaded successfully, providing to children.');
        return MyChangeNotifierProvider2(
          notifier: questionProvider,
          child: widget.child,
        );
      },
    );
  }
}
