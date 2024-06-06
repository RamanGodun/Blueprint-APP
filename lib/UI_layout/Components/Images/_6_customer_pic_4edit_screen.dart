import 'dart:io';
import 'package:flutter/material.dart';

import '../../../State_management/Theme_configuration/this_app_colors.dart';

class ProfileImageWidget extends StatelessWidget {
  final bool isLoading;
  final File? selectedImageOfCustomer;
  final String? profilePictureUrl;
  final Function() onTap;

  const ProfileImageWidget({
    super.key,
    required this.isLoading,
    required this.selectedImageOfCustomer,
    required this.profilePictureUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: isLoading
          ? const Padding(
              padding: EdgeInsets.all(20.0),
              child: CircularProgressIndicator(
                color: Colors.amber,
                strokeWidth: 5,
              ),
            )
          : selectedImageOfCustomer != null
              ? Image.file(selectedImageOfCustomer!)
              : profilePictureUrl != null
                  ? SizedBox(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                        child: Image.network(
                          profilePictureUrl!,
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
