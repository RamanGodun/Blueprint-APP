import 'package:blueprint_4app/UI_layout/Components/Buttons/icon_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../State_management/Helpers/Common/helpers.dart';
import '../../../State_management/Models/app_enums.dart';
import '../../../State_management/Services/text_validation_service.dart';
import '../../Components/Text_widgets/text_widgets.dart';
import '../../Components/Buttons/app_buttons.dart';
import '../../Components/Text_fields/app_text_fields.dart';

class TextFieldPage extends StatefulWidget {
  static const routeName = '/start_page/new_screen';
  const TextFieldPage({super.key});

  @override
  State<TextFieldPage> createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  late TextEditingController textController;
  late bool isValid;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    isValid = true;
  }

  @override
  Widget build(BuildContext context) {
    theme = Helpers.themeGet(context);

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
                isValid: ValueNotifier(isValid),
                validatorType: ValidatorType.integer,
              ),
              const SizedBox(height: 20),
              AppButtons.submitButton(
                context,
                onPressed: validateInput,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void validateInput() {
    final validator = TextFieldValidationService.getValidatorFunction(
        ValidatorType.integer, false);
    final isValidInput = validator?.call(textController.text) == null;
    setState(() {
      isValid = isValidInput;
    });
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }
}
