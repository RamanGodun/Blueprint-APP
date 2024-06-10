import 'package:flutter/material.dart';
import '../_Widgets_STYLING/dialogs_styles.dart';

class CustomAlertDialog extends StatefulWidget {
  final bool isConfirmation;
  final String? text;
  final String? confirmButtonText;
  final String? cancelButtonText;
  final Function()? onConfirm;

  const CustomAlertDialog({
    super.key,
    required this.isConfirmation,
    this.text,
    this.onConfirm,
    this.confirmButtonText,
    this.cancelButtonText,
  });

  @override
  State<CustomAlertDialog> createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  @override
  void initState() {
    super.initState();
    if (widget.isConfirmation == true) {
      Future.delayed(const Duration(seconds: 10), () {
        Navigator.pop(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppDialogsStyles.customAlertDialog(
      context: context,
      isConfirmation: widget.isConfirmation,
      text: widget.text,
      onConfirm: widget.onConfirm,
      confirmButtonText: widget.confirmButtonText,
      cancelButtonText: widget.cancelButtonText,
    );
  }
}
