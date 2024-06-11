import 'package:flutter/material.dart';

import '../../../State_management/Src/Custom_icons/app_icons.dart';
import '../../../State_management/Src/Custom_icons/custom_icons_list.dart';
import '../../../State_management/Helpers/Common/helpers.dart';

class IconsGridView extends StatelessWidget {
  const IconsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Helpers.colorSchemeGet(context);

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
          itemCount: AppIcons.customIcons.length,
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
