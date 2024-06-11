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

  static Widget tileContainer(BuildContext context, {required Widget child}) {
    final colorScheme = Helpers.colorSchemeGet(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border:
                Border.all(color: Colors.white.withOpacity(0.2), width: 1.5),
            borderRadius: BorderRadius.circular(16),
            color: colorScheme.surface.withOpacity(0.7),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 4,
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 1),
              ),
            ],
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
