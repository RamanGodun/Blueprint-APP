import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;
import '../../../State_management/Providers/Providers_for_store/_1_common_data_provider.dart';
import '../../../State_management/Src/Helpers/dm_methods.dart';
import '../../../State_management/Theme_configuration/App_colors_palette/this_app_colors.dart';
import '../../../UI_Components/Buttons/_1_custom_button.dart';
import '../../../UI_Components/Text_fields/_3_custom_text_field.dart';
import '_2.1_admin_orders_list.dart';

class DiscountSystem extends StatefulWidget {
  const DiscountSystem({super.key});

  @override
  State<DiscountSystem> createState() => _DiscountSystemState();
}

class _DiscountSystemState extends State<DiscountSystem> {
  final formKey = GlobalKey<FormState>();
  List<TextEditingController> discountValueControllers =
      List.generate(4, (_) => TextEditingController());
  List<TextEditingController> spentMoneyLevelControllers =
      List.generate(4, (_) => TextEditingController());

  @override
  void initState() {
    super.initState();
    final bonusSystem =
        Provider.of<CommonDataProvider>(context, listen: false).bonusSystem;

    for (int i = 0; i < 4; i++) {
      discountValueControllers[i].text =
          bonusSystem.discountAmount[i].toString();
      spentMoneyLevelControllers[i].text =
          bonusSystem.spentMoneyLevel[i].toString();
    }
  }

  @override
  void dispose() {
    super.dispose();
    for (final controller in [
      ...discountValueControllers,
      ...spentMoneyLevelControllers
    ]) {
      controller.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    final CommonDataProvider productsProvider =
        Provider.of<CommonDataProvider>(context, listen: false);

    List<TextEditingController> listOfControllers = [
      for (var i = 0; i < 4; i++) discountValueControllers[i],
      for (var i = 0; i < 4; i++) spentMoneyLevelControllers[i],
    ];

    return Scaffold(
      backgroundColor: ThisAppColors.black,
      body: Stack(
        children: [
          const AdminOrdersList(),
          Positioned.fill(
              child: BackdropFilter(
                  filter: ui.ImageFilter.blur(sigmaX: 5, sigmaY: 7),
                  child: Container(
                    color: ThisAppColors.hover.withOpacity(0.6),
                  ))),
          SafeArea(
              child: Container(
            margin: const EdgeInsets.only(top: 105),
            child: Align(
              alignment: Alignment.topCenter,
              child: FractionallySizedBox(
                  widthFactor: 0.85,
                  heightFactor: 0.65,
                  child: Container(
                    color: ThisAppColors.darkGrey4.withOpacity(0.6),
                    child: Form(
                      key: formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(children: [
                              const SizedBox(width: 280),
                              SizedBox(
                                height: 30,
                                // close button
                                child: IconButton(
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        DMMethodsOnDB()
                                            .updateBonusSystemOnFirebase(
                                                context,
                                                productsProvider.bonusSystem);
                                        Navigator.pop(context);
                                      } else {
                                        // showSnackbar(context,
                                        //     color: Colors.red,
                                        //     content:
                                        //         "Заповніть всі необхідні поля");
                                      }
                                    },
                                    icon: Icon(Icons.close,
                                        color: Theme.of(context).focusColor)),
                              ),
                            ]),
                            const SizedBox(height: 30),
                            Text("Система персональних скидок",
                                style: TextStyle(
                                    color: Theme.of(context).focusColor,
                                    fontSize: 17)),
                            const SizedBox(height: 25),
                            //
                            // list builder next
                            ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: productsProvider
                                    .bonusSystem.discountAmount.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      SizedBox(
                                        height: 55,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.75,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: StyledTextFormField(
                                                  labelText: "скидка, %",
                                                  index: index,
                                                  typeOfField: "double",
                                                  keyboardType:
                                                      TextInputType.number,
                                                  hintText:
                                                      listOfControllers[index]
                                                          .text,
                                                  widthOfField: 100.0,
                                                  textPadding:
                                                      const EdgeInsets.only(
                                                          left: 30),
                                                  textAlign: TextAlign.left,
                                                  controller:
                                                      listOfControllers[index],
                                                  textFontSize: 15),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: StyledTextFormField(
                                                  labelText:
                                                      "поріг витрат, грн",
                                                  index: index,
                                                  typeOfField: "int",
                                                  keyboardType:
                                                      TextInputType.number,
                                                  textPadding:
                                                      const EdgeInsets.only(
                                                          left: 40),
                                                  textAlign: TextAlign.left,
                                                  hintText: listOfControllers[
                                                          index + 4]
                                                      .text,
                                                  widthOfField: 135.0,
                                                  controller: listOfControllers[
                                                      index + 4],
                                                  textFontSize: 15),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                            const SizedBox(height: 30),
                            // button next
                            CustomButton(
                                width: 270,
                                text: "Прийняти зміни",
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    // nextScreenReplace(
                                    //     context, const AdminOrdersList());
                                    // DMMethodsOnDB().updateBonusSystemOnFirebase(
                                    //     context, productsProvider.bonusSystem);
                                    Navigator.pop(context);
                                  } else {
                                    //   showSnackbar(context,
                                    //       color: Colors.red,
                                    //       content:
                                    //           "Заповніть всі необхідні поля");
                                  }
                                }),
                          ],
                        ),
                      ),
                    ),
                  )),
            ),
          )),
        ],
      ),
    );
  }
}
