import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../state_management/const_data/custom_icons_list.dart';
import '../../../theme_configuration/app_colorscheme.dart';
import 'dialog_action_buttons.dart';

class CustomIconsDialog extends StatefulWidget {
  const CustomIconsDialog({super.key});

  @override
  State<CustomIconsDialog> createState() => _CustomIconsDialogState();
}

class _CustomIconsDialogState extends State<CustomIconsDialog> {
  late ColorScheme colorScheme;
  late TextTheme textTheme;
  late Size size;
  late TextStyle? textStyle;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    colorScheme = Theme.of(context).colorScheme;
    textTheme = Theme.of(context).textTheme;
    size = MediaQuery.of(context).size;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoPopupSurface(
        isSurfacePainted: true,
        child: Container(
          width: size.width * 0.8,
          height: size.height * 0.7,
          padding: const EdgeInsets.only(left: 8, right: 8, top: 17),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.9),
                spreadRadius: 5,
                blurRadius: 10,
                offset: const Offset(0, 2.3),
              ),
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Custom Icons',
                  style: textTheme.titleMedium,
                ),
              ),
              Divider(
                height: 0.7,
                color: ThisAppColors.dividerColor,
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(16.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                  ),
                  itemCount: ThisAppCustomIcons().myCustomIconsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final IconData icon =
                        ThisAppCustomIcons().myCustomIconsList[index];
                    return Icon(icon, size: 22, color: colorScheme.onSurface);
                  },
                ),
              ),
              const Divider(height: 1),
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 12),
                child: SizedBox(
                  height: 35,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // _CancelButtonWidget(),
                      StaticButtons.cancelButtonForDialog(context),
                      const _CustomDividerBetweenActionButtons(),
                      // const _ActionButtonWidget(),
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

class _CustomDividerBetweenActionButtons extends StatelessWidget {
  const _CustomDividerBetweenActionButtons();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 40,
      color: ThisAppColors.dividerColor,
    );
  }
}
