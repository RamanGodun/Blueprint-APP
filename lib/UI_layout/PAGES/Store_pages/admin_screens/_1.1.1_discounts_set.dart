import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../State_management/Models/models_for_store/product_model.dart';
import '../../../../State_management/Providers/Providers_for_store/common_data_provider.dart';
import '../../../../State_management/Theme_configuration/this_app_colors.dart';
import '../../../Components/Buttons/for_shop/custom_button.dart';
import '../../../Components/Cards_and_tiles/_2_card_for_list_view.dart';
import '../../../Components/Others/dashed_border_container.dart';
// state management

class DiscountsSetScreen extends StatefulWidget {
  final String productsId;
  //
  const DiscountsSetScreen({
    super.key,
    required this.productsId,
  });
//
  @override
  State<DiscountsSetScreen> createState() => _DiscountsSetScreenState();
}

class _DiscountsSetScreenState extends State<DiscountsSetScreen> {
  //
  // List<TextEditingController> textEditingControllers =
  //     List.generate(4, (_) => TextEditingController());

  List<int> discountsValues = [5, 10, 15, 20, 25];
  //
  @override
  void initState() {
    super.initState();
    final ProductModel editingProductItem =
        Provider.of<CommonDataProvider>(context, listen: false)
            .getProductItemById(widget.productsId)!;
    final int discountAmount = editingProductItem.discountAmount!;
    if (discountAmount != 0) {
      final int index = discountsValues.indexOf(discountAmount);
      if (index != -1) {
        editingProductItem.discountsLevel![index] = true;
      }
    }
  }

//
  @override
  Widget build(BuildContext context) {
    //
    final CommonDataProvider productsIfo4Discounts =
        Provider.of<CommonDataProvider>(context, listen: false);

    final ProductModel editingProductItem =
        productsIfo4Discounts.getProductItemById(widget.productsId)!;

    final mediaQuery = MediaQuery.of(context);
    //
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        if (editingProductItem.discountAmount != 0) {
          productsIfo4Discounts.resetDiscounts4Item(widget.productsId);
          editingProductItem.isDiscount = false;
          return true;
        } else {
          editingProductItem.isDiscount = false;
          return true;
        }
      },
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          leading: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
              child: Image.asset("assets/logo.png", fit: BoxFit.fill),
            ),
          ),
          title: const Text(
            "Застосування акцій",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
          ),
          actions: [
            // delete button
            IconButton(
              onPressed: () {
                setState(() {
                  productsIfo4Discounts.resetDiscounts4Item(widget.productsId);
                });
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.delete,
                color: AppColors.kAppPrimaryColor,
              ),
            )
          ],
        ),
        //
        // body next
        body: Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: mediaQuery.size.height * 0.97,
              width: mediaQuery.size.width * 0.95,
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(height: 30),
                    ProductsListViewItem(
                      productsId: widget.productsId,
                      titleOfProduct: editingProductItem.nameOfProduct,
                      priceOfProduct: editingProductItem.calculatedNewPrice,
                      amountLeft: editingProductItem.quantityLeft,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                        height: mediaQuery.size.height * 0.4,
                        width: mediaQuery.size.width * 0.99,
                        child: DashedBorderContainer(
                          dashWidth: 0.01,
                          // ListView.builder
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount:
                                editingProductItem.discountsLevel!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      productsIfo4Discounts.resetDiscounts4Item(
                                          widget.productsId);
                                      editingProductItem
                                              .discountsLevel![index] =
                                          !editingProductItem
                                              .discountsLevel![index];
                                      productsIfo4Discounts
                                              .getProductItemById(
                                                  widget.productsId)!
                                              .discountAmount =
                                          (index == 0) ? 5 : (index * 5 + 5);
                                      editingProductItem.isDiscount = true;
                                    });
                                  },
                                  // containers with text
                                  child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 225,
                                          decoration: BoxDecoration(
                                            color: editingProductItem
                                                    .discountsLevel![index]
                                                ? AppColors.kAppPrimaryColor
                                                : AppColors.grey2,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: Colors.black, width: 1),
                                          ),
                                        ),
                                        Text("${discountsValues[index]}%",
                                            style: const TextStyle(
                                                color: AppColors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                                letterSpacing: 3)),
                                      ]),
                                ),
                              );
                            },
                          ),
                        )),
                    SizedBox(height: mediaQuery.size.height * 0.01),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1.0),
                      // price on discount
                      child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const SizedBox(width: 100),
                            const Text(
                              "Ціна по акції",
                              style: TextStyle(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Stack(alignment: Alignment.center, children: [
                              Container(
                                height: 30,
                                width: 95,
                                decoration: BoxDecoration(
                                  color: AppColors.grey2,
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: Colors.black, width: 1),
                                ),
                              ),
                              Text(
                                  "${productsIfo4Discounts.getProductItemById(widget.productsId)!.priceOfProduct * (100 - productsIfo4Discounts.getProductItemById(widget.productsId)!.discountAmount!) ~/ 100} \u20B4",
                                  style: const TextStyle(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1)),
                            ]),
                          ]),
                    ),
                    SizedBox(height: mediaQuery.size.height * 0.01),
                    // button next
                    CustomButton(
                      width: mediaQuery.size.width * 0.96,
                      height: 45,
                      text: "Застосувати",
                      onPressed: () {
                        editingProductItem.isDiscount = true;
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(height: mediaQuery.size.height * 0.1),
                  ]),
            )),
      ),
    );
  }
}
