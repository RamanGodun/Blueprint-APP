import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../UI_Components/0_Widgets_STYLING/0.text_styles_for_components.dart';
import '../../UI_Components/Text_fields.dart/cupertino_tf2.dart';
import '../../state_management/src/custom_icons/app_icons.dart';
import '../../state_management/src/helpers/helpers.dart';
import '../../ui_components/buttons/static_buttons.dart';

class TextFieldPage extends HookWidget {
  static const routeName = '/start_page/new_screen';

  const TextFieldPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController();
    final isValid = useState(true);
    final colorScheme = Helpers.colorScheme(context);
    final cupertinoTheme = Helpers.cupertinoThemeData(context);

    void validateInput() {
      isValid.value = textController.text.isNotEmpty;
    }

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: AppIcons.backIcon(context, colorScheme),
        middle: Text('New Screen',
            style: TextStyle4Components.appBarTitle(
                cupertinoTheme: cupertinoTheme, colorScheme: colorScheme)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoTextField2(
              textController: textController,
              isValid: isValid,
              validateInput: validateInput,
            ),
            if (!isValid.value)
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  'This field cannot be empty',
                  style: TextStyle(
                    color: CupertinoColors.destructiveRed,
                    fontSize: 12,
                  ),
                ),
              ),
            const SizedBox(height: 20),
            StaticCustomButtons.cupertinoButton1(context, buttonText: 'Submit'),
          ],
        ),
      ),
    );
  }
}
