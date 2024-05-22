import 'package:flutter/cupertino.dart';
// import '../../state/state 4 JBnTracker/string_4_jbn_tracker.dart';
import '../../theme/app_colorscheme.dart';

class StaticWidgets {
  static const Widget loadingWidget = Center(
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
  );

  static Widget getLoadingWidget() => loadingWidget;
}
