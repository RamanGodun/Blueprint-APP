import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDialogButtons {
  static Widget actionButton(
    BuildContext context, {
    VoidCallback? onPressed,
    required CupertinoTextThemeData textTheme,
    required ColorScheme colorScheme,
  }) {
    return Expanded(
      child: CupertinoDialogAction(
        onPressed: onPressed ??
            () {
              Navigator.of(context).pop();
            },
        child: Text(
          // LocaleKeys.ok.tr(),
          "Ok",
          style: textTheme.actionTextStyle.copyWith(
            fontSize: 17,
            color: colorScheme.primary,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.15,
          ),
        ),
      ),
    );
  }

  static Widget cancelButton(
    BuildContext context, {
    VoidCallback? onPressed,
    required CupertinoTextThemeData textTheme,
    required ColorScheme colorScheme,
  }) {
    return Expanded(
      child: CupertinoDialogAction(
        onPressed: onPressed ??
            () {
              Navigator.of(context).pop();
            },
        child: Text(
          'Cancel',
          style: textTheme.actionTextStyle.copyWith(
            fontSize: 17,
            color: colorScheme.error,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.italic,
            letterSpacing: 1.04,
          ),
        ),
      ),
    );
  }

  static Widget defaultActionButton(
    BuildContext context, {
    required CupertinoThemeData theme,
  }) {
    return Expanded(
      child: CupertinoDialogAction(
        onPressed: null,
        child: Text(
          'OK',
          style: theme.textTheme.actionTextStyle.copyWith(
            fontSize: 20,
            color: theme.primaryColor,
          ),
        ),
      ),
    );
  }

  static Widget defaultCancelButton(
    BuildContext context, {
    required CupertinoThemeData theme,
  }) {
    return Expanded(
      child: CupertinoDialogAction(
        onPressed: null,
        child: Text(
          'Cancel',
          style: theme.textTheme.actionTextStyle.copyWith(
            fontSize: 20,
            color: CupertinoColors.destructiveRed,
          ),
        ),
      ),
    );
  }
}
