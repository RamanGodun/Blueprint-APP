import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../State_management/Theme_configuration/App_colors_palette/this_app_colors.dart';
import '../Static/mini_widgets.dart';
import '../0_Widgets_STYLING/list_tile_layouts.dart';

class CustomListTile extends StatelessWidget {
  final void Function(BuildContext)? onEditPressed;
  final bool isCorrectAnswer;
  final Map<String, Object> itemData;
  const CustomListTile(
      {super.key,
      required this.onEditPressed,
      required this.isCorrectAnswer,
      required this.itemData});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final TextTheme textTheme = theme.textTheme;
    return Material(
      color: Colors.transparent,
      child: Stack(children: [
        Slidable(
          endActionPane: ActionPane(
            motion: const StretchMotion(),
            children: [
              SlidableAction(
                backgroundColor: colorScheme.surface.withOpacity(0.57),
                foregroundColor: colorScheme.primary.withOpacity(0.9),
                borderRadius: BorderRadius.circular(5),
                onPressed: onEditPressed,
                icon: Icons.query_stats_outlined,
              ),
            ],
          ),
          child: Container(
            padding: const EdgeInsets.only(left: 7, right: 7, bottom: 3.5),
            height: 120,
            decoration: BoxDecoration(
              color: colorScheme.surface.withOpacity(0.75),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(18.0),
                bottomLeft: Radius.circular(18.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: colorScheme.primary.withOpacity(0.05),
                  blurRadius: 1.0,
                  offset: const Offset(0.0, 1.0),
                ),
              ],
            ),
            child: CustomMultiChildLayout(
              delegate: ListTileMultiChildLayoutDelegate(),
              children: [
                LayoutId(
                  id: "question ID",
                  child: MiniWidgets.isAnswerCorrectIdentifier(
                    context: context,
                    isCorrectAnswer: isCorrectAnswer,
                    questionIndex: itemData['question_index'] as int,
                  ),
                ),
                LayoutId(
                  id: "question",
                  child: Text(
                    itemData['question'] as String,
                    style: textTheme.labelSmall?.copyWith(
                      height: 1.15,
                    ),
                    maxLines: 3,
                  ),
                ),
                LayoutId(
                  id: "answer label",
                  child: Text(
                    "your answer:  ",
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurface.withOpacity(0.55),
                      height: 0.95,
                      fontStyle: FontStyle.italic,
                    ),
                    maxLines: 3,
                    textAlign: TextAlign.left,
                  ),
                ),
                LayoutId(
                  id: "answer",
                  child: Text(
                    itemData['user_answer'] as String,
                    style: textTheme.bodyMedium?.copyWith(
                      color: isCorrectAnswer
                          ? ThisAppColors.kPrimaryVariant
                          : colorScheme.error,
                      height: 1.05,
                    ),
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
