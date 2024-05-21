import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StaticButtons {
//
  // static Widget loadingWidget() {
  //   return const Center(
  //     child: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         CupertinoActivityIndicator(
  //           radius: 15.0,
  //           color: ThisAppColors.kSecondaryColor,
  //         ),
  //         SizedBox(height: 8.0),
  //         Text(AppStrings2.loadingText),
  //       ],
  //     ),
  //   );
  // }

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
