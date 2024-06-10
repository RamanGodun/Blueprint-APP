import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../../State_management/Src/Generated_code/by spider/resources.dart';
import '../../../State_management/Theme_configuration/app_colors.dart';

class AppCashedWidgets {
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
                color: AppColors.kSecondaryColor,
              ),
            ],
          ),
        ),
      ),
    ),
  );

  static Widget getLoadingWidget() => loadingWidget;

  // Caching the loading widget for reusability and performance improvement.
  static final Widget loadingWidget1 = Material(
    child: Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ThisAppImages.downloadPicture),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ThisAppImages.apple),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const Center(
            child: SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(
                value: null,
                strokeWidth: 5,
                color: Colors.amber,
              ),
            ),
          ),
        ],
      ),
    ),
  );

  static Widget getLoadingWidget1() => loadingWidget1;

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

  static const Border border4DarkThemeGNavButton = Border.symmetric(
    vertical: BorderSide(
      color: AppColors.kAppPrimaryColor,
      width: 2.5,
      style: BorderStyle.solid,
    ),
  );

  static const Border border4LightThemeGNavButtonConst = Border.symmetric(
    vertical: BorderSide(
      color: Color.fromARGB(114, 15, 108, 91),
      width: 2.5,
      style: BorderStyle.solid,
    ),
  );

  static Border border4LightThemeGNavButton() {
    return border4LightThemeGNavButtonConst;
  }
}
