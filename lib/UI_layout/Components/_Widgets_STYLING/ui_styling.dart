import 'package:flutter/material.dart';

import '../../../State_management/Helpers/Common/helpers.dart';
import '../../../State_management/Theme_configuration/app_colors.dart';

abstract class AppUIStyling {
  static BoxDecoration glassmorphismGradientDecoration(BuildContext context) {
    final theme = Helpers.theme(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final isDark = Helpers.isDark(theme);
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [
          colorScheme.primary.withOpacity(isDark ? 0.4 : 0.6),
          colorScheme.primary.withOpacity(isDark ? 0.7 : 0.9),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: AppColors.cupertinoBlackColor.withOpacity(isDark ? 0.6 : 0.8),
          spreadRadius: 1,
          blurRadius: 5,
          offset: const Offset(0, 2),
        ),
        BoxShadow(
          color: AppColors.cupertinoBlackColor.withOpacity(isDark ? 0.3 : 0.5),
          spreadRadius: 0.5,
          blurRadius: 2,
          offset: const Offset(0, 1),
        ),
      ],
    );
  }
}
