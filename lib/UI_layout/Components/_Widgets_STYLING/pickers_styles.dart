import 'package:flutter/material.dart';

abstract class AppPickersStyle {
  static EdgeInsets dialogPadding(BuildContext context) {
    return EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 10);
  }

  static ShapeBorder dialogShape() {
    return RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0));
  }

  static EdgeInsets titlePadding() {
    return const EdgeInsets.only(top: 20, bottom: 12, left: 10, right: 10);
  }

  static EdgeInsets actionsPadding() {
    return const EdgeInsets.only(top: 10, bottom: 0);
  }

  static EdgeInsets contentPadding() {
    return const EdgeInsets.symmetric(vertical: 0, horizontal: 10);
  }

  static EdgeInsets buttonPadding() {
    return const EdgeInsets.only(top: 8.0);
  }
}
