// general
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;

import '../../../State_management/Models/_0_models.dart';
import '../../../State_management/Providers/Providers_for_store/_2_cart_provider.dart';
import '../../../State_management/Theme_configuration/App_colors_palette/my_first_top_design.dart';
import '../../../UI_Components/Others/dash_divider.dart';
import '_2.1_admin_orders_list.dart';

class ExpandedOrderInfo extends StatelessWidget {
  final DateTime orderIdTaken;
  const ExpandedOrderInfo({
    super.key,
    required this.orderIdTaken,
  });

  @override
  Widget build(BuildContext context) {
    // vars
    final CartItem gotCartItemById = Provider.of<CartsProvider>(context)
        .getOrderItemById4Admin(orderIdTaken)!;
    final List<String> listOfOrderedItems = gotCartItemById.itemsList;
    final List<double> listOfItemsQuantity = gotCartItemById.itemQuantity;
    const textStyle1 = TextStyle(color: IOSDarkThemeColors.white, fontSize: 13);
    const textStyle2 =
        TextStyle(color: IOSDarkThemeColors.amber1, fontSize: 13);
    Widget localDivider = const SizedBox(
        height: 5, child: DashedLineDivider(color: IOSDarkThemeColors.silver));
    List<String?> customerData = [
      gotCartItemById.customerId,
      gotCartItemById.customerPhone,
      gotCartItemById.deliveryWay,
      gotCartItemById.location,
      (gotCartItemById.comments.isNotEmpty)
          ? gotCartItemById.comments
          : "немає коментарів",
      (gotCartItemById.amountOfBonusRequest != 0)
          ? "запит на використання ${gotCartItemById.amountOfBonusRequest.toString()} бонусів"
          : "запит на використання бонусів відсутній",
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).hoverColor.withOpacity(0.65),
      body: Stack(children: [
        // background 4 content next
        const AdminOrdersList(),
        BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 5, sigmaY: 7),
            child: Container(
                color: Theme.of(context).focusColor.withOpacity(0.2))),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: const EdgeInsets.only(top: 100),
            width: MediaQuery.of(context).size.width * 0.97,
            height: MediaQuery.of(context).size.height * 0.7,
            decoration: BoxDecoration(
                border:
                    Border.all(width: 0.1, color: IOSDarkThemeColors.silver),
                color: IOSDarkThemeColors.grey1.withOpacity(0.7)),
            // Order's content next
            child: Container(
              padding: const EdgeInsets.only(left: 30, right: 15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(width: 30),
                          SizedBox(
                            width: 25,
                            height: 35,
                            child: IconButton(
                                onPressed: () => Navigator.of(context).pop(),
                                icon: const Icon(Icons.close,
                                    color: Colors.amber)),
                          ),
                        ]),
                    const SizedBox(height: 20),
                    localDivider,
                    const Padding(
                        padding: EdgeInsets.only(left: 28.0),
                        child: Row(children: [
                          Icon(Icons.album_sharp, color: Colors.amber),
                          SizedBox(width: 10),
                          //
                          Text("Деталі замовлення",
                              textAlign: TextAlign.start,
                              style:
                                  TextStyle(color: Colors.amber, fontSize: 15)),
                        ])),
                    localDivider,
                    SingleChildScrollView(
                        child: SizedBox(
                      height: 115,
                      child: SingleChildScrollView(
                        child: Column(children: [
                          for (int index = 0;
                              index < listOfOrderedItems.length;
                              index++)
                            Padding(
                              padding: const EdgeInsets.only(top: 18.0),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(listOfOrderedItems[index],
                                        style: TextStyle(
                                            color: Theme.of(context).focusColor,
                                            fontSize: 14)),
                                    Text(
                                        "${listOfItemsQuantity[index].toString()} л",
                                        style: TextStyle(
                                            color: Theme.of(context).focusColor,
                                            fontSize: 14)),
                                  ]),
                            )
                        ]),
                      ),
                    )),
                    //
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(Icons.attach_money_rounded,
                              color: Colors.amber),
                          const SizedBox(width: 10),
                          const Text('Загальна сума',
                              style:
                                  TextStyle(color: Colors.amber, fontSize: 13)),
                          const SizedBox(width: 90),
                          Container(
                              alignment: Alignment.center,
                              height: 20,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: IOSDarkThemeColors.black,
                                  borderRadius: BorderRadius.circular(12.0)),
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                    "${gotCartItemById.totalSum.toString()} \u20B4",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: IOSDarkThemeColors.white,
                                        fontSize: 14)),
                              )),
                        ]),
                    //
                    const SizedBox(height: 30),
                    localDivider,
                    const Padding(
                      padding: EdgeInsets.only(left: 28.0),
                      child: Row(children: [
                        Icon(Icons.local_shipping, color: Colors.amber),
                        SizedBox(width: 10),
                        Text("Дані замовника",
                            style:
                                TextStyle(color: Colors.amber, fontSize: 15)),
                      ]),
                    ),
                    localDivider,
                    //
                    SizedBox(
                      height: 250,
                      child: Column(
                        children: [
                          for (int index = 0;
                              index < customerData.length;
                              index++)
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: Row(
                                children: [
                                  Icon(
                                    _getIconForIndex1(
                                      index,
                                      gotCartItemById.amountOfBonusRequest
                                          .toString(),
                                    ),
                                    color: IOSDarkThemeColors.white,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      customerData[index] ?? "",
                                      style: (index == 5 &&
                                              customerData[5] != null &&
                                              customerData[5] != "0")
                                          ? textStyle2
                                          : textStyle1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ]),
    );
  }
}

IconData _getIconForIndex1(int index, String? bonuses) {
  switch (index) {
    case 0:
      return Icons.person;
    case 1:
      return Icons.phone;
    case 2:
      return Icons.delivery_dining_outlined;
    case 3:
      return Icons.location_city;
    // case 4:
    //   return Icons.location_city;
    case 4:
      return Icons.comment;
    case 5:
      return (bonuses != null && bonuses != "0")
          ? Icons.add_task_rounded
          : Icons.add_task_rounded;
    default:
      return Icons.add_task_rounded;
  }
}
