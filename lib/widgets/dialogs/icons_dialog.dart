import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../state_management/theme_settings/app_colorscheme.dart';
import '../buttons/dialog_action_buttons.dart';
import '../static/static_widgets.dart';

class CustomCupertinoDialog extends StatelessWidget {
  final Widget content;
  final double? dialogWidth;
  final double? dialogHeight;
  final EdgeInsets? contentPadding;
  final String dialogTitle;

  const CustomCupertinoDialog({
    super.key,
    required this.content,
    this.dialogWidth = 0.8,
    this.dialogHeight = 0.7,
    this.contentPadding = const EdgeInsets.only(left: 8, right: 8),
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
        child: Container(
          width: size.width * dialogWidth!,
          height: size.height * dialogHeight!,
          padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            boxShadow: [
              BoxShadow(
                color: colorScheme.inverseSurface,
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 2.3),
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
                  style: textTheme.titleLarge,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
              Divider(
                height: 0.7,
                color: ThisAppColors.dividerColor,
              ),
              const SizedBox(height: 7),
              Expanded(child: content),
              const SizedBox(height: 7),
              const Divider(height: 1, thickness: 0.3),
              Padding(
                padding: const EdgeInsets.all(0),
                child: SizedBox(
                  height: 45,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StaticButtons.cancelButtonForDialog(context),
                      StaticWidgets.dividerBetweenDialogButtons,
                      StaticButtons.actionButtonForDialog(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
