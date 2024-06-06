// ignore_for_file: public_member_api_docs, sort_constructors_first, use_build_context_synchronously
// general

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../State_management/Providers/Providers_for_store/auth_profile_provider.dart';
import '../../../../State_management/Helpers/For_auth/dm_methods.dart';
import '../../../../State_management/Helpers/Common/helpers.dart';
import '../../../../State_management/Theme_configuration/this_app_colors.dart';
import '../../../Components/Buttons/custom_button_from_first.dart';
import '../../../Components/Text_fields/my_custom_text_field.dart';

class AuthScreen extends StatefulWidget {
  final bool isNeedRegistration;
  const AuthScreen({
    super.key,
    required this.isNeedRegistration,
  });

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final formKey1 = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  late bool _isNeedRegistration;
  final textStyle = const TextStyle(
      fontSize: 18,
      color: Colors.white,
      fontWeight: FontWeight.w800,
      letterSpacing: 1);

  @override
  void initState() {
    _isNeedRegistration = widget.isNeedRegistration;
    if (!_isNeedRegistration) {
      _fetchUserDataFromSharedPreferences();
    }
    super.initState();
  }

// getting data for autocomplete
  Future<void> _fetchUserDataFromSharedPreferences() async {
    final sP = await SharedPreferences.getInstance();
    final account = sP.getString('account') ?? '';
    final phoneNumber = sP.getString('phoneNumber') ?? '';

    setState(() {
      _nameController.text = account;
      _phoneController.text = phoneNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    _phoneController.selection = TextSelection.fromPosition(
        TextPosition(offset: _phoneController.text.length));

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(children: [
        Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/auth screen.png'),
                    fit: BoxFit.cover))),
        SafeArea(
          child: Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Form(
              key: formKey1,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 80),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      SizedBox(
                          height: 48,
                          width: 80,
                          child:
                              Image.asset("assets/logo.png", fit: BoxFit.fill)),
                      Text(
                        (_isNeedRegistration == true)
                            ? "Зареєструватись"
                            : "Вхід до системи",
                        style: const TextStyle(
                            color: ThisAppColors.kAppPrimaryColor,
                            fontSize: 19,
                            fontWeight: FontWeight.w800),
                      ),
                    ]),
                    const SizedBox(height: 20),
                    //
                    Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                (_isNeedRegistration == true) ? 35 : 25.0),
                        child: Text(
                            (_isNeedRegistration == false)
                                ? "Підтвердіть, що бажаєте увійти з цими даними"
                                : "Введіть, будь-ласка, необхідні дані та очікуйте код підтвердження",
                            style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center)),
                    const SizedBox(height: 75),
                    //
                    (_isNeedRegistration == true)
                        ? CustomTextField(
                            controller: _nameController,
                            // labelText: "Назва аккаунту:",
                            hintText: "Введіть імʼя аккаунту",
                            // typeOfField: "String",
                            // heightOfField: 45,
                            // isNeedSuffixIcon: true,
                            // suffixLength: 1,
                            // textPadding: const EdgeInsets.only(left: 25),
                            // textFontSize: 20,
                            // textAlign: TextAlign.start,
                            // borderWidth: 2,
                            // textStyle: textStyle,
                            // needValidation: true,
                            keyboardType: TextInputType.name,
                            maxLength: 15,
                            validatorType: ValidatorType.string,
                          )
                        : const SizedBox(height: 30),

                    const SizedBox(height: 25),
                    CustomTextField(
                      controller: _phoneController,
                      maxLength: 15,
                      validatorType: ValidatorType.phoneNumber,
                      // labelText: "Номер телефону:",
                      hintText: "Введіть номер телефону",
                      // maxSymbols: 10,
                      // typeOfField: "int",
                      // heightOfField: 45,
                      // isNeedSuffixIcon: true,
                      // suffixLength: 9,
                      // textFontSize: 20,
                      // textAlign: TextAlign.start,
                      // borderWidth: 2,
                      // isNeedPrefixIcon: true,
                      // textStyle: textStyle,
                      // needValidation: true,
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 130),

                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: CustomButton(
                          text: (_isNeedRegistration == true)
                              ? "Зареєструватись"
                              : "Увійти в застосунок",
                          action: () {
                            BuildContext ctx = context;
                            sendPhoneNumberAndSaveName(ctx);
                          }),
                    ),
                    const SizedBox(height: 20),

                    TextButton(
                        onPressed: () {
                          setState(() {
                            _isNeedRegistration = !_isNeedRegistration;
                            _isNeedRegistration
                                ? null
                                : _fetchUserDataFromSharedPreferences();
                          });
                        },
                        child: Center(
                          child: Text(
                              (_isNeedRegistration == true)
                                  ? "увійти зі свого аккаунту"
                                  : "зареєструвати новий номер телефону",
                              style: const TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.white)),
                        )),
                  ]),
            ),
          )),
        ),
      ]),
    );
  }

  void sendPhoneNumberAndSaveName(BuildContext ctx) async {
    if (formKey1.currentState!.validate()) {
      String phoneNumber = _phoneController.text.trim();
      final ap = Provider.of<AuthProvider>(context, listen: false);
      bool isNumberIsRegisteredAlready =
          await DMMethodsOnDB().isPhoneNumberExistsOnDB("+38$phoneNumber");

      //
      if (isNumberIsRegisteredAlready == true && _isNeedRegistration == true) {
        Helpers.showSnackBar(
            ctx, "Такий номер вже зареєстровано, увійдіть в аккаунт");
      } else {
        if (isNumberIsRegisteredAlready == false &&
            _isNeedRegistration == false) {
          Helpers.showSnackBar(
              ctx, "Такий номер не знайдено в базі, зареєструйтесь");
        } else {
          ap.signInWithPhone(ctx, "+38$phoneNumber", _nameController.text);
        }
      }
    } else {
      Helpers.showSnackBar(ctx, "Заповніть всі поля");
    }
    //
    //
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _phoneController.dispose();
  }
  //
}
