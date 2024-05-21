import 'package:flutter/material.dart';

class Category {
  final String title;
  final Color color;
  final IconData iconData;
  bool isExpanded;

  Category({
    required this.title,
    required this.color,
    required this.iconData,
    this.isExpanded = false,
  });
}

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

enum CategoriesEnum {
  food,
  transport,
  study,
  rest,
  tech,
  charity,
  health,
  household,
  other
}
