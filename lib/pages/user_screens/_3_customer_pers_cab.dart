// general
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../State_management/Models/_0_models.dart';
import '../../State_management/Providers/Providers_for_store/_1_auth_profile_provider.dart';
import '../../State_management/Providers/Providers_for_store/_2_cart_provider.dart';
import '../../State_management/Theme_configuration/App_colors_palette/my_first_top_design.dart';
import '../../UI_Components/Cards_and_tiles/_2_card_for_list_view.dart';
import '../../UI_Components/Cards_and_tiles/_4_customers_order_card.dart';
import '../../UI_Components/Cards_and_tiles/_5_users_info_card.dart';
import '../../UI_Components/Others/dash_divider.dart';
// state management

class PersonalCabinet4Customer extends StatefulWidget {
  const PersonalCabinet4Customer({super.key});

  @override
  State<PersonalCabinet4Customer> createState() =>
      _PersonalCabinet4CustomerState();
}

class _PersonalCabinet4CustomerState extends State<PersonalCabinet4Customer> {
  @override
  Widget build(BuildContext context) {
    //vars
    final AuthProvider proFile =
        Provider.of<AuthProvider>(context, listen: true);
    final ProfileInfoModel proFileInfo = proFile.userProfileData;
    final CartsProvider cartProvider =
        Provider.of<CartsProvider>(context, listen: true);

    List<String> customerData2 = [
      (proFileInfo.personalId!.isNotEmpty)
          ? proFileInfo.personalId!
          : "Дані ще не введено",
      (proFileInfo.phone4Delivery!.isNotEmpty)
          ? proFileInfo.phone4Delivery!
          : "Телефон не вказаний",
      (proFileInfo.town!.isNotEmpty) ? proFileInfo.town! : "Адреса не вказана",
      (proFileInfo.wayOfDelivery!.isNotEmpty)
          ? proFileInfo.wayOfDelivery!
          : "Спосіб доставки не обрано",
    ];

    CartItem? expandedOrder;
    int expandedOrderIndex =
        _getExpandedOrderIndex(cartProvider.userOrdersCartList);
    if (expandedOrderIndex != -1) {
      expandedOrder =
          cartProvider.userOrdersCartList.elementAt(expandedOrderIndex);
    }

    return Stack(children: [
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //
            const UsersInfoCard(isSellersInfo: false, isAdmin: false),
            const SizedBox(height: 5),
            const DashedLineDivider(color: IOSDarkThemeColors.hover),

            //
            // Delivery info next
            const Padding(
              padding:
                  EdgeInsets.only(top: 3.0, bottom: 3.0, left: 70, right: 10),
              child: Row(children: [
                Icon(
                  Icons.local_shipping,
                  color: IOSDarkThemeColors.yellow1,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text("Інформація з доставки",
                      style: TextStyle(
                          color: IOSDarkThemeColors.yellow1, fontSize: 14)),
                ),
              ]),
            ),
            //
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: customerData2.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35.0, vertical: 3),
                    child: Row(
                      children: [
                        Icon(
                          _getIconForIndex2(index),
                          color: IOSDarkThemeColors.white,
                          size: 20,
                        ),
                        const SizedBox(width: 10),
                        Text(customerData2[index],
                            style: const TextStyle(
                                color: IOSDarkThemeColors.white,
                                fontSize: 13,
                                fontStyle: FontStyle.normal)),
                      ],
                    ),
                  );
                }),
            const SizedBox(height: 15),

            //
            // Orders  next
            const DashedLineDivider(color: IOSDarkThemeColors.hover),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.only(left: 70.0),
              child: Row(
                children: [
                  Icon(
                    Icons.local_shipping,
                    color: IOSDarkThemeColors.yellow1,
                  ),
                  SizedBox(width: 10),
                  Text("Список моїх замовлень",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: IOSDarkThemeColors.yellow1,
                        fontSize: 15,
                        // fontWeight: FontWeight.w500
                      )),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // List of user orders
            Expanded(
              child: (cartProvider.userOrdersCartList.isNotEmpty)
                  ? ListView.builder(
                      itemCount: cartProvider.userOrdersCartList.length,
                      itemBuilder: (context, index) {
                        final currentCustomerCartItem =
                            cartProvider.userOrdersCartList[index];
                        return CustomersOrderItem(
                          createdAt: currentCustomerCartItem.createdAt,
                          totalAmount: currentCustomerCartItem.totalSum!,
                        );
                      },
                    )
                  : const Center(
                      child: Text("Замовлень поки що немає",
                          style: TextStyle(
                              color: IOSDarkThemeColors.white, fontSize: 15)),
                    ),
            ),
          ]),
      //
      // Expanding info of customer's orders next
      //
      if (expandedOrder != null) ...[
        GestureDetector(
            onTap: () => cartProvider.resetIsExpandedInUserCartList(),
            child: Container(
              color: Colors.black.withOpacity(0.1),
            )),
        BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width * 0.97,
                margin: const EdgeInsets.only(top: 50),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.85),
                    borderRadius: BorderRadius.circular(12.0)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 7.0, vertical: 1.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 22,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Spacer(),
                              IconButton(
                                  icon: const Icon(Icons.close, size: 20),
                                  color: IOSDarkThemeColors.white,
                                  onPressed: () => cartProvider
                                      .resetIsExpandedInUserCartList()),
                            ]),
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 5),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Замовлення за:',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w700,
                                          color: Theme.of(context).focusColor,
                                        )),
                                    Text(
                                        DateFormat('yyyy/MM/dd  HH:mm')
                                            .format(expandedOrder.createdAt),
                                        style: TextStyle(
                                          fontSize: 13.0,
                                          color: Theme.of(context).focusColor,
                                        )),
                                  ]),
                              Text(
                                  '${expandedOrder.totalSum!.toStringAsFixed(2)} \u20B4',
                                  style: const TextStyle(
                                      fontSize: 14.0,
                                      color: IOSDarkThemeColors.silver,
                                      fontWeight: FontWeight.w800)),
                            ]),
                      ),
                      const SizedBox(height: 15),
                      const DashedLineDivider(color: IOSDarkThemeColors.white),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.4,
                        // List of items in cart
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: expandedOrder.itemsList.length,
                            itemBuilder: (context, index) {
                              return ProductsListViewItem(
                                productsId: expandedOrder!.itemsId[index],
                                titleOfProduct: expandedOrder.itemsList[index],
                                priceOfProduct: expandedOrder.itemsPrice[index],
                                needLocalSumOfItems: true,
                                localItemsPrice:
                                    expandedOrder.itemsPrice[index] *
                                        expandedOrder.itemQuantity[index],
                                orderedQuantity:
                                    expandedOrder.itemQuantity[index],
                              );
                            }),
                      ),
                      const DashedLineDivider(color: IOSDarkThemeColors.silver),
                      const SizedBox(height: 10),
                      // text of status of order
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          (!expandedOrder.isVisible4Admin &&
                                  expandedOrder.isFinished == false)
                              ? "Замовлення відхилено продавцем"
                              : (expandedOrder.isFinished == false)
                                  ? "Замовлення в процесі обробки..."
                                  : "Завершено, бонуси зараховані",
                          style:
                              const TextStyle(color: IOSDarkThemeColors.amber1),
                        ),
                      )
                    ]),
              ),
            )),
      ],
    ]);
  }
}

IconData _getIconForIndex2(int index) {
  switch (index) {
    case 0:
      return Icons.person;
    case 1:
      return Icons.phone;
    case 2:
      return Icons.location_city;
    default:
      return Icons.delivery_dining;
  }
}

int _getExpandedOrderIndex(List<CartItem> ordersList) {
  for (int i = 0; i < ordersList.length; i++) {
    if (ordersList[i].isExpanded) {
      return i;
    }
  }
  return -1;
}
