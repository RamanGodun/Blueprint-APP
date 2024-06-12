import 'package:blueprint_4app/UI_layout/Components/Buttons/icon_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../State_management/Helpers/Common/helpers.dart';
import '../../../State_management/Theme_configuration/app_colors.dart';
import '../../Components/Text_widgets/text_widgets.dart';
import '../../Components/Buttons/app_buttons.dart';
import '../../Components/Text_fields/app_text_fields.dart';

class TextFieldPage extends HookWidget {
  static const routeName = '/start_page/new_screen';
  const TextFieldPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Helpers.themeGet(context);
    final textController = useTextEditingController();
    final isValid = useState(true);

    void validateInput() {
      isValid.value = textController.text.isNotEmpty;
    }

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: AppIconButtons.backIcon(context),
        middle: AppTextWidgets.forAppBarTitle(context,
            theme: theme, text: "New Screen"),
      ),
      child: Material(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTextField(
                theme: theme,
                controller: textController,
                isValid: isValid,
                validateInput: validateInput,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (!isValid.value)
                    const Text(
                      'This field cannot be empty',
                      style: TextStyle(
                        color: AppColors.kErrorColor,
                        fontSize: 12,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 20),
              AppCustomButtons.submitButton(
                context,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
