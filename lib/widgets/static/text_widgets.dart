import 'package:flutter/material.dart';

class StaticTextWidgets {
  static Widget themedText(BuildContext context, String text,
      {Color? color,
      double fontSize = 16,
      TextAlign textAlign = TextAlign.center}) {
    final textTheme = Theme.of(context).textTheme;

    return Text(
      text,
      textAlign: textAlign,
      style: textTheme.bodyMedium?.copyWith(
        color: color ?? textTheme.bodyMedium?.color,
        fontSize: fontSize,
      ),
    );
  }
}
