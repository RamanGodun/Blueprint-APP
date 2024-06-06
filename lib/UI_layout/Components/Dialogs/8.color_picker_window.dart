import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../../../State_management/Src/Custom_icons/app_icons.dart';
import '../../../State_management/Helpers/Common/helpers.dart';
import '../Static/dividers.dart';
import '../_Widgets_STYLING/_text_styles_for_components.dart';

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
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height / 10),
              child: AlertDialog(
                backgroundColor: Theme.of(context).colorScheme.surface,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                titlePadding: const EdgeInsets.only(
                    top: 20, bottom: 12, left: 10, right: 10),
                actionsPadding: const EdgeInsets.only(top: 10, bottom: 0),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
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
                              padding: const EdgeInsets.only(top: 8.0),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  "Відміна",
                                  style: TextStyle4Components.buttonTextStyle(
                                          context)
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurface,
                                          fontWeight: FontWeight.w300),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  widget.onColorChanged(currentColor);
                                },
                                child: Text(
                                  "Обрати",
                                  style: TextStyle4Components.buttonTextStyle(
                                          context)
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
