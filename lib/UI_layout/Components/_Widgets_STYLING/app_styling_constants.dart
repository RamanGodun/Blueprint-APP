import 'package:flutter/material.dart';

abstract class AppStylingConstants {
  static const double elevation = 3;
  static const double generalBorderRadius = 7.5;
  static const double buttonsHeight = 45;
  static final BorderRadius commonBorderRadius =
      BorderRadius.circular(generalBorderRadius);

/* PADDINGS 
*/
/* OFTEN USED */
  static const EdgeInsets zero = EdgeInsets.all(0.0);
  static const EdgeInsets horizontal8 = EdgeInsets.symmetric(horizontal: 8.0);
  static const EdgeInsets commonPadding =
      EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0);

/* PADDING For SPECIFIC widgets
 */
  static const EdgeInsets forBoldDivider =
      EdgeInsets.only(right: 0, top: 0.0, bottom: 0.0);
  static const EdgeInsets forDivider =
      EdgeInsets.only(left: 10.0, right: 14, top: 0.0, bottom: 0.0);
}


/*
ClipRRect(
        borderRadius: AppStylingConstants.commonBorderRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: 
 */