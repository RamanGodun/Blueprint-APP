import 'package:flutter/material.dart';

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
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey[200],
      ),
      child: child,
    );
  }
}
