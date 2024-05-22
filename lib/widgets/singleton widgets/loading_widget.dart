import 'package:flutter/cupertino.dart';
import '../../state/state 4 JBnTracker/string_4_jbn_tracker.dart';
import '../../theme/app_colorscheme.dart';

class LoadingWidgetManager {
  static final LoadingWidgetManager _instance =
      LoadingWidgetManager._internal();

  factory LoadingWidgetManager() {
    return _instance;
  }

  LoadingWidgetManager._internal();

  Widget loadingWidget({double? radius, Color? color, String? text}) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CupertinoActivityIndicator(
            radius: radius ?? 15.0,
            color: color ?? ThisAppColors.kSecondaryColor,
          ),
          const SizedBox(height: 8.0),
          Text(text ?? AppStrings4JBnTracker.loadingText),
        ],
      ),
    );
  }
}

/*
Access by 
var widget = 
LoadingWidgetManager().loadingWidget(radius: 20.0, color: Colors.red, text: "Loading...");
 */