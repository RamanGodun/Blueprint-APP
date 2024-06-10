import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../State_management/Providers/Providers_for_store/cart_provider.dart';
import '../../../../State_management/Helpers/For_auth/dm_methods.dart';
import '../../../../State_management/Theme_configuration/app_colors.dart';

class MyCustomizedSwitcher extends StatefulWidget {
  final double height;
  final double width;
  final bool isThemeSwitcher;
  final bool mySwitcherValue;
  final DateTime? orderId4Switcher;
  final DateTime? createdAt;
  final String? userId;

  const MyCustomizedSwitcher({
    this.height = 35,
    this.width = 90,
    this.isThemeSwitcher = false,
    this.mySwitcherValue = false,
    this.orderId4Switcher,
    this.createdAt,
    this.userId,
    super.key,
  });

  @override
  State<MyCustomizedSwitcher> createState() => _MyCustomizedSwitcherState();
}

class _MyCustomizedSwitcherState extends State<MyCustomizedSwitcher> {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: widget.mySwitcherValue,
      inactiveThumbColor: Colors.amber.withOpacity(0.8),
      onChanged: (bool newValue) async {
        if (!widget.mySwitcherValue) {
          final cartProvider =
              Provider.of<CartsProvider>(context, listen: false);
          showIsOrderFinishedDialog(context, cartProvider);
        }
      },
    );
  }

//
  void showIsOrderFinishedDialog(
      BuildContext context, CartsProvider cartProvider) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Container(
            margin: const EdgeInsets.only(bottom: 150),
            child: AlertDialog(
                backgroundColor: AppColors.darkGrey3.withOpacity(0.97),
                elevation: 0,
                content: Column(mainAxisSize: MainAxisSize.min, children: [
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text("Ви підтверджуєте, що це замовлення завершене?",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppColors.white, fontSize: 18)),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          child: Text(
                            "Ні, дякую",
                            style: TextStyle(
                                fontSize: 16,
                                color: AppColors.kAppPrimaryColor
                                    .withOpacity(0.9)),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text(
                            "Так",
                            style: TextStyle(
                                fontSize: 16,
                                color: AppColors.kAppPrimaryColor
                                    .withOpacity(0.7)),
                          ),
                          onPressed: () async {
                            cartProvider.toggleAdminOrderIsFinished(
                                widget.orderId4Switcher!, true);
                            await DMMethodsOnDB().inAdminOrderSetIsFinished(
                                context, widget.createdAt!, widget.userId!);
                            await cartProvider.fetchAdminOrders();
                            // ignore: use_build_context_synchronously
                            Navigator.of(context).pop();
                          },
                        ),
                      ]),
                ]),
                contentPadding: const EdgeInsets.only(top: 10),
                actionsPadding: const EdgeInsets.only(bottom: 35)),
          );
        });
  }
}
