import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../State_management/Theme_configuration/app_colors.dart';

class EditFormImage extends StatefulWidget {
  final String? currentProfileImage;
  final void Function(File? image) onImagePicked;
  final double? size;

  const EditFormImage({
    super.key,
    required this.onImagePicked,
    required this.currentProfileImage,
    this.size = 150,
  });

  @override
  State<EditFormImage> createState() => _EditFormImageState();
}

class _EditFormImageState extends State<EditFormImage> {
  File? _pickedImage;

  Future<void> pickProfileImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
      });
      widget.onImagePicked(_pickedImage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.kAppPrimaryColor,
        ),
      ),
      child: InkWell(
        onTap: pickProfileImage,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: _pickedImage == null
              ? (widget.currentProfileImage == null ||
                      widget.currentProfileImage!.isEmpty)
                  ? Center(
                      child: Icon(
                        Icons.add_a_photo,
                        color: Theme.of(context).primaryColor.withOpacity(0.6),
                        size: 90,
                      ),
                    )
                  : Image.network(
                      widget.currentProfileImage!,
                      fit: BoxFit.cover,
                    )
              : Image.file(
                  _pickedImage!,
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }
}



//TO USE IN ANOTHER WIDGET:
// File? _pickedImage;
//  void _handleImagePicked(File? image) {
//     _pickedImage = image;
//   }

//   EditFormImage(
//     onImagePicked: _handleImagePicked,
//     currentProfileImage: _currentProfileImage,
//   ),