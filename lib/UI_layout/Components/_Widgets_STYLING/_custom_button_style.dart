import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../State_management/Helpers/Common/helpers.dart';
import '_text_styles_for_components.dart';

abstract class AppButtonsStyle {
/*WITH Shadows
 */
  static Widget withShadows(
    BuildContext context, {
    void Function()? onPressed,
    required String buttonText,
    required ColorScheme colorScheme,
  }) {
    final theme = Helpers.cupertinoThemeData(context);
    return Material(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                theme.primaryColor.withOpacity(0.9),
                theme.primaryColor.withOpacity(0.95),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: CupertinoColors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
              BoxShadow(
                color: CupertinoColors.black.withOpacity(0.05),
                spreadRadius: 0.5,
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Center(
            child: Text(
              buttonText,
              style: AppTextStyles.forButtons(context).copyWith(
                color: colorScheme.onPrimary,
              ),
            ),
          ),
        ),
      ),
    );
  }
//
}
