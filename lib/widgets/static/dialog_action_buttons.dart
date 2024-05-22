import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StaticButtons {
//

//
  static Widget actionButtonForDialog(BuildContext context) {
    return Expanded(
      child: CupertinoDialogAction(
        child: Text(
          'OK',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  static Widget cancelButtonForDialog(BuildContext context) {
    return Expanded(
      child: CupertinoDialogAction(
        child: const Text(
          'Cancel',
          style: TextStyle(
            color: CupertinoColors.destructiveRed,
          ),
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }
}
