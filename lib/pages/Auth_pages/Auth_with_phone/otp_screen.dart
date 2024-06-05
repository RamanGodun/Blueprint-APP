// ignore_for_file: use_build_context_synchronously, unused_catch_clause
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../../../State_management/Providers/Providers_for_store/auth_profile_provider.dart';
import '../../../State_management/Providers/Providers_for_store/cart_provider.dart';
import '../../../State_management/Providers/Providers_for_store/common_data_provider.dart';
import '../../../State_management/Theme_configuration/App_colors_palette/this_app_colors.dart';
import '../../../UI_Components/Buttons/_1_custom_button.dart';

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
                    // button
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: CustomButton(
                        text: "Підтвердити",
                        onPressed: () {
                          if (otpCode != null) {
                            verifyOtp(context, otpCode!);
                          } else {
                            // showSnackbar(context,
                            //     content: "Введіть 6-значний код");
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    // text button
                    TextButton(
                      onPressed: () {
                        // nextScreen(context, const NoOtpScreen());
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
          // Перевіряємо, чи користувач існує в базі даних
          bool userExists = await authProvider.checkIsUserExistingOnDB();
          if (userExists) {
            await handleUserData(context, authProvider);
          } else {
            // Користувач не існує, зберігаємо дані користувача в Firebase
            await authProvider.saveUserDataToFirebase(true);
            await handleUserData(context, authProvider);
          }
        });
  }

  Future<void> handleUserData(
      BuildContext context, AuthProvider authProvider) async {
    CommonDataProvider productProvider =
        Provider.of<CommonDataProvider>(context, listen: false);
    final cartProvider = Provider.of<CartsProvider>(context, listen: false);
    authProvider.setSignIn();
    await productProvider.fetchProductsFromFirestore();
    await productProvider.fetchSellerPointsInfoFromFirestore();
    await productProvider.fetchBonusSystemFromFirestore();
    await productProvider.fetchGeneralDataFromFirestore();
    await cartProvider.fetchUserOrders(authProvider.userProfileData.userId);
    await cartProvider.fetchAdminOrders();
    try {
      // Отримуємо дані користувача з Firestore
      await authProvider.getUserDataFromFirestore();
      // await authProvider.saveUserDataToSP();
    } on FirebaseException catch (e) {
      // showSnackbar(context, content: e.message!);
      return;
    } catch (error) {
      // if no connection get all data (user profile info, products info etc) from SP
      // for example
      //await authProvider.getDataFromSP();
      // showSnackbar(context, content: error.toString());
      return;
    }

    // nextScreen(context, const AppTabs(bottomTab: 1, appBarIndex: 0));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
