import 'package:blueprint_4app/UI_layout/Components/Buttons/_icon_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../State_management/Helpers/Common/helpers.dart';
import '../../Components/_Widgets_STYLING/_text_styles_for_components.dart';
import '../../Components/Buttons/_app_buttons.dart';
import '../../Components/Text_fields/cupertino_tf2.dart';

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
        leading: AppIconButtons.backIcon(context, colorScheme: colorScheme),
        middle: Text('New Screen',
            style: AppTextStyles.appBarTitle(
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
            AppCustomButtons.submitButton(context,
                colorScheme: colorScheme, onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
