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

  static Widget text4LoginPageWidget(
    BuildContext context,
    String text, {
    Color? color,
    double fontSize = 16,
  }) {
    return Center(
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: color,
              fontSize: fontSize,
            ),
      ),
    );
  }

  static Widget divider4LoginPage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
