import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary, fontSize: 17),
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
          color: Colors.blue,
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
