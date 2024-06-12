import 'package:flutter/material.dart';
import 'dart:ui';

import '../_Widgets_STYLING/app_box_decoration.dart';
import '../_Widgets_STYLING/app_styling_constants.dart';

abstract class CardsAndTilesStyling {
/* FOR TILE CONTAINER
 */
  static Widget forTileContainer(
    ThemeData theme, {
    required Widget child,
    bool? fromSignPage,
  }) {
    return ClipRRect(
      borderRadius: AppStylingConstants.commonBorderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: 16, vertical: (fromSignPage != null) ? 16 : 6),
          decoration: AppBoxDecorations.forTiles(theme),
          child: child,
        ),
      ),
    );
  }
}
