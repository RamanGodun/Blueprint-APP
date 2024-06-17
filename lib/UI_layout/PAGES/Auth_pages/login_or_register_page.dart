import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../State_management/Helpers/Common/helpers.dart';
import '../../../State_management/Models/app_enums.dart';
import '../../../State_management/Services/auth_service.dart';
import '../../../State_management/Services/_service_locator.dart';
import '../../Components/Buttons/app_buttons.dart';
import '../../Components/Cards_and_tiles/sign_in_tile.dart';
import '../../Components/Images/image_widgets.dart';
import '../../Components/Mini_widgets/dividers.dart';
import '../../Components/Switchers/auth_mode_switcher.dart';
import '../../Components/Cashed_widgets/cashed_widgets.dart';
import '../../Components/Text_fields/text_form.dart';
import '../../Components/Text_widgets/forgot_password.dart';
import '../../Components/Text_widgets/text_widgets.dart';

class LoginOrRegisterPage extends StatefulWidget {
  final Function() changeAuthMode;
  final bool isLoginPage;

  const LoginOrRegisterPage({
    super.key,
    required this.changeAuthMode,
    required this.isLoginPage,
  });

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  final AuthService authService = DIServiceLocator.instance.get<AuthService>();
  final _formKey = GlobalKey<FormState>();
  final List<String> textControllersValues = ["", "", ""];
  bool isLoading = false;
  late ThemeData theme;
  late ColorScheme colorScheme;
  late TextTheme textTheme;
  late Size deviceSize;
  late ValueNotifier<bool> isButtonActive;

  @override
  void initState() {
    super.initState();
    isButtonActive = ValueNotifier<bool>(false);
    authService.addListener(() {
      if (mounted) {
        setState(() {
          isLoading = authService.isLoading;
        });
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    deviceSize = Helpers.deviceSizeGet(context);
    theme = Helpers.themeGet(context);
    colorScheme = theme.colorScheme;
    textTheme = theme.textTheme;
  }

  void _updateButtonState() {
    isButtonActive.value = _formKey.currentState?.validate() ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? AppCashedWidgets.loadingWidget
        : CupertinoPageScaffold(
            backgroundColor: colorScheme.surface,
            child: Material(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(height: 50),
                        AppImages.appLogoWidget(deviceSize, colorScheme),
                        const SizedBox(height: 50),
                        AppTextWidgets.greetingsText(theme, widget.isLoginPage),
                        const SizedBox(height: 25),
                        AppTextFormField(
                          theme: theme,
                          hintText: 'Email',
                          icon: Icons.mail,
                          validatorType: ValidatorType.email,
                          onChanged: (value) {
                            textControllersValues[0] = value;
                            _updateButtonState();
                          },
                        ),
                        AppTextFormField(
                          theme: theme,
                          hintText: 'Password',
                          isObscureText: true,
                          icon: Icons.lock,
                          validatorType: ValidatorType.double,
                          onChanged: (value) {
                            textControllersValues[1] = value;
                            _updateButtonState();
                          },
                        ),
                        if (!widget.isLoginPage)
                          AppTextFormField(
                            theme: theme,
                            hintText: 'Confirm password',
                            isObscureText: true,
                            icon: Icons.lock_outline,
                            validatorType: ValidatorType.integer,
                            onChanged: (value) {
                              textControllersValues[2] = value;
                              _updateButtonState();
                            },
                          ),
                        if (widget.isLoginPage)
                          const ForgotPasswordTextWidget(),
                        const SizedBox(height: 45),
                        ValueListenableBuilder<bool>(
                          valueListenable: isButtonActive,
                          builder: (context, value, child) {
                            return AppButtons.signInUp(context,
                                isLoginPage: widget.isLoginPage,
                                onPressed: value
                                    ? () => authService.signUserInOrUp(
                                        context,
                                        widget.isLoginPage,
                                        textControllersValues)
                                    : null);
                          },
                        ),
                        const SizedBox(height: 50),
                        AppDividers.dividerForSignPage(theme),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SignInTile(
                                  onTap: _googleSignIn,
                                  logInType: LogInType.googleSignIn),
                              const SizedBox(width: 25),
                              SignInTile(
                                  onTap: () {},
                                  logInType: LogInType.appleSignIn),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 45.0, bottom: 20),
                          child: AuthModeSwitcher(
                              isLoginPage: widget.isLoginPage,
                              changeAuthMode: widget.changeAuthMode),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }

  Future<void> _googleSignIn() async {
    await authService.signInWithGoogle();
  }
}
