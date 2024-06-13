import 'package:blueprint_4app/State_management/Theme_configuration/app_colors.dart';
import 'package:blueprint_4app/UI_layout/Components/_Widgets_STYLING/app_borders.dart';
import 'package:blueprint_4app/UI_layout/Components/_Widgets_STYLING/app_styling_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../../../../State_management/Src/Custom_icons/app_icons.dart';
import '../../../../State_management/Helpers/Common/helpers.dart';
import '../../Mini_widgets/dividers.dart';
import '../../_Widgets_STYLING/app_text_styling.dart';

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
  Color currentColor = AppColors.cupertinoBlackColor;
  late ThemeData theme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = Helpers.themeGet(context);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return IconButton(
      icon: AppIcons.flipIcon(15),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 70),
              child: AlertDialog(
                backgroundColor: colorScheme.surface,
                shape: AppBordersStyling.rectangleBorderForDialog(theme),
                // titlePadding: AppPickersStyle.titlePadding(),
                // actionsPadding: AppPickersStyle.actionsPadding(),
                contentPadding: AppStylingConstants.horizontal8,
                title: Column(
                  children: [
                    Text("Вибір кольору",
                        textAlign: TextAlign.center,
                        style: textTheme.labelLarge),
                    AppDividers.boldDivider(theme),
                    AppDividers.boldDivider(theme),
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
                        AppDividers.boldDivider(theme),
                        AppDividers.boldDivider(theme),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                "Відміна",
                                style: AppTextStyling.forButtons(theme)
                                    .copyWith(
                                        color: colorScheme.onSurface,
                                        fontWeight: FontWeight.w300),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                widget.onColorChanged(currentColor);
                              },
                              child: Text(
                                "Обрати",
                                style: AppTextStyling.forButtons(theme)
                                    .copyWith(color: colorScheme.primary),
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
