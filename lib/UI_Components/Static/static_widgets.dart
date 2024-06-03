import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../State_management/Const_data/strings_4_app.dart';
import '../../State_management/Src/Helpers/helpers.dart';
import '../../State_management/Theme_configuration/App_colors_palette/this_app_colors.dart';

class StaticWidgets {
/*
  LOADING widget
 */
  static const Widget loadingWidget = Material(
    child: Material(
      child: Center(
        child: SizedBox(
          height: 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoActivityIndicator(
                radius: 20.0,
                color: ThisAppColors.kSecondaryColor,
              ),
              SizedBox(height: 8.0),
              Directionality(
                  textDirection: TextDirection.ltr,
                  child: Text(AppStrings.loadingText)),
            ],
          ),
        ),
      ),
    ),
  );

  static Widget getLoadingWidget() => loadingWidget;

/*
  ERROR TEXT  widget
 */
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

  static Widget getErrorWidget(String errorText) => errorWidget(errorText);

/*
  DIVIDER 4 Login page
 */
  static const Widget divider4LoginPage = Padding(
    padding: EdgeInsets.only(left: 25.0, right: 25, bottom: 30),
    child: Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 0.5,
            color: Colors.grey,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            'Or continue with',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 0.5,
            color: Colors.grey,
          ),
        ),
      ],
    ),
  );

  static Widget getDivider4LoginPage() => divider4LoginPage;

/*
DIVIDER between Dialog Buttons 
 */
  static Widget dividerBetweenDialogButtons(BuildContext context) {
    final colorScheme = Helpers.colorScheme(context);
    return Container(
      width: 0.5,
      color: colorScheme.inverseSurface.withOpacity(0.5),
    );
  }

  static Widget getDividerBetweenDialogButtons(BuildContext context) =>
      dividerBetweenDialogButtons(context);
}
