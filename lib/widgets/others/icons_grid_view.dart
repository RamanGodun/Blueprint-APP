import 'package:flutter/material.dart';
import '../../state_management/const_data/custom_icons_list.dart';

class IconsGridView extends StatelessWidget {
  final ColorScheme colorScheme;

  const IconsGridView({super.key, required this.colorScheme});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
      itemCount: ThisAppCustomIcons().myCustomIconsList.length,
      itemBuilder: (BuildContext context, int index) {
        final IconData icon = ThisAppCustomIcons().myCustomIconsList[index];
        return Icon(
          icon,
          size: 30,
          color: colorScheme.onSurface,
        );
      },
    );
  }
}
