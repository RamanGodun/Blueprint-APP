import 'package:flutter/material.dart';

class StaticInputDecorations4Textfield1 {
  static InputDecoration inputDecoration(
    BuildContext context,
    String hintText,
    IconData icon,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return InputDecoration(
      contentPadding:
          const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9.0),
        borderSide: BorderSide(
          color: colorScheme.onSurface.withOpacity(0.3),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9.0),
        borderSide: BorderSide(
          color: colorScheme.primary,
        ),
      ),
      fillColor: colorScheme.surface,
      filled: true,
      hintText: hintText,
      hintStyle: textTheme.bodyMedium?.copyWith(
        color: colorScheme.onSurface.withOpacity(0.5),
      ),
      prefixIcon: Icon(
        icon,
        color: colorScheme.onSurface.withOpacity(0.5),
      ),
    );
  }
}
