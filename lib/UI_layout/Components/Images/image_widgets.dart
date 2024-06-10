import 'dart:io';

import 'package:flutter/material.dart';
import '../../../State_management/Src/Generated_code/by spider/resources.dart';
import '../../../State_management/Theme_configuration/app_colors.dart';
import '../_Widgets_STYLING/images_styles.dart';

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

  static Image noImagePlaceholder() {
    return Image.network(
      "https://repository.kristti.com.ua/wp-content/themes/repa/img/img/nopicture.png.pagespeed.ce.SuI672BVIb.png",
      fit: BoxFit.cover,
      width: double.infinity,
      height: 135,
    );
  }

  /*
  Profile Image Widget
   */
  static Widget profileImageWidget({
    required bool isLoading,
    required File? selectedImageOfCustomer,
    required String? profilePictureUrl,
    required Function() onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: isLoading
          ? const Padding(
              padding: AppImagesStyles.circularProgressPadding,
              child: CircularProgressIndicator(
                color: Colors.amber,
                strokeWidth: 5,
              ),
            )
          : selectedImageOfCustomer != null
              ? Image.file(selectedImageOfCustomer)
              : profilePictureUrl != null
                  ? SizedBox(
                      child: ClipRRect(
                        borderRadius: AppImagesStyles.imageBorderRadius,
                        child: Image.network(
                          profilePictureUrl,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    )
                  : const Icon(
                      Icons.add_a_photo,
                      color: AppColors.kAppPrimaryColor,
                      size: 50,
                    ),
    );
  }
}
