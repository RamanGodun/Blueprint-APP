import 'package:flutter/material.dart';
import 'dart:ui';

import '../../../State_management/Helpers/Common/helpers.dart';

class CardsAndTilesStyles {
  static BoxDecoration cardDecoration(BuildContext context) {
    final colorScheme = Helpers.colorSchemeGet(context);
    return BoxDecoration(
      borderRadius: BorderRadius.circular(12.0),
      color: colorScheme.surface.withOpacity(0.4),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 10,
          offset: const Offset(2, 4),
        ),
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 5,
          offset: const Offset(0, 2),
        ),
      ],
    );
  }

  static BoxDecoration discountDecoration() {
    return const BoxDecoration(
      color: Color(0xFFC94C4C),
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(5.0),
      ),
    );
  }

  static Widget tileContainer(ThemeData theme,
      {required Widget child, bool? fromSignPage}) {
    final colorScheme = theme.colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: 16, vertical: (fromSignPage != null) ? 16 : 6),
          decoration: BoxDecoration(
            color: colorScheme.surface.withOpacity(0.95),
            border: Border.all(
                color: colorScheme.inverseSurface.withOpacity(0.2), width: 0.9),
            borderRadius: BorderRadius.circular(12),
          ),
          child: child,
        ),
      ),
    );
  }

  static BoxDecoration listTileDecoration(
      BuildContext context, bool isDarkTheme) {
    final colorScheme = Helpers.colorSchemeGet(context);
    return BoxDecoration(
      color: colorScheme.surface.withOpacity(isDarkTheme ? 0.15 : 0.08),
      borderRadius: BorderRadius.circular(6.0),
      boxShadow: [
        BoxShadow(
          color: colorScheme.surface.withOpacity(0.1),
          blurRadius: 1.0,
          offset: const Offset(0.0, 1.0),
        ),
      ],
    );
  }

  static BoxDecoration slidableActionDecoration(
      BuildContext context, bool isDarkTheme, Color color) {
    return BoxDecoration(
      color: color.withOpacity(isDarkTheme ? 0.27 : 0.19),
      borderRadius: BorderRadius.circular(5),
    );
  }

  static BoxDecoration checkboxDecoration(
      BuildContext context, bool isDarkTheme) {
    final colorScheme = Helpers.colorSchemeGet(context);
    return BoxDecoration(
      border:
          Border.all(color: colorScheme.onSurface.withOpacity(0.2), width: 1.5),
      borderRadius: BorderRadius.circular(3.0),
    );
  }
}
