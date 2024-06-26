import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../State_management/Providers/Providers_for_store/auth_profile_provider.dart';
import '../../../../State_management/Providers/Providers_for_store/cart_provider.dart';
import '../../../../State_management/Theme_configuration/app_colors.dart';
import '../../../Components/Buttons/for_shop/custom_button.dart';
import '../../../Components/Cards_and_tiles/for_shop/card_for_list_view.dart';
import '../../../Components/Mini_widgets/for_shop/check_box.dart';
import '../../../Components/Mini_widgets/dash_divider.dart';
import '../../../Components/Pickers/for_shop/quantity_changer.dart';

class CustomerCartScreen extends StatefulWidget {
  const CustomerCartScreen({
    super.key,
  });

  //
  @override
  State<CustomerCartScreen> createState() => _CustomerCartScreenState();
}

class _CustomerCartScreenState extends State<CustomerCartScreen> {
  @override
  Widget build(BuildContext context) {
    CartsProvider cartProvider =
        Provider.of<CartsProvider>(context, listen: true);
    AuthProvider profileInfo =
        Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: AppColors.black1,
      appBar: AppBar(
        leading: Align(
          alignment: Alignment.centerRight,
          child: IconButton(
              icon: const Icon(Icons.arrow_back_ios,
                  size: 20, color: AppColors.white),
              onPressed: () {
                // nextScreenReplace(
                //     context, const AppTabs(bottomTab: 1, appBarIndex: 0));
              }),
        ),
        backgroundColor: AppColors.black1.withOpacity(0.3),
      ),

      //
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(height: 20, child: Image.asset("assets/3sot up.png")),
              const SizedBox(width: 15),
              const Text("Кошик покупок",
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700)),
              const SizedBox(width: 15),
              SizedBox(height: 20, child: Image.asset("assets/3sot up.png")),
            ]),
            const SizedBox(height: 15),
            DashedLineDivider(color: AppColors.silver.withOpacity(0.7)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              child:
                  // empty cart option
                  (cartProvider.localCart.itemsId.isEmpty)
                      ? const Padding(
                          padding: EdgeInsets.only(bottom: 38.0),
                          child: Center(
                              child: Text(
                            "Поки що немає обраних товарів",
                            style: TextStyle(
                                color: AppColors.kAppPrimaryColor,
                                fontSize: 15),
                          )),
                        )
                      // List of items in cart next
                      : ListView.builder(
                          itemCount: cartProvider.localCart.itemsId.length,
                          itemBuilder: (context, index) {
                            return Stack(children: [
                              ProductsListViewItem(
                                  productsId:
                                      cartProvider.localCart.itemsId[index],
                                  titleOfProduct:
                                      cartProvider.localCart.itemsList[index],
                                  priceOfProduct:
                                      cartProvider.localCart.itemsPrice[index],
                                  amountLeft: cartProvider
                                      .localCart.itemQuantity[index],
                                  quantityOfProduct: cartProvider
                                      .localCart.itemQuantity[index],
                                  isEditingIconNeed: false,
                                  isProductsQuantityChangerNeeded: true,
                                  needAmountLeft: true),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        right: 10, top: 45),
                                    height: 30,
                                    width: 135,
                                    // custom quantity changer next
                                    child: QuantityChanger(
                                        iconSize: 10,
                                        totalHeight: 35,
                                        totalWidth: 130,
                                        productId: cartProvider
                                            .localCart.itemsId[index],
                                        quantityOfProduct: cartProvider
                                            .localCart.itemQuantity[index],
                                        calledNotFromCart: false),
                                  )),
                            ]);
                          },
                        ),
            ),
            const DashedLineDivider(color: AppColors.silver),
            const SizedBox(height: 17),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              // total sum of order next
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Загальна сума замовлення",
                      style: TextStyle(
                        color: AppColors.kAppPrimaryColor,
                        fontSize: 15,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 35,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: AppColors.grey1,
                      ),
                      child: Text(cartProvider.localCart.totalSum.toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: AppColors.white,
                          )),
                    ),
                  ]),
            ),
            const SizedBox(height: 20),
            // option for using of bonuses next:
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Використати доступні бонуси",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 14,
                      ),
                    ),
                    //
                    Text(
                      "(${profileInfo.userProfileData.userBonuses.toString()})",
                      style: const TextStyle(
                        color: AppColors.kAppPrimaryColor,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 50),
                    CheckboxWidget(
                      availableBonuses:
                          profileInfo.userProfileData.userBonuses!,
                      totalSumOfOrder: cartProvider.localCart.totalSum,
                    ),
                  ]),
            ),
            const SizedBox(height: 20),
            const DashedLineDivider(color: AppColors.silver),
            const SizedBox(height: 50),
            // button next
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: CustomButton(
                width: 355,
                text: "Оформити замовлення",
                onPressed: () {
                  cartProvider
                      .fetchUserOrders(profileInfo.userProfileData.userId);
                  // nextScreen(
                  //     context,
                  //     CustomerInfo(
                  //         isFromOrderScreen: true,
                  //         totalSum: cartProvider.localCart.totalSum));
                },
              ),
            ),
            const SizedBox(height: 15),
          ]),
    );
  }
}
