import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../State_management/Helpers/Common/helpers.dart';
import '../../../../State_management/Models/models_4_FI_on_hive/question_model.dart';
import '../../Mini_widgets/mini_widgets.dart';
import '../../_Widgets_STYLING/Custom_layouts/fi_list_tile_layouts.dart';
import '../../_Widgets_STYLING/cards_and_tiles_styles.dart';
import '../../_Widgets_STYLING/app_text_styles_for_ui.dart';

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
                    Helpers.colorScheme(context).primary.withOpacity(0.9),
                onPressed: onEditPressed,
                icon: Icons.query_stats_outlined,
                autoClose: true,
              ),
            ],
          ),
          child: Container(
            padding: const EdgeInsets.only(left: 7, right: 7, bottom: 3.5),
            height: 120,
            decoration: CardsAndTilesStyles.cardDecoration(context),
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
                    style: AppTextStyles.questionTextStyle(context),
                    maxLines: 3,
                  ),
                ),
                LayoutId(
                  id: "answer label",
                  child: Text(
                    "Your answer:",
                    style: AppTextStyles.answerLabelStyle(context),
                    maxLines: 3,
                    textAlign: TextAlign.left,
                  ),
                ),
                LayoutId(
                  id: "answer",
                  child: Text(
                    itemData.userAnswer,
                    style:
                        AppTextStyles.answerTextStyle(context, isCorrectAnswer),
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
