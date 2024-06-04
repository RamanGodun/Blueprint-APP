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
