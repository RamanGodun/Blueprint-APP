import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../buttons/dialog_buttons.dart';
import '../static/static_widgets.dart';

class CustomCupertinoDialog extends StatelessWidget {
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
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Center(
      child: CupertinoPopupSurface(
        isSurfacePainted: true,
        child: SafeArea(
          child: Container(
            width: size.width * dialogWidth,
            height: size.height * dialogHeight,
            padding: const EdgeInsets.all(0),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: colorScheme.inverseSurface.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 15,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 16, left: 12, right: 12, bottom: 8),
                  child: Text(
                    dialogTitle,
                    style: textTheme.titleMedium,
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
                    height: 50,
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
    );
  }
}
