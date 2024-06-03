import 'package:flutter/material.dart';

import '../../State_management/Src/Custom_icons/app_icons.dart';
import '../../State_management/Src/Helpers/helpers.dart';
import '../Static/mini_widgets.dart';
import '../0_Widgets_STYLING/0.text_styles_for_components.dart';

class IconPickerWidget extends StatefulWidget {
  final ValueChanged<IconData> onIconSelected;
  final Color colorOfIcon;
  const IconPickerWidget({
    super.key,
    required this.onIconSelected,
    required this.colorOfIcon,
  });

  @override
  State<IconPickerWidget> createState() => _IconPickerWidgetState();
}

class _IconPickerWidgetState extends State<IconPickerWidget> {
  late IconData selectedIcon;
  late List<IconData> iconsForChoosing;

  @override
  void initState() {
    selectedIcon = AppIcons.customIcons[0];
    iconsForChoosing = AppIcons.customIcons;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: IconButton(
        icon: AppIcons.flipIcon(15),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Theme.of(context).colorScheme.surface,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                titlePadding: const EdgeInsets.only(
                  top: 20,
                  bottom: 12,
                  left: 10,
                  right: 10,
                ),
                actionsPadding: const EdgeInsets.only(top: 10, bottom: 0),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 10,
                ),
                title: Text(
                  "Вибір іконки",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                content: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      mainAxisSpacing: 5.0,
                      crossAxisSpacing: 5.0,
                    ),
                    shrinkWrap: true,
                    itemCount: iconsForChoosing.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        onTap: () {
                          setState(() {
                            selectedIcon = iconsForChoosing[index];
                          });
                          widget.onIconSelected(iconsForChoosing[index]);
                          Navigator.pop(context);
                        },
                        title: Icon(
                          iconsForChoosing[index],
                          color: widget.colorOfIcon,
                          size: 15,
                        ),
                      );
                    },
                  ),
                ),
                actions: <Widget>[
                  SizedBox(
                    height: 60,
                    child: Column(
                      children: [
                        MiniWidgets.boldDivider(
                          Helpers.isDarkTheme(context),
                        ),
                        MiniWidgets.boldDivider(
                          Helpers.isDarkTheme(context),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "Закрити",
                              style:
                                  TextStyle4Components.buttonTextStyle(context)
                                      .copyWith(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
