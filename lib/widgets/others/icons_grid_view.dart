import 'package:flutter/material.dart';

import '../../State_management/Src/Custom_icons/custom_icons_list.dart';

class IconsGridView extends StatelessWidget {
  final ColorScheme colorScheme;

  const IconsGridView({super.key, required this.colorScheme});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final maxWidth = constraints.maxWidth;
        final crossAxisCount = (maxWidth / 60).floor();

        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
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
      },
    );
  }
}
