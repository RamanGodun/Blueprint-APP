import 'package:flutter/material.dart';
import '../_Widgets_STYLING/cards_and_tiles_styles.dart';

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
      child: CardsAndTilesStyles.tileContainer(
        context,
        child: Image.asset(
          imagePath,
          height: 30,
        ),
      ),
    );
  }
}
