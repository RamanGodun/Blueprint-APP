import 'package:flutter/material.dart';
import '../../../State_management/Src/Generated_code/by spider/resources.dart';

class AppImages {
/*
Get background picture
 */
  static Widget getBackground({double opacity = 0.2}) {
    return SizedBox(
      height: double.infinity,
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(
          Colors.black.withOpacity(opacity),
          BlendMode.srcATop,
        ),
        child: Image.asset(
          ThisAppImages.apple,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
        ),
      ),
    );
  }

/*
Quiz background
 */
  static Widget quizBackground(double height, Color color) {
    return Center(
      child: SizedBox(
          height: height,
          child: Image.asset(
            ThisAppImages.apple,
            fit: BoxFit.fitHeight,
            color: color,
          )),
    );
  }

/*
App LOGO widget
 */
  static Widget appLogoWidget(Size deviceSize, ColorScheme colorScheme) {
    return Padding(
      padding: EdgeInsets.only(
          top: deviceSize.height * 0.15, bottom: deviceSize.height * 0.1),
      child: SizedBox(
          height: deviceSize.height * 0.1,
          child: Image.asset(
            ThisAppImages.apple,
            fit: BoxFit.fitHeight,
            color: colorScheme.primary.withOpacity(0.9),
          )),
    );
  }
}
