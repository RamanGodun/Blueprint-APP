import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../State_management/Models/app_enums.dart';
import '../../../State_management/Theme_configuration/app_colors.dart';
import '../../Components/Buttons/app_buttons.dart';
import '../../Components/Buttons/icon_buttons.dart';
import '../../Components/Text_fields/app_text_fields.dart';

class TextFieldPage extends StatefulWidget {
  static const routeName = '/start_page/new_screen';

  const TextFieldPage({super.key});

  @override
  State<TextFieldPage> createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  late CupertinoThemeData cupertinoTheme;
  late ThemeData theme;
  final Map<TextFields, String> textControllersValues = {
    TextFields.email: "",
    TextFields.password: "",
    TextFields.name: "",
  };
  late ValueNotifier<bool> isEmailValid, isPasswordValid, isButtonActive;

  @override
  void initState() {
    super.initState();
    isEmailValid = ValueNotifier<bool>(false);
    isPasswordValid = ValueNotifier<bool>(false);
    isButtonActive = ValueNotifier<bool>(false);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    cupertinoTheme = CupertinoTheme.of(context);
    theme = Theme.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            leading: AppIconButtons.backIcon(context),
            middle: const Text('Text Fields'),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppTextField(
                  theme: theme,
                  isValid: isEmailValid,
                  validatorType: ValidatorType.email,
                  onChanged: (value, isValid) {
                    textControllersValues[TextFields.email] = value;
                    _updateButtonState();
                  },
                ),
                const SizedBox(height: 10),
                AppTextField(
                  theme: theme,
                  isValid: isPasswordValid,
                  validatorType: ValidatorType.integer,
                  onChanged: (value, isValid) {
                    textControllersValues[TextFields.password] = value;
                    _updateButtonState();
                  },
                  isObscure: true,
                  hintText: 'Enter password',
                ),
                const SizedBox(height: 10),
                AppTextField(
                  theme: theme,
                  isValid: ValueNotifier<bool>(true),
                  isNeedsValidation: false,
                  onChanged: (value, isValid) {
                    textControllersValues[TextFields.name] = value;
                  },
                  hintText: 'Enter nickname',
                ),
                const SizedBox(height: 20),
                ValueListenableBuilder<bool>(
                  valueListenable: isButtonActive,
                  builder: (context, value, child) {
                    return AppButtons.submitButton(
                      context,
                      onPressed: value ? _submit : null,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _updateButtonState() {
    isButtonActive.value = isEmailValid.value && isPasswordValid.value;
  }

  void _submit() {
    // Handle submission logic
  }
}


/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../State_management/Models/app_enums.dart';
import '../../../State_management/Theme_configuration/app_colors.dart';
import '../../Components/Buttons/app_buttons.dart';
import '../../Components/Buttons/icon_buttons.dart';
import '../../Components/Text_fields/app_text_fields.dart';

class TextFieldPage extends StatefulWidget {
  static const routeName = '/start_page/new_screen';

  const TextFieldPage({super.key});

  @override
  State<TextFieldPage> createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> with RestorationMixin {
  late CupertinoThemeData cupertinoTheme;
  late ThemeData theme;
  final Map<TextFields, String> textControllersValues = {
    TextFields.email: "",
    TextFields.password: "",
    TextFields.name: "",
  };
  late ValueNotifier<bool> isEmailValid, isPasswordValid, isButtonActive;

  @override
  void initState() {
    super.initState();
    isEmailValid = ValueNotifier<bool>(false);
    isPasswordValid = ValueNotifier<bool>(false);
    isButtonActive = ValueNotifier<bool>(false);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    cupertinoTheme = CupertinoTheme.of(context);
    theme = Theme.of(context);
  }

  @override
  String? get restorationId => 'text_field_page';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(isEmailValid, 'email_valid');
    registerForRestoration(isPasswordValid, 'password_valid');
    registerForRestoration(isButtonActive, 'button_active');
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            leading: AppIconButtons.backIcon(context),
            middle: const Text('Text Fields'),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppTextField(
                  theme: theme,
                  isValid: isEmailValid,
                  validatorType: ValidatorType.email,
                  onChanged: (value, isValid) {
                    textControllersValues[TextFields.email] = value;
                    _updateButtonState();
                  },
                ),
                const SizedBox(height: 10),
                AppTextField(
                  theme: theme,
                  isValid: isPasswordValid,
                  validatorType: ValidatorType.integer,
                  onChanged: (value, isValid) {
                    textControllersValues[TextFields.password] = value;
                    _updateButtonState();
                  },
                  isObscure: true,
                  hintText: 'Enter password',
                ),
                const SizedBox(height: 10),
                AppTextField(
                  theme: theme,
                  isValid: ValueNotifier<bool>(true),
                  isNeedsValidation: false,
                  onChanged: (value, isValid) {
                    textControllersValues[TextFields.name] = value;
                  },
                  hintText: 'Enter nickname',
                ),
                const SizedBox(height: 20),
                ValueListenableBuilder<bool>(
                  valueListenable: isButtonActive,
                  builder: (context, value, child) {
                    return AppButtons.submitButton(
                      context,
                      onPressed: value ? _submit : null,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _updateButtonState() {
    isButtonActive.value = isEmailValid.value && isPasswordValid.value;
  }

  void _submit() {
    // Handle submission logic
  }
}

 */