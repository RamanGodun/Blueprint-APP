import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../state_management/theme_settings/app_colorscheme.dart';

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

  static Widget divider4LoginPage() {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, bottom: 30),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              thickness: 0.5,
              color: Colors.grey[400],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'Or continue with',
              style: TextStyle(color: Colors.grey[700]),
            ),
          ),
          Expanded(
            child: Divider(
              thickness: 0.5,
              color: Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }
}
