import 'package:flutter/material.dart';

import '../_Widgets_STYLING/app_styling_constants.dart';

abstract class AppImagesStyling {
  static const EdgeInsets circularProgressPadding =
      AppStylingConstants.allPadding10;
  static const BorderRadius imageBorderRadius = BorderRadius.only(
    topLeft: Radius.circular(8),
    bottomLeft: Radius.circular(8),
    topRight: Radius.circular(8),
  );
}
