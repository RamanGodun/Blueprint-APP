import 'package:flutter/material.dart';

class SubCategory {
  final String title;
  final IconData iconData;
  final Color color;

  SubCategory({
    required this.title,
    required this.iconData,
    required this.color,
  });
  SubCategory updateTitle(String newTitle) {
    return SubCategory(
      title: newTitle,
      iconData: iconData,
      color: color,
    );
  }
}
