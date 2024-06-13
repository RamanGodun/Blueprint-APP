import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:icon_animated/icon_animated.dart';
import 'dart:ui';

import '../../../State_management/Models/app_enums.dart';
import '../../../State_management/Services/mapping_service.dart';
import '../../../State_management/Theme_configuration/app_colors.dart';
import '../Buttons/dialog_buttons.dart';
import '../Mini_widgets/dividers.dart';
import '../../../State_management/Helpers/Common/helpers.dart';
import '../Mini_widgets/mini_widgets.dart';
import '../_Widgets_STYLING/app_borders.dart';
import '../_Widgets_STYLING/app_box_decoration.dart';
import '../_Widgets_STYLING/app_styling_constants.dart';
import '../_Widgets_STYLING/app_text_styling.dart';

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
    final deviceHeight = deviceSize.height;
    final deviceWidth = deviceSize.width;
    return Container(
      width: deviceWidth * widthFraction,
      height: deviceHeight * heightFraction,
      padding: AppStylingConstants.zeroPadding,
      decoration: AppBoxDecorations.forIOSDialog(theme),
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
                style: AppTextStyling.appBarTitle(context, theme),
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
            AppDividers.divider2(theme),
            const SizedBox(height: 7),
            Expanded(
              child: Padding(
                padding: contentPadding,
                child: contentWidget,
              ),
            ),
            const SizedBox(height: 7),
            AppDividers.dividerForCustomDialog(theme),
            Padding(
              padding: AppStylingConstants.zeroPadding,
              child: SizedBox(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AppDialogsButtons.custom(
                      context: context,
                      buttonType: DialogButtonType.cancelButtonInIOSStyle,
                    ),
                    AppDividers.dividerBetweenDialogButtons(theme),
                    AppDialogsButtons.custom(
                      context: context,
                      buttonType: DialogButtonType.actionButtonInIOSStyle,
                    ),
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
    final deviceSize = Helpers.deviceSizeGet(context);
    final deviceWidth = deviceSize.width;
    final deviceHeight = deviceSize.height;
    return Stack(
      children: [
        Dialog(
          backgroundColor: AppColors.transparent,
          shape: AppBordersStyling.rectangleBorderForDialog(theme),
          child: Container(
            width: deviceWidth * widthFraction,
            height: deviceHeight * heightFraction,
            padding: AppStylingConstants.zeroPadding,
            decoration: AppBoxDecorations.forAndroidDialog(theme),
            child: Stack(
              children: [
                AppMiniWidgets.backDropFilter(
                  child: Container(
                      decoration: AppBoxDecorations.forAndroidDialog1(theme)),
                ),
                Container(
                  padding: AppStylingConstants.zeroPadding,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 26, left: 16, right: 16, bottom: 8),
                        child: Text(
                          dialogTitle,
                          style: AppTextStyling.appBarTitle(context, theme),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      AppDividers.divider2(theme),
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
            padding: AppStylingConstants.allPadding10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppDialogsButtons.custom(
                  context: context,
                  buttonType: DialogButtonType.cancelButtonInAndroidType,
                ),
                AppDividers.dividerBetweenDialogButtons(theme),
                AppDialogsButtons.custom(
                  context: context,
                  buttonType: DialogButtonType.actionButtonInAndroidStyle,
                ),
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
    final theme = Helpers.themeGet(context);
    final colorScheme = theme.colorScheme;
    return Dialog(
      shape: AppBordersStyling.rectangleBorderForDialog(theme),
      backgroundColor: AppColors.transparent,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
        child: Container(
          decoration: BoxDecoration(
            color: colorScheme.onPrimary,
            borderRadius: AppStylingConstants.commonBorderRadius,
          ),
          padding: AppStylingConstants.allPadding10,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text ?? '',
                textAlign: TextAlign.center,
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
    final theme = Helpers.themeGet(context);
    final mappingHelperService = GetIt.instance<MappingHelperService>();
    return Container(
      decoration: AppBoxDecorations.forGG(theme),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: AlertDialog(
          backgroundColor: AppColors.grey1.withOpacity(0.96),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: AppStylingConstants.commonBorderRadius,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(text4Body, textAlign: TextAlign.center),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    child: Text(noButtonText),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text(yesButtonText),
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
