import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../State_management/Models/models_for_store/product_model.dart';
import '../../State_management/Providers/Providers_for_store/common_data_provider.dart';
import '../../State_management/Theme_configuration/App_colors_palette/this_app_colors.dart';
import '../Others/dashed_border_container.dart';

class ProductsListViewItem extends StatefulWidget {
  final String productsId;
  final String? titleOfProduct;
  final int? priceOfProduct;
  final double? amountLeft;
  final bool? isEditingIconNeed;
  final bool? isProductsQuantityChangerNeeded;
  final double? quantityOfProduct;
  final bool? needLocalSumOfItems;
  final bool? needAmountLeft;
  final double? localItemsPrice;
  final double? orderedQuantity;

  const ProductsListViewItem({
    required this.productsId,
    this.titleOfProduct = "Редактуємий товар",
    this.priceOfProduct = 0,
    this.amountLeft = 0.0,
    this.isEditingIconNeed = false,
    this.isProductsQuantityChangerNeeded = false,
    this.quantityOfProduct = 0.0,
    this.needLocalSumOfItems = false,
    this.needAmountLeft = false,
    this.localItemsPrice = 0.0,
    this.orderedQuantity = 0.0,
    super.key,
  });

  @override
  State<ProductsListViewItem> createState() => _ProductsListViewItemState();
}

class _ProductsListViewItemState extends State<ProductsListViewItem> {
  @override
  Widget build(BuildContext context) {
    CommonDataProvider productsInfo =
        Provider.of<CommonDataProvider>(context, listen: false);
    ProductModel editedProductsItem =
        productsInfo.getProductItemById(widget.productsId)!;
    final mQ = MediaQuery.of(context).size;

    // picture next
    var containerWithPicture = Container(
      height: 80,
      width: 100,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              bottomLeft: Radius.circular(10.0))),
      child: Stack(children: [
        ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10.0),
                bottomLeft: Radius.circular(7.0)),
            child: (editedProductsItem.pictureOfProduct.isNotEmpty)
                ? Image.network(editedProductsItem.pictureOfProduct,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity)
                : const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: CircularProgressIndicator(
                        color: Colors.amber, strokeWidth: 5))),
        editedProductsItem.isDiscount!
            ? Positioned(
                top: 0,
                right: 0,
                child: ClipRRect(
                    child: Container(
                        color: Colors.transparent,
                        child: Image.asset("assets/discount flag.png",
                            width: 25, height: 85, fit: BoxFit.fitHeight))))
            : Container(),
      ]),
    );

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 3),
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: ThisAppColors.hover.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Stack(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // picture here
                containerWithPicture,
                //
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(widget.titleOfProduct!,
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).focusColor)),
                        ),
                        Text("${widget.priceOfProduct} грн / 1 л",
                            style: TextStyle(
                                fontSize: 12.0,
                                color: Theme.of(context).focusColor)),
                        const SizedBox(height: 30),
                        Text(
                            (widget.needLocalSumOfItems == true)
                                ? "замовлено: ${widget.orderedQuantity} л"
                                : "залишилось: ${editedProductsItem.quantityLeft} л",
                            style: TextStyle(
                                fontSize: 10.0,
                                color: Theme.of(context).focusColor))
                      ]),
                ),
              ]),
          //
          // code for card discounts screen
          if (widget.isEditingIconNeed != true &&
              widget.isProductsQuantityChangerNeeded != true &&
              widget.needLocalSumOfItems != true)
            Row(children: [
              SizedBox(width: mQ.width * 0.6),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: MediaQuery.of(context).size.height * 0.08,
                  padding: const EdgeInsets.only(top: 10),
                  child: DashedBorderContainer(
                    borderWidth: 0.2,
                    dashWidth: 5,
                    dashSpace: 5,
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('скидка "+" ?',
                                style: TextStyle(
                                    color: ThisAppColors.white, fontSize: 13)),
                            SizedBox(
                              height: 30,
                              child: Switch(
                                inactiveThumbColor: ThisAppColors.hover,
                                activeColor: ThisAppColors.white,
                                value:
                                    (editedProductsItem.isDiscountPlus != null)
                                        ? editedProductsItem.isDiscountPlus!
                                        : false,
                                onChanged: (value) {
                                  setState(() {
                                    productsInfo.toggleIsDiscount4Product(
                                        widget.productsId, value);
                                  });
                                },
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
              ),
            ])
          //
          // code of card for admin products list
          else if (widget.needLocalSumOfItems != true &&
              widget.isProductsQuantityChangerNeeded == false)
            Row(
              children: [
                SizedBox(width: mQ.width * 0.85),
                SizedBox(
                  height: 35,
                  width: 20,
                  child: GestureDetector(
                    child: const Icon(Icons.edit,
                        size: 20, color: ThisAppColors.kAppPrimaryColor),
                    onTap: () {
                      // nextScreen(
                      //   context,
                      //   ProductsEditingScreen(
                      //     productId: widget.productsId,
                      //     isNewProductItem: false,
                      //   ),
                      // );
                    },
                  ),
                ),
              ],
            )
          else
            Container(),
        ],
      ),
    );
  }
}
