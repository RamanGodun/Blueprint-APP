import 'package:flutter/material.dart';
import '../../../State_management/Models/models_for_store/admin_data_model.dart';
import '../../../State_management/Src/Helpers/dm_methods.dart';
import '../../../State_management/Theme_configuration/App_colors_palette/this_app_colors.dart';
import '../../../UI_Components/Buttons/_1_custom_button.dart';

class NoOtpScreen extends StatefulWidget {
  const NoOtpScreen({super.key});

  @override
  State<NoOtpScreen> createState() => _NoOtpScreenState();
}

class _NoOtpScreenState extends State<NoOtpScreen> {
  // vars
  late AdminDataModel? fetchedData;
  late String adminsEmail;

  final textStyle1 = const TextStyle(
    color: ThisAppColors.kAppPrimaryColor,
    fontSize: 25,
    fontWeight: FontWeight.w800,
  );
  final textStyle2 = const TextStyle(
    color: ThisAppColors.white,
    fontSize: 14,
  );

  @override
  void initState() {
    _fetchGeneralData();
    super.initState();
  }

  Future<void> _fetchGeneralData() async {
    fetchedData = await DMMethodsOnDB().fetchGeneralDataFromFirestore();
    adminsEmail = fetchedData?.adminEmail ?? "MyMail@gmail.com";
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/start screen.png'),
                    fit: BoxFit.fitHeight)),
          ),
          SafeArea(
            child: Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                child: Column(children: [
                  SizedBox(
                    height: 50,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child:
                              Image.asset("assets/logo.png", fit: BoxFit.cover),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text("Не прийшов код?", style: textStyle1),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35.0),
                    child: Text(
                      "Зачекайте, процедура може зайняти декілька хвилин",
                      textAlign: TextAlign.center,
                      style: textStyle2,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Text(
                      "Якщо все рівно немає коду, то напишіть нам на е-пошту:",
                      textAlign: TextAlign.center,
                      style: textStyle2,
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    child: Image.asset(
                      "assets/mail1.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  // var email
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35.0),
                    child: Text(
                      adminsEmail,
                      style: textStyle1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 115),
                  // button
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: CustomButton(
                      text: "Повернутися до реєстрації",
                      onPressed: () {
                        // popScreen(context);
                      },
                    ),
                  ),
                  const SizedBox(height: 40),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
