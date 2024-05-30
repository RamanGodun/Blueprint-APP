import 'package:flutter/material.dart';

class StaticCustomButtons {
  static Widget customButton(BuildContext context,
      {required VoidCallback onPressed, required String buttonText}) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          color: colorScheme.secondary.withOpacity(0.7),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: textTheme.bodyLarge?.copyWith(
              color: colorScheme.inversePrimary,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  static Widget customButton2(BuildContext context,
      {required VoidCallback onPressed, required String buttonText}) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(
            Theme.of(context).colorScheme.secondary,
          ),
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: Theme.of(context).colorScheme.onInverseSurface),
        ));
  }
}
