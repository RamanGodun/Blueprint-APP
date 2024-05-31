import 'package:flutter/cupertino.dart';

class DialogStaticButtons {
  static Widget actionButtonForDialog(BuildContext context,
      {VoidCallback? onPressed}) {
    return Expanded(
      child: CupertinoDialogAction(
        onPressed: onPressed ??
            () {
              Navigator.of(context).pop();
            },
        child: Text(
          'OK',
          style: CupertinoTheme.of(context).textTheme.actionTextStyle.copyWith(
                fontSize: 17,
                color: CupertinoTheme.of(context).primaryColor,
              ),
        ),
      ),
    );
  }

  static Widget cancelButtonForDialog(BuildContext context,
      {VoidCallback? onPressed}) {
    return Expanded(
      child: CupertinoDialogAction(
        onPressed: onPressed ??
            () {
              Navigator.of(context).pop();
            },
        child: const Text(
          'Cancel',
          style: TextStyle(
            color: CupertinoColors.destructiveRed,
            fontSize: 17,
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
