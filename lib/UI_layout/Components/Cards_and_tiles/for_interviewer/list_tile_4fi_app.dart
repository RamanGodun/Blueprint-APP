import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../State_management/Helpers/Common/helpers.dart';
import '../../../../State_management/Models/models_4_FI_on_hive/question_model.dart';
import '../../Mini_widgets/mini_widgets.dart';
import '../../_General_STYLING_set/Custom_layouts/fi_list_tile_layouts.dart';
import '../../_General_STYLING_set/app_box_decoration.dart';
import '../../_General_STYLING_set/app_text_styling.dart';

class CustomListTile extends StatelessWidget {
  final void Function(BuildContext) onEditPressed;
  final bool isCorrectAnswer;
  final QuestionAndAnswersModel itemData;
  final int questionIndex;

  const CustomListTile({
    super.key,
    required this.onEditPressed,
    required this.isCorrectAnswer,
    required this.itemData,
    required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Helpers.themeGet(context);
    return Material(
      color: Colors.transparent,
      child: Stack(children: [
        Slidable(
          endActionPane: ActionPane(
            motion: const StretchMotion(),
            children: [
              SlidableAction(
                backgroundColor: Colors.transparent,
                foregroundColor:
                    Helpers.colorSchemeGet(context).primary.withOpacity(0.9),
                onPressed: onEditPressed,
                icon: Icons.query_stats_outlined,
                autoClose: true,
              ),
            ],
          ),
          child: Container(
            padding: const EdgeInsets.only(left: 7, right: 7, bottom: 3.5),
            height: 120,
            decoration: AppBoxDecorations.cardDecoration(context),
            child: CustomMultiChildLayout(
              delegate: ListTileMultiChildLayoutDelegate(),
              children: [
                LayoutId(
                  id: "question ID",
                  child: AppMiniWidgets.isAnswerCorrectIdentifier(
                    context: context,
                    isCorrectAnswer: isCorrectAnswer,
                    questionIndex: questionIndex + 1,
                  ),
                ),
                LayoutId(
                  id: "question",
                  child: Text(
                    itemData.questionText,
                    style: AppTextStyling.questionTextStyle(theme),
                    maxLines: 3,
                  ),
                ),
                LayoutId(
                  id: "answer label",
                  child: Text(
                    "Your answer:",
                    style: AppTextStyling.answerLabelStyle(theme),
                    maxLines: 3,
                    textAlign: TextAlign.left,
                  ),
                ),
                LayoutId(
                  id: "answer",
                  child: Text(
                    itemData.userAnswer,
                    style:
                        AppTextStyling.answerTextStyle(theme, isCorrectAnswer),
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
