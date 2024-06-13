import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';

import '../../../State_management/Services/animation_controller_service.dart';
import '_dialogs_styling.dart';

class CustomDialog extends HookWidget {
  final Widget contentWidget;
  final EdgeInsets contentPadding;
  final double widthFraction;
  final double heightFraction;
  final String dialogTitle;
  final bool isIOSStyle;

  const CustomDialog({
    super.key,
    required this.contentWidget,
    this.widthFraction = 0.8,
    this.heightFraction = 0.7,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 8),
    this.dialogTitle = 'Custom Dialog title',
    this.isIOSStyle = true,
  });

  @override
  Widget build(BuildContext context) {
    final animationService = GetIt.instance<AnimationService>();

    return SafeArea(
      child: Center(
        child: ScaleTransition(
          scale: CurvedAnimation(
            parent: animationService.animation,
            curve: Curves.easeInOut,
          ),
          child: FadeTransition(
            opacity: animationService.animation,
            child: isIOSStyle
                ? AppDialogsStyles.customCupertinoDialogStyle(
                    context: context,
                    widthFraction: widthFraction,
                    heightFraction: heightFraction,
                    dialogTitle: dialogTitle,
                    contentWidget: contentWidget,
                    contentPadding: contentPadding,
                  )
                : AppDialogsStyles.customAndroidDialogStyle(
                    context: context,
                    widthFraction: widthFraction,
                    heightFraction: heightFraction,
                    dialogTitle: dialogTitle,
                    contentWidget: contentWidget,
                    contentPadding: contentPadding,
                  ),
          ),
        ),
      ),
    );
  }
}
