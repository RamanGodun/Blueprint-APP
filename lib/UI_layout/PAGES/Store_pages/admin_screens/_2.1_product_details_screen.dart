import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../State_management/Models/models_for_store/product_model.dart';
import '../../../../State_management/Providers/Providers_for_store/cart_provider.dart';
import '../../../../State_management/Providers/Providers_for_store/common_data_provider.dart';
import '../../../../State_management/Theme_configuration/this_app_colors.dart';
import '../../../Components/Buttons/_1_custom_button.dart';
import '../../../Components/Others/dash_divider.dart';
import '../../../Components/Pickers/_2_quantity_changer.dart';

class ProductDetailPage extends StatefulWidget {
  final String productId;

  const ProductDetailPage({
    super.key,
    required this.productId,
  });

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  bool isDetailsVisible = false;

  //methods next
  void toggleDetails() {
    setState(() {
      isDetailsVisible = !isDetailsVisible;
    });
  }

  double getLocalSum(CartsProvider localCart, ProductModel product) {
    int index = localCart.getItemIndexInCart(widget.productId);
    if (index == -1) {
      return 0.0;
    } else {
      double localSum =
          localCart.itemQuantityList[index] * product.calculatedNewPrice;
      return localSum;
    }
  }

  @override
  Widget build(BuildContext context) {
    // local vars next
    final ProductModel product =
        Provider.of<CommonDataProvider>(context, listen: false)
            .getProductItemById(widget.productId)!;
    CartsProvider localCart = Provider.of<CartsProvider>(context, listen: true);
    final mQ = MediaQuery.of(context).size;

    final textSpan = TextSpan(
        text: product.shortDescription
            .substring(0, product.shortDescription.lastIndexOf(' ')),
        style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.normal,
            color: ThisAppColors.white),
        children: [
          TextSpan(
              text: product.shortDescription
                  .substring(product.shortDescription.lastIndexOf(' ')),
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: ThisAppColors.white,
                  decoration: TextDecoration.underline),
              recognizer: TapGestureRecognizer()..onTap = toggleDetails)
        ]);

    return Scaffold(
      backgroundColor: ThisAppColors.black,
      appBar: null,
      body: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // picture next
            SizedBox(
                height: mQ.height * 0.55,
                width: double.infinity,
                child: Hero(
                    tag: 'product_${product.id}',
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Stack(children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                          ),
                          child: Image.network(
                            product.pictureOfProduct,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                        if (product.isDiscount!)
                          Positioned(
                            top: 0,
                            right: 0,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(20.0),
                                bottomRight: Radius.circular(10.0),
                              ),
                              child: Container(
                                color: Colors.transparent,
                                child: Image.asset(
                                  "assets/discount flag.png",
                                  width: 100,
                                  height: 465,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        if (product.isDiscount!)
                          Container(
                            margin: const EdgeInsets.only(
                                left: 279, top: 75, right: 3),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            decoration: BoxDecoration(
                              color: const Color(0xFFC94C4C),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              '-${product.discountAmount!}%',
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        // "go back button block" next
                        Column(children: [
                          const SizedBox(height: 50),
                          Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: SizedBox(
                                height: 40,
                                width: 40,
                                child: GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: ThisAppColors.silver
                                              .withOpacity(0.5),
                                        ),
                                        child: const Center(
                                          child: Icon(Icons.arrow_back_ios_new,
                                              color: ThisAppColors
                                                  .kAppPrimaryColor,
                                              size: 24),
                                        ))),
                              )),
                        ]),
                      ]),
                    ))),
            // text block next
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(product.nameOfProduct,
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: ThisAppColors.white)),
                          const SizedBox(height: 5),
                          Text('Залишилось: ${product.quantityLeft} л',
                              style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: ThisAppColors.silver)),
                        ]),
                    Column(mainAxisSize: MainAxisSize.min, children: [
                      Text('${product.calculatedNewPrice} \u20B4',
                          style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                              color: ThisAppColors.kAppPrimaryColor)),
                      if (product.isDiscount!)
                        Padding(
                          padding: const EdgeInsets.only(right: 25.0),
                          child: Text('${product.priceOfProduct} \u20B4',
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  color: ThisAppColors.white,
                                  decoration: TextDecoration.lineThrough)),
                        ),
                    ]),
                  ]),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.001),
            const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text('опис товару:',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: ThisAppColors.silver)),
            ),
            const SizedBox(height: 5),
            // textSpan
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: RichText(text: textSpan),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            //
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // custom Quantity Changer next
                    QuantityChanger(
                      totalHeight: 32,
                      totalWidth: 135,
                      iconSize: 13,
                      productId: widget.productId,
                      calledNotFromCart: true,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 35,
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: ThisAppColors.lightGrey.withOpacity(0.3)),
                      // local sum
                      child: Text(
                          "${getLocalSum(localCart, product).toStringAsFixed(1)} \u20B4",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: ThisAppColors.white, fontSize: 15)),
                    ),
                  ]),
            ),
            const SizedBox(height: 50),
            // button next
            Align(
              alignment: Alignment.center,
              child: CustomButton(
                width: mQ.width * 0.93,
                text: "Скинути обрану кількість",
                onPressed: () {
                  setState(() {
                    int index = localCart.getItemIndexInCart(widget.productId);
                    if (index == -1) {
                      return;
                    } else {
                      localCart.resetItemQuantity(index);
                      localCart.removeItemFromCart(index);
                      localCart.calculateTotalAmount();
                    }
                  });
                },
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.07),
          ],
        ),

        //
        //next is code for expanding of long description
        //
        if (isDetailsVisible) ...[
          GestureDetector(
              onTap: toggleDetails,
              child: Container(color: Colors.black.withOpacity(0.1))),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              width: MediaQuery.of(context).size.width * 0.88,
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.85),
                  borderRadius: BorderRadius.circular(12.0)),
              padding:
                  const EdgeInsets.symmetric(horizontal: 2.0, vertical: 1.0),
              child: Center(
                // content next
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 25,
                      child: Row(children: [
                        const SizedBox(width: 291),
                        IconButton(
                            icon: const Icon(Icons.close, size: 25),
                            color: ThisAppColors.white,
                            onPressed: toggleDetails),
                      ]),
                    ),
                    const SizedBox(height: 25),
                    Text(product.nameOfProduct,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: ThisAppColors.kAppPrimaryColor)),
                    const SizedBox(height: 1),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              for (String description
                                  in product.longDescription!)
                                if (description.isNotEmpty) ...[
                                  Column(
                                    children: [
                                      const Divider(),
                                      Text(
                                        description,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                          color: ThisAppColors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      DashedLineDivider(
                                        color: ThisAppColors.kAppPrimaryColor
                                            .withOpacity(0.5),
                                      ),
                                    ],
                                  ),
                                ],
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ]),
    );
  }
}
