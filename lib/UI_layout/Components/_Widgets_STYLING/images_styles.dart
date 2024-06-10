import 'package:flutter/material.dart';

abstract class AppImagesStyles {
  static const EdgeInsets circularProgressPadding = EdgeInsets.all(20.0);
  static const BorderRadius imageBorderRadius = BorderRadius.only(
    topLeft: Radius.circular(8),
    bottomLeft: Radius.circular(8),
    topRight: Radius.circular(8),
  );
}
