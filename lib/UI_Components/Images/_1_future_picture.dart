import 'package:flutter/material.dart';
import '../../State_management/Src/Helpers/dm_methods.dart';
import '../../State_management/Theme_configuration/App_colors_palette/this_app_colors.dart';

class FuturePicture extends StatelessWidget {
  final String pictureTitle;
  final bool isProductPicture;
  final bool isCertificate;
  const FuturePicture({
    required this.pictureTitle,
    required this.isProductPicture,
    required this.isCertificate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: DMMethodsOnDB().getDownloadURLForImage(
          pictureTitle, isProductPicture, isCertificate),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Icon(
              Icons.error_outline,
              color: ThisAppColors.amber2,
            ),
          );
        } else {
          return Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
              ),
            ),
            child: buildImageWidget(snapshot.data),
          );
        }
      },
    );
  }
}

Widget buildImageWidget(String? downloadURL) {
  if (downloadURL != null) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(5.0),
        bottomLeft: Radius.circular(5.0),
      ),
      child: Image.network(
        downloadURL,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  } else {
    return Container();
  }
}


 // if (snapshot.connectionState == ConnectionState.waiting) {
        //   return const CircularProgressIndicator(
        //       color: Colors.amber, strokeWidth: 10);
        // } else
        //