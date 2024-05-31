import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StaticButtons {
  // Статичний віджет для дії OK з кастомним onPressed
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
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
        ),
      ),
    );
  }

  // Статичний віджет для дії Cancel з кастомним onPressed
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

  // Константний віджет для OK, використовується, якщо не потрібен контекст
  static const Widget defaultActionButtonForDialog = Expanded(
    child: CupertinoDialogAction(
      onPressed: null,
      child: Text(
        'OK',
        style: TextStyle(
          fontSize: 20, // можна змінити на відповідне значення
          color: Colors
              .blue, // це лише приклад, налаштуйте відповідно до вашої теми
        ),
      ), // замінити при виклику
    ),
  );

  // Константний віджет для Cancel, використовується, якщо не потрібен контекст
  static const Widget defaultCancelButtonForDialog = Expanded(
    child: CupertinoDialogAction(
      onPressed: null,
      child: Text(
        'Cancel',
        style: TextStyle(
          fontSize: 20, // можна змінити на відповідне значення
          color: CupertinoColors.destructiveRed,
        ),
      ), // замінити при виклику
    ),
  );
}
