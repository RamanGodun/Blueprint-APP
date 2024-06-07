import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Buttons/dialog_buttons.dart';
import '../Static/_dividers.dart';
import '../../../State_management/Helpers/Common/helpers.dart';

abstract class AppDialogsStyles {
/* 
   Custom CUPERTINO dialog Style
 */
  static Widget customCupertinoDialogStyle({
    required BuildContext context,
    required double widthFraction,
    required double heightFraction,
    required String dialogTitle,
    required Widget contentWidget,
    required EdgeInsets contentPadding,
  }) {
    final theme = Helpers.theme(context);
    final deviceSize = Helpers.deviceSize(context);
    final isDarkMode = Helpers.isDark(theme);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final deviceHeight = deviceSize.height;
    final deviceWidth = deviceSize.width;

    return Container(
      width: deviceWidth * widthFraction,
      height: deviceHeight * heightFraction,
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: (isDarkMode)
                ? Colors.black
                : colorScheme.inverseSurface.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(2, 4),
          ),
          BoxShadow(
            color: (isDarkMode)
                ? Colors.black
                : colorScheme.inverseSurface.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: CupertinoPopupSurface(
        isSurfacePainted: true,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 26, left: 16, right: 16, bottom: 8),
              child: Text(
                dialogTitle,
                style: textTheme.titleMedium?.copyWith(
                    color: colorScheme.inverseSurface.withOpacity(0.7)),
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
            Divider(
                thickness: 0.5,
                color: colorScheme.inverseSurface.withOpacity(0.5)),
            const SizedBox(height: 7),
            Expanded(
              child: Padding(
                padding: contentPadding,
                child: contentWidget,
              ),
            ),
            const SizedBox(height: 7),
            Divider(
                height: 0.4,
                thickness: 0.7,
                color: colorScheme.inverseSurface.withOpacity(0.5)),
            Padding(
              padding: const EdgeInsets.all(0),
              child: SizedBox(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AppDialogsButtonsStyles.customCancelDB(context),
                    AppDividers.dividerBetweenDialogButtons(context),
                    AppDialogsButtonsStyles.customActionDB(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

/* 
   Custom ANDROID dialog Style
 */
  static Widget customAndroidDialogStyle({
    required BuildContext context,
    required double widthFraction,
    required double heightFraction,
    required String dialogTitle,
    required Widget contentWidget,
    required EdgeInsets contentPadding,
  }) {
    final theme = Helpers.theme(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Dialog(
      backgroundColor: colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * widthFraction,
        height: MediaQuery.of(context).size.height * heightFraction,
        padding: const EdgeInsets.all(0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 26, left: 16, right: 16, bottom: 8),
              child: Text(
                dialogTitle,
                style: textTheme.titleMedium
                    ?.copyWith(color: colorScheme.onSurface.withOpacity(0.7)),
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
            Divider(
                thickness: 0.5, color: colorScheme.onSurface.withOpacity(0.5)),
            const SizedBox(height: 7),
            Expanded(
              child: Padding(
                padding: contentPadding,
                child: contentWidget,
              ),
            ),
            const SizedBox(height: 7),
            Divider(
                height: 0.4,
                thickness: 0.7,
                color: colorScheme.onSurface.withOpacity(0.5)),
            Padding(
              padding: const EdgeInsets.all(0),
              child: SizedBox(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AppDialogsButtonsStyles.customAndroidCancelButton(context),
                    AppDialogsButtonsStyles.customAndroidActionButton(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
