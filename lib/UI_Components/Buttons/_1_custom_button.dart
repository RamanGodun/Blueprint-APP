import 'package:flutter/material.dart';
import '../../State_management/Theme_configuration/App_colors_palette/my_first_top_design.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double? width;
  final double? height;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height = 45,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: IOSDarkThemeColors.yellow2.withOpacity(0.9),
          foregroundColor: IOSDarkThemeColors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: IOSDarkThemeColors.black,
          ),
        ),
      ),
    );
  }
}
