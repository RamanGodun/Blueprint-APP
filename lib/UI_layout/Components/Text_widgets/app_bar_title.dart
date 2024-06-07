import 'package:flutter/material.dart';

import '../../../State_management/Helpers/Common/helpers.dart';
import '../_Widgets_STYLING/_text_styles_for_components.dart';

class AppBarTitle extends StatelessWidget {
  final String text;
  const AppBarTitle({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Helpers.colorSchemeGet();
    final cupertinoTheme = Helpers.cupertinoThemeGet();
    return Text(
      text,
      style: AppTextStyles.appBarTitle(
          cupertinoTheme: cupertinoTheme, colorScheme: colorScheme),
    );
  }
}
