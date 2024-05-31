import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../state_management/services/animation_controller.dart';
import '../buttons/dialog_action_buttons.dart';
import '../static/static_widgets.dart';
import 'package:get_it/get_it.dart';

class CustomCupertinoDialog extends HookWidget {
  final Widget contentWidget;
  final double dialogWidth;
  final double dialogHeight;
  final EdgeInsets contentPadding;
  final String dialogTitle;

  const CustomCupertinoDialog({
    super.key,
    required this.contentWidget,
    this.dialogWidth = 0.8,
    this.dialogHeight = 0.7,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 8),
    this.dialogTitle = 'Custom Cupertino Dialog title',
  });

  @override
  Widget build(BuildContext context) {
    final animationService = GetIt.instance<AnimationService>();

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: Center(
        child: ScaleTransition(
          scale: CurvedAnimation(
            parent: animationService.animation,
            curve: Curves.easeInOut,
          ),
          child: FadeTransition(
            opacity: animationService.animation,
            child: Container(
              width: size.width * dialogWidth,
              height: size.height * dialogHeight,
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
                            DialogStaticButtons.cancelButtonForDialog(context),
                            StaticWidgets.dividerBetweenDialogButtons(context),
                            DialogStaticButtons.actionButtonForDialog(context),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
