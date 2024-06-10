import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../../../../State_management/Src/Custom_icons/app_icons.dart';
import '../../../../State_management/Helpers/Common/helpers.dart';
import '../../Mini_widgets/dividers.dart';
import '../../_Widgets_STYLING/pickers_styles.dart';
import '../../_Widgets_STYLING/app_text_styles_for_ui.dart';

class ColorPickerWidget extends StatefulWidget {
  const ColorPickerWidget({
    super.key,
    required this.onColorChanged,
    required this.subCategoryColor,
  });

  final Function(Color) onColorChanged;
  final Color subCategoryColor;

  @override
  State<ColorPickerWidget> createState() => _ColorPickerWidgetState();
}

class _ColorPickerWidgetState extends State<ColorPickerWidget> {
  Color currentColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: AppIcons.flipIcon(15),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Padding(
              padding: AppPickersStyle.dialogPadding(context),
              child: AlertDialog(
                backgroundColor: Theme.of(context).colorScheme.surface,
                shape: AppPickersStyle.dialogShape(),
                titlePadding: AppPickersStyle.titlePadding(),
                actionsPadding: AppPickersStyle.actionsPadding(),
                contentPadding: AppPickersStyle.contentPadding(),
                title: Column(
                  children: [
                    Text("Вибір кольору",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelLarge),
                    AppDividers.boldDivider(Helpers.isDarkTheme(context)),
                    AppDividers.boldDivider(Helpers.isDarkTheme(context)),
                  ],
                ),
                content: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ColorPicker(
                        labelTypes: const [],
                        pickerColor: widget.subCategoryColor,
                        colorPickerWidth: 270,
                        onColorChanged: (color) {
                          setState(() {
                            currentColor = color;
                          });
                        },
                        pickerAreaHeightPercent: 0.8,
                        portraitOnly: true,
                        pickerAreaBorderRadius:
                            const BorderRadius.all(Radius.circular(7)),
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  SizedBox(
                    height: 60,
                    child: Column(
                      children: [
                        AppDividers.boldDivider(Helpers.isDarkTheme(context)),
                        AppDividers.boldDivider(Helpers.isDarkTheme(context)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: AppPickersStyle.buttonPadding(),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  "Відміна",
                                  style: AppTextStyles.forButtons(context)
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurface,
                                          fontWeight: FontWeight.w300),
                                ),
                              ),
                            ),
                            Padding(
                              padding: AppPickersStyle.buttonPadding(),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  widget.onColorChanged(currentColor);
                                },
                                child: Text(
                                  "Обрати",
                                  style: AppTextStyles.forButtons(context)
                                      .copyWith(
                                          color:
                                              Theme.of(context).primaryColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}