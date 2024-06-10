import 'package:flutter/material.dart';

abstract class AppPaddings {
/* OFTEN USED
 */
  static const EdgeInsets zero = EdgeInsets.all(0.0);
  static const EdgeInsets horizontal8 = EdgeInsets.symmetric(horizontal: 8.0);

/* For SPECIFIC widgets
 */
  static const EdgeInsets forBoldDivider =
      EdgeInsets.only(right: 0, top: 0.0, bottom: 0.0);
  static const EdgeInsets forDivider =
      EdgeInsets.only(left: 10.0, right: 14, top: 0.0, bottom: 0.0);
//
}
