// general
// ignore_for_file: avoid_print

import 'package:blueprint_4app/state_management/Theme_configuration/App_colors_palette/this_app_colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import '../../../State_management/Src/Helpers/helpers.dart';
import '../../../UI_Components/Buttons/custom_button_from_first.dart';
import '../../tabs/app_tabs.dart';
import 'no_otp_screen.dart';
import 'providers/auth_profile_provider.dart';

// ignore_for_file: use_build_context_synchronously
class OtpScreen extends StatefulWidget {
  final String verificationId;
  const OtpScreen({super.key, required this.verificationId});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String? otpCode;

  @override
  Widget build(BuildContext context) {
    AuthProvider aP = Provider.of<AuthProvider>(context, listen: false);
    final isLoading = aP.isLoading;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: isLoading == true
            ? const Center(
                child: CircularProgressIndicator(color: Colors.amber))
            : Stack(children: [
                Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                  image: AssetImage('assets/start screen.png'),
                  fit: BoxFit.fitHeight,
                ))),
                Center(
                    child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                  child: Column(children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Icon(Icons.arrow_back, color: Colors.amber[500]),
                      ),
                    ),
                    const SizedBox(height: 80),
                    const Text("Перевірка",
                        style: TextStyle(
                          color: ThisAppColors.kAppPrimaryColor,
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                        )),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35.0),
                      child: Text(
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).focusColor,
                              fontWeight: FontWeight.w800),
                          "Введіть 6-значний код ОТП, що був відправлений Вам на телефон"),
                    ),
                    const SizedBox(height: 85),
                    // pinput
                    Pinput(
                      length: 6,
                      showCursor: true,
                      defaultPinTheme: PinTheme(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Theme.of(context).indicatorColor)),
                        textStyle: TextStyle(
                            color: Theme.of(context).focusColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      onCompleted: (value) {
                        setState(() {
                          otpCode = value;
                        });
                      },
                    ),
                    const SizedBox(height: 120),
//
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: CustomButton(
                        text: "Підтвердити",
                        action: () {
                          if (otpCode != null) {
                            verifyOtp(context, otpCode!);
                          } else {
                            Helpers.showSnackBar(
                                context, "Введіть 6-значний код");
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    //
                    TextButton(
                      onPressed: () {
                        Helpers.push(context, const NoOtpScreen());
                      },
                      child: const Text("не прийшов код",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: ThisAppColors.kAppPrimaryColor,
                          )),
                    ),
                    const SizedBox(height: 15),
                  ]),
                )),
              ]),
      ),
    );
  }

  Future<void> verifyOtp(BuildContext context, String userOtp) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    await authProvider.verifyOtp(
        context: context,
        verificationId: widget.verificationId,
        userOtp: userOtp,
        onSuccess: () async {
          bool userExists = await authProvider.checkIsUserExistingOnDB();
          print("$userExists userExists");

          if (userExists) {
            await handleUserData(context, authProvider);
            print("user exist onDB");
          } else {
            print("user doesn't exist onDB");
            await authProvider.saveUserDataToFirebase(true);
            await handleUserData(context, authProvider);
          }
        });
  }

  Future<void> handleUserData(
      BuildContext cxt, AuthProvider authProvider) async {
    authProvider.setSignIn();
    //
    // next we fetch all data, for example:
    // await productProvider.fetchProductsFromFirestore();

    try {
      await authProvider.getUserDataFromFirestore();
    } on FirebaseException catch (e) {
      Helpers.showSnackBar(cxt, e.message!);
      return;
    } catch (error) {
      Helpers.showSnackBar(cxt, error.toString());
      return;
    }

    Helpers.push(context, const AppTabs(bottomTab: 1, appBarIndex: 0));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
