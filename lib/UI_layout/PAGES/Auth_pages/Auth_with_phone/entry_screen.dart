import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:country_picker/country_picker.dart';
import '../../../../State_management/Providers/Providers_for_store/auth_profile_provider.dart';
import '../../../../State_management/Helpers/For_auth/dm_methods.dart';
import '../../../../State_management/Theme_configuration/this_app_colors.dart';
import '../../../Components/Buttons/_1_custom_button.dart';
import '../../../Components/Text_fields/_my_first_tf.dart';

// ignore_for_file: use_build_context_synchronously
class EntryScreen extends StatefulWidget {
  final bool isNewUser;
  const EntryScreen({super.key, required this.isNewUser});

  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  // vars
  final formKey1 = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  String _account = '';
  String _phoneNumber = '';
  Country selectedCountry = Country(
      phoneCode: "38",
      countryCode: "UA",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "Ukraine",
      example: "Ukraine",
      displayName: "Ukraine",
      displayNameNoCountryCode: "UA",
      e164Key: "");
  final textStyle = const TextStyle(
      fontSize: 18,
      color: Colors.white,
      fontWeight: FontWeight.w800,
      letterSpacing: 1);

// methods
  @override
  void initState() {
    // Перевірка чи isNewUser == false
    if (!widget.isNewUser) {
      _fetchUserDataFromSharedPreferences();
      super.initState();
    }
  }

// getting data for auto completing of data
  Future<void> _fetchUserDataFromSharedPreferences() async {
    // AuthProvider authProvider =
    //     Provider.of<AuthProvider>(context, listen: false);
    // authProvider.getDataFromSP();
    // final account =
    //     authProvider.userProfileData.personalNickName ?? 'немає даних';
    // final phoneNumber =
    //     authProvider.userProfileData.phoneNumber ?? '*** відсутні дані';

    // setState(() {
    //   _nameController.text = account;
    //   _phoneController.text = phoneNumber;
    // });
    final sP = await SharedPreferences.getInstance();
    final account = sP.getString('account') ?? 'немає даних';
    final phoneNumber = sP.getString('phoneNumber') ?? '*** відсутні дані';

    setState(() {
      _account = account;
      _phoneNumber = phoneNumber.substring(3);
      _nameController.text = _account;
      _phoneController.text = _phoneNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    //vars
    final mQ = MediaQuery.of(context).size;
    _phoneController.selection = TextSelection.fromPosition(
      TextPosition(offset: _phoneController.text.length),
    );

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(children: [
        Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/start screen.png'),
                    fit: BoxFit.fitHeight))),
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
                          height: 50,
                          width: 80,
                          child:
                              Image.asset("assets/logo.png", fit: BoxFit.fill)),
                      Text(
                        (widget.isNewUser == true)
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
                            horizontal: (widget.isNewUser == true) ? 35 : 25.0),
                        child: Text(
                            (widget.isNewUser == false)
                                ? "Підтвердіть, що бажаєте увійти з цими даними"
                                : "Введіть, будь-ласка, необхідні дані та очікуйте код підтвердження",
                            style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).focusColor,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center)),
                    const SizedBox(height: 65),
                    // next is if new user
                    (widget.isNewUser == true)
                        ? StyledTextFormField(
                            controller: _nameController,
                            labelText: "Аккаунт",
                            hintText: "Введіть імʼя аккаунту",
                            typeOfField: "String",
                            heightOfField: 45,
                            isNeedSuffixIcon: true,
                            suffixLength: 1,
                            textPadding: const EdgeInsets.only(left: 25),
                            textFontSize: 20,
                            textAlign: TextAlign.start,
                            borderWidth: 2,
                            textStyle: textStyle,
                            needValidation: true,
                            keyboardType: TextInputType.name,
                          )
                        : Container(),

                    const SizedBox(height: 25),
                    StyledTextFormField(
                      controller: _phoneController,
                      labelText: "номер телефону",
                      hintText: "Введіть номер телефону",
                      maxSymbols: 10,
                      typeOfField: "int",
                      heightOfField: 45,
                      isNeedSuffixIcon: true,
                      suffixLength: 9,
                      textFontSize: 20,
                      textAlign: TextAlign.start,
                      borderWidth: 2,
                      isNeedPrefixIcon: true,
                      textStyle: textStyle,
                      needValidation: true,
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 130),

                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: CustomButton(
                          width: mQ.width * 0.97,
                          text: (widget.isNewUser == true)
                              ? "Зареєструватись"
                              : "Увійти в застосунок",
                          onPressed: () => sendPhoneNumberAndSaveName()),
                    ),
                    const SizedBox(height: 20),

                    TextButton(
                        onPressed: () {
                          // nextScreen(
                          //     context,
                          //     EntryScreen(
                          //         isNewUser: (widget.isNewUser == true)
                          //             ? false
                          //             : true));
                        },
                        child: Center(
                          child: Text(
                              (widget.isNewUser == true)
                                  ? "увійти зі свого аккаунту"
                                  : "зареєструвати новий номер телефону",
                              style: const TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: ThisAppColors.white)),
                        )),
                  ]),
            ),
          )),
        ),
      ]),
    );
  }

  void sendPhoneNumberAndSaveName() async {
    if (formKey1.currentState!.validate()) {
      String phoneNumber = _phoneController.text.trim();
      final ap = Provider.of<AuthProvider>(context, listen: false);
      bool isNumberIsRegisteredAlready =
          await DMMethodsOnDB().isPhoneNumberExistsOnDB("+38$phoneNumber");
      //
      if (isNumberIsRegisteredAlready == true && widget.isNewUser == true) {
        // showSnackbar(context,
        //     color: ThisAppColors.darkAmber2,
        //     content: "Такий номер вже зареєстровано, увійдіть в аккаунт");
      } else {
        if (isNumberIsRegisteredAlready == false && widget.isNewUser == false) {
          // showSnackbar(context,
          //     color: ThisAppColors.darkAmber2,
          //     content: "Такий номер не знайдено в базі, зареєструйтесь");
        } else {
          ap.signInWithPhone(
              context,
              "+${selectedCountry.phoneCode}$phoneNumber",
              _nameController.text);
        }
      }
    } else {
      // showSnackbar(context,
      //     color: ThisAppColors.darkAmber2, content: "Заповніть всі поля");
    }
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _phoneController.dispose();
  }
  //
}
