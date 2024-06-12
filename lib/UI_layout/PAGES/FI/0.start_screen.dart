import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../Components/Buttons/app_buttons.dart';
import '../../Components/Images/image_widgets.dart';
import '../../Components/Pickers/complexity_picker.dart';
import '../../Components/Pickers/questions_picker_for_fi.dart';

class StartScreen extends StatefulWidget {
  final void Function() startQuiz;
  const StartScreen(this.startQuiz, {super.key});
  static const routeName = '/';

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  late double selectedQuantityOfQuestions;
  late String selectedComplexity;
  late ColorScheme colorScheme;
  late TextTheme textTheme;
  late Size deviceSize;
  late TextStyle? textStyle;

  @override
  void initState() {
    selectedQuantityOfQuestions = 1;
    selectedComplexity = "intern";
    super.initState();
  }

  @override
  void didChangeDependencies() {
    colorScheme = Theme.of(context).colorScheme;
    textTheme = Theme.of(context).textTheme;
    deviceSize = MediaQuery.of(context).size;
    // final valueOfInheritedWidget =
    //     context.dependOnInheritedWidgetOfExactType<DataProviderInherited>();
    // final textForTest =
    //     valueOfInheritedWidget?.appState.selectedQuestions?[0].text ?? "null";
// final test2 = context.getElementForInheritedWidgetOfExactType
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          /* 
          Start screen background && App Logo  
          */
          AppImages.getBackground(opacity: 0.45),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppImages.appLogoWidget(deviceSize, colorScheme),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.language),
                      onPressed: () {
                        context.locale == const Locale('en', 'US')
                            ? context.setLocale(const Locale('uk', 'UA'))
                            : context.setLocale(const Locale('en', 'US'));
                      },
                    ),
                  ],
                ),

                /* 
                Chosen questions quantity text 
                */
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        "Chosen quantity of questions",
                        textAlign: TextAlign.center,
                        style: textStyle,
                      ),
                    ),
                    Expanded(
                        child: Text(
                            selectedQuantityOfQuestions.toStringAsFixed(0),
                            style: textStyle?.copyWith(
                                color: colorScheme.primary))),
                  ],
                ),
                /* 
                Questions quantity picker 
                */
                QuantityPicker(setSelectedQuantity: (double quantity) {
                  setState(() {
                    selectedQuantityOfQuestions = quantity;
                  });
                }),

                /* 
                Questions complexity text  
                */
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        "Chosen complexity",
                        textAlign: TextAlign.center,
                        style: textStyle,
                      ),
                    ),
                    Expanded(
                      child: Text(selectedComplexity,
                          style:
                              textStyle?.copyWith(color: colorScheme.primary)),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                /* 
                Questions complexity picker  
                */
                ComplexityPicker(
                  setSelectedComplexity: (String complexity) {
                    setState(() {
                      selectedComplexity = complexity;
                    });
                  },
                ),
                SizedBox(height: deviceSize.height * 0.15),
                /* 
                Start button
                */
                AppButtons.startButtonForInterviewerAPP(
                  context,
                  onPressed: widget.startQuiz,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
