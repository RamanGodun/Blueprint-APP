import 'package:flutter/material.dart';

class ListTileMultiChildLayoutDelegate extends MultiChildLayoutDelegate {
  @override
  // Size getSize(BoxConstraints constraints) =>
  //     Size(constraints.biggest.width, 97);

  @override
  void performLayout(Size size) {
    if (hasChild("question") &&
        hasChild("question ID") &&
        hasChild("answer label") &&
        hasChild("answer")) {
      // question ID layout
      const questionIdMaxWidth = 100.0;
      const questionIdMaxHeight = 20.0;
      layoutChild(
          "question ID",
          BoxConstraints.loose(
              const Size(questionIdMaxWidth, questionIdMaxHeight)));
      const questionIdYOffset = -questionIdMaxHeight * 0.15;
      positionChild("question ID", const Offset(-5, questionIdYOffset));

// question layout
      final questionMaxWidth = size.width;
      final questionMaxHeight = size.height * 0.5;
      final questionLayout = layoutChild("question",
          BoxConstraints.loose(Size(questionMaxWidth, questionMaxHeight)));
      final questionYOffset =
          size.height * 0.58 / 2 - questionLayout.height / 2 + 4;
      positionChild("question", Offset(0.0, questionYOffset));

      // answer label layout
      final answerLabelWidth = size.width;
      final answerLabelHeight = size.height * 0.1;
      layoutChild("answer label",
          BoxConstraints.loose(Size(answerLabelWidth, answerLabelHeight)));
      final answerLabelYOffset =
          questionLayout.height > 30 ? size.height * 0.56 : size.height * 0.48;
      positionChild("answer label", Offset(24, answerLabelYOffset));

      // answer layout
      final answerMaxWidth = size.width;
      final answerHeight = size.height * 0.3;
      layoutChild(
          "answer", BoxConstraints.loose(Size(answerMaxWidth, answerHeight)));
      final answerYOffset = answerLabelYOffset + answerLabelHeight + 4;
      positionChild("answer", Offset(0.0, answerYOffset));
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    return true;
  }
}
