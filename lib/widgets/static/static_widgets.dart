import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../theme configuration/app_colorscheme.dart';

class StaticWidgets {
  static const Widget loadingWidget = Material(
    child: Center(
      child: SizedBox(
        height: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoActivityIndicator(
              radius: 15.0,
              color: ThisAppColors.kSecondaryColor,
            ),
            // SizedBox(height: 8.0),
            // Directionality(
            //     textDirection: TextDirection.ltr,
            //     child: Text(AppStrings4JBnTracker.loadingText)),
          ],
        ),
      ),
    ),
  );
  static Widget getLoadingWidget() => loadingWidget;

  static Widget errorWidget(String errorText) {
    return Material(
      child: Center(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Text('Error: $errorText'),
        ),
      ),
    );
  }
}
