import 'package:flutter/material.dart';

class MiniWidgets {
  static Widget divider(BuildContext context) {
    return Divider(
        thickness: 0.5,
        color: Theme.of(context).colorScheme.inverseSurface.withOpacity(0.5));
  }
}
