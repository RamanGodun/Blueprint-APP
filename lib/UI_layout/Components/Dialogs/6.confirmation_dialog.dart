import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../State_management/Src/Const_data/strings_4_app.dart';
import '../../../State_management/Helpers/Common/helpers.dart';
import '../_Widgets_STYLING/0.text_styles_for_components.dart';

class ConfirmationDialog extends StatefulWidget {
  const ConfirmationDialog({super.key});

  @override
  State<ConfirmationDialog> createState() => _ConfirmationDialogState();
}

class _ConfirmationDialogState extends State<ConfirmationDialog> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 25), () {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Helpers.textTheme(context);
    ColorScheme colorScheme = Helpers.colorScheme(context);

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 10),
      child: CupertinoAlertDialog(
        insetAnimationDuration: const Duration(milliseconds: 100),
        title: Text(
          AppStrings.deleted,
          textAlign: TextAlign.center,
          style: textTheme.displayLarge!.copyWith(
            color: colorScheme.onSurface,
          ),
        ),
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 5),
              Text(
                AppStrings.successfulDeleting,
                style: textTheme.titleSmall,
                // textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
        actions: [
          CupertinoDialogAction(
            textStyle: TextStyle4Components.buttonTextStyle(context),
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(AppStrings.oKText),
          ),
        ],
      ),
    );
  }
}
