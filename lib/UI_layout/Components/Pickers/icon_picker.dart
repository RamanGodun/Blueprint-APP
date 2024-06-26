import 'package:flutter/material.dart';

import '../../../State_management/Src/Custom_icons/app_icons.dart';
import '../../../State_management/Helpers/Common/helpers.dart';
import '../Mini_widgets/dividers.dart';
import '../_General_STYLING_set/app_text_styling.dart';

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
  late ThemeData theme;
  late ColorScheme colorScheme;
  late TextTheme textTheme;
  late Size deviceSize;
  late bool isDarkMode;

  @override
  void initState() {
    selectedIcon = AppIcons.customIcons[0];
    iconsForChoosing = AppIcons.customIcons;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = Helpers.themeGet(context);
    colorScheme = theme.colorScheme;
    textTheme = theme.textTheme;
    isDarkMode = Helpers.isDarkTheme(theme);
    deviceSize = Helpers.deviceSizeGet(context);
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
                backgroundColor: colorScheme.surface,
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
                  style: textTheme.labelLarge,
                ),
                content: SizedBox(
                  height: deviceSize.height * 0.5,
                  width: deviceSize.width * 0.5,
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
                        AppDividers.boldDivider(theme),
                        AppDividers.boldDivider(theme),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "Закрити",
                              style: AppTextStyling.forButtons(theme).copyWith(
                                color: theme.primaryColor,
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
