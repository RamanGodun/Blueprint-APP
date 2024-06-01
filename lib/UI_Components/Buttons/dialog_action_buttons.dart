import 'package:flutter/cupertino.dart';

import '../../State_management/Src/Helpers/helpers.dart';

class StaticButtons4Dialogs {
  static Widget actionButtonForDialog(BuildContext context,
      {VoidCallback? onPressed}) {
    final theme = Helpers.cupertinoThemeData(context);
    return Expanded(
      child: CupertinoDialogAction(
        onPressed: onPressed ??
            () {
              Navigator.of(context).pop();
            },
        child: Text(
          'OK',
          style: theme.textTheme.actionTextStyle.copyWith(
            fontSize: 17,
            color: theme.primaryColor,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.1,
          ),
        ),
      ),
    );
  }

  static Widget cancelButtonForDialog(BuildContext context,
      {VoidCallback? onPressed}) {
    final theme = Helpers.cupertinoThemeData(context);
    return Expanded(
      child: CupertinoDialogAction(
        onPressed: onPressed ??
            () {
              Navigator.of(context).pop();
            },
        child: Text(
          'Cancel',
          style: theme.textTheme.actionTextStyle.copyWith(
            fontSize: 17,
            color: CupertinoColors.destructiveRed,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.italic,
            letterSpacing: 1.02,
          ),
        ),
      ),
    );
  }

  static const Widget defaultActionButtonForDialog = Expanded(
    child: CupertinoDialogAction(
      onPressed: null,
      child: Text(
        'OK',
        style: TextStyle(
          fontSize: 20,
          color: CupertinoColors.activeBlue,
        ),
      ),
    ),
  );

  static const Widget defaultCancelButtonForDialog = Expanded(
    child: CupertinoDialogAction(
      onPressed: null,
      child: Text(
        'Cancel',
        style: TextStyle(
          fontSize: 20,
          color: CupertinoColors.destructiveRed,
        ),
      ),
    ),
  );
}
