import 'package:flutter/material.dart';

import '../../State_management/Src/Helpers/helpers.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  final Function() onTap;

  const SquareTile({
    super.key,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: StaticDecorations.squareTileContainer(
        context,
        child: Image.asset(
          imagePath,
          height: 30,
        ),
      ),
    );
  }
}

class StaticDecorations {
  static Widget squareTileContainer(BuildContext context,
      {required Widget child}) {
    final colorScheme = Helpers.colorScheme(context);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: colorScheme.onSurface.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(16),
        color: colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(2, 4),
          ),
          BoxShadow(
            color: colorScheme.shadow.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }
}
