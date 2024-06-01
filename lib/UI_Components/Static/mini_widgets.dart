import 'package:flutter/material.dart';
import '../../State_management/Src/Helpers/helpers.dart';

class MiniWidgets {
  static Widget divider(BuildContext context) {
    final colorScheme = Helpers.colorScheme(context);
    return Divider(
      thickness: 0.5,
      color: colorScheme.inverseSurface.withOpacity(0.5),
    );
  }
}
