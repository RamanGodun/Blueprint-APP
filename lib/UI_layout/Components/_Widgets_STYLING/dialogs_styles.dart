import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:icon_animated/icon_animated.dart';
import 'dart:ui';

import '../../../State_management/Services/mapping_service.dart';
import '../../../State_management/Theme_configuration/app_colors.dart';
import 'dialog_buttons_styles.dart';
import '../Mini_widgets/dividers.dart';
import '../../../State_management/Helpers/Common/helpers.dart';

abstract class AppDialogsStyles {
/* 
   Custom CUPERTINO dialog Style
 */
  static Widget customCupertinoDialogStyle({
    required BuildContext context,
    required double widthFraction,
    required double heightFraction,
    required String dialogTitle,
    required Widget contentWidget,
    required EdgeInsets contentPadding,
  }) {
    final theme = Helpers.themeGet(context);
    final deviceSize = Helpers.deviceSizeGet(context);
    final isDarkMode = Helpers.isDarkTheme(theme);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final deviceHeight = deviceSize.height;
    final deviceWidth = deviceSize.width;

    return Container(
      width: deviceWidth * widthFraction,
      height: deviceHeight * heightFraction,
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: (isDarkMode)
                ? Colors.black
                : colorScheme.inverseSurface.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(2, 4),
          ),
          BoxShadow(
            color: (isDarkMode)
                ? Colors.black
                : colorScheme.inverseSurface.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: CupertinoPopupSurface(
        isSurfacePainted: true,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 26, left: 16, right: 16, bottom: 8),
              child: Text(
                dialogTitle,
                style: textTheme.titleMedium?.copyWith(
                    color: colorScheme.inverseSurface.withOpacity(0.7)),
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
            Divider(
                thickness: 0.5,
                color: colorScheme.inverseSurface.withOpacity(0.5)),
            const SizedBox(height: 7),
            Expanded(
              child: Padding(
                padding: contentPadding,
                child: contentWidget,
              ),
            ),
            const SizedBox(height: 7),
            Divider(
                height: 0.4,
                thickness: 0.7,
                color: colorScheme.inverseSurface.withOpacity(0.5)),
            Padding(
              padding: const EdgeInsets.all(0),
              child: SizedBox(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AppDialogsButtonsStyles.customCancelDB(context),
                    AppDividers.dividerBetweenDialogButtons(context),
                    AppDialogsButtonsStyles.customActionDB(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

/* 
     Custom ANDROID dialog Style with Glassmorphism
   */
  static Widget customAndroidDialogStyle({
    required BuildContext context,
    required double widthFraction,
    required double heightFraction,
    required String dialogTitle,
    required Widget contentWidget,
    required EdgeInsets contentPadding,
  }) {
    final theme = Helpers.themeGet(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final isDarkMode = Helpers.isDarkTheme(theme);

    return Stack(
      children: [
        Dialog(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * widthFraction,
            height: MediaQuery.of(context).size.height * heightFraction,
            padding: const EdgeInsets.all(0),
            decoration: BoxDecoration(
              border: Border.all(
                color: (isDarkMode)
                    ? AppColors.cupertinoBlackColor.withOpacity(0.4)
                    : colorScheme.inverseSurface.withOpacity(0.1),
                width: 0.2,
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: (isDarkMode)
                      ? AppColors.cupertinoBlackColor
                      : colorScheme.inverseSurface.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: const Offset(2, 4),
                ),
                BoxShadow(
                  color: (isDarkMode)
                      ? AppColors.cupertinoBlackColor
                      : colorScheme.inverseSurface.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                    child: Container(
                      decoration: BoxDecoration(
                        color: colorScheme.surface.withOpacity(0.65),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.2),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 26, left: 16, right: 16, bottom: 8),
                        child: Text(
                          dialogTitle,
                          style: textTheme.titleMedium?.copyWith(
                              color: colorScheme.onSurface.withOpacity(0.7)),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Divider(
                          thickness: 0.5,
                          color: colorScheme.onSurface.withOpacity(0.5)),
                      const SizedBox(height: 7),
                      Expanded(
                        child: Padding(
                          padding: contentPadding,
                          child: contentWidget,
                        ),
                      ),
                      const SizedBox(height: 7),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            color: colorScheme.surface.withOpacity(0.5),
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppDialogsButtonsStyles.customAndroidCancelButton(context),
                AppDividers.dividerBetweenDialogButtons(context),
                AppDialogsButtonsStyles.customAndroidActionButton(context),
              ],
            ),
          ),
        ),
      ],
    );
  }

/* From JBnTrackeR APP
 */
  static Widget customAlertDialog({
    required BuildContext context,
    required bool isConfirmation,
    String? text,
    Function()? onConfirm,
    String? confirmButtonText,
    String? cancelButtonText,
  }) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      backgroundColor: Colors.transparent,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text ?? '',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16.0),
              isConfirmation == false
                  ? SizedBox(
                      height: 100,
                      child: Center(
                        child: Column(
                          children: [
                            const SizedBox(height: 15),
                            AnimatedContainer(
                              width: 60,
                              height: 60,
                              duration: const Duration(seconds: 10),
                              curve: Curves.easeInOutQuint,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: Colors.amber,
                                  width: 1.0,
                                ),
                              ),
                              child: Center(
                                child: GestureDetector(
                                  onTap: onConfirm,
                                  child: const IconAnimated(
                                    color: Colors.amber,
                                    active: true,
                                    size: 55,
                                    iconType: IconType.check,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 100,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                              onPressed: onConfirm,
                              child: Text(
                                confirmButtonText ?? 'Так',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 25,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                cancelButtonText ?? 'Ні',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 25,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

/* DIALOG FROM GG APP
 */
  static Widget dialogFromGG({
    required BuildContext context,
    required String text4Body,
    required String yesButtonText,
    required String noButtonText,
    required String mappingKey,
    String? productID,
    bool? isNewProductItem,
    DateTime? createdAt,
    String? userId,
    int? bonusRequest,
    bool? isFinishedOrder,
  }) {
    final mappingHelperService = GetIt.instance<MappingHelperService>();
    return Container(
      decoration: BoxDecoration(
        color: AppColors.black1.withOpacity(0.65),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 0.1),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: AlertDialog(
          backgroundColor: AppColors.grey1.withOpacity(0.96),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  text4Body,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    child: Text(
                      noButtonText,
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.kAppPrimaryColor.withOpacity(0.7),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text(
                      yesButtonText,
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.kAppPrimaryColor.withOpacity(0.7),
                      ),
                    ),
                    onPressed: () {
                      mappingHelperService.executeMapping(
                        mappingKey,
                        productId: productID,
                        isNewProductItem: isNewProductItem,
                        createdAt: createdAt,
                        userId: userId,
                        bonusRequest: bonusRequest,
                        isFinishedOrder: isFinishedOrder,
                      );
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ],
          ),
          contentPadding: const EdgeInsets.only(top: 10),
          actionsPadding: const EdgeInsets.all(3),
        ),
      ),
    );
  }
}
