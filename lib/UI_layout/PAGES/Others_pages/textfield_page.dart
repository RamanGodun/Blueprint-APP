import 'package:blueprint_4app/UI_layout/Components/Buttons/icon_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../State_management/Theme_configuration/app_colors.dart';
import '../../Components/_Widgets_STYLING/app_text_styles_for_ui.dart';
import '../../Components/Buttons/app_buttons.dart';
import '../../Components/Text_fields/_cupertino_tf2.dart';

class TextFieldPage extends HookWidget {
  static const routeName = '/start_page/new_screen';
  const TextFieldPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController();
    final isValid = useState(true);

    void validateInput() {
      isValid.value = textController.text.isNotEmpty;
    }

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: AppIconButtons.backIcon(context),
        middle: Text('New Screen', style: AppTextStyles.appBarTitle(context)),
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
                    color: AppColors.kErrorColor,
                    fontSize: 12,
                  ),
                ),
              ),
            const SizedBox(height: 20),
            AppCustomButtons.submitButton(
              context,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
