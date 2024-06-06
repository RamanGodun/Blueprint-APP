import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../State_management/Models/models_for_store/product_model.dart';
import '../../../State_management/Providers/Providers_for_store/common_data_provider.dart';
import '../../../State_management/Theme_configuration/this_app_colors.dart';
import '../Pickers/_2_quantity_changer.dart';
// state management

class CardOfProductItem4GridView extends StatefulWidget {
  final String productId;

  const CardOfProductItem4GridView({required this.productId, super.key});

  @override
  State<CardOfProductItem4GridView> createState() =>
      _CardOfProductItem4GridViewState();
}

class _CardOfProductItem4GridViewState
    extends State<CardOfProductItem4GridView> {
  @override
  Widget build(BuildContext context) {
    ProductModel? editedProduct =
        Provider.of<CommonDataProvider>(context, listen: false)
            .getProductItemById(widget.productId);

    return GestureDetector(
      onTap: () {},
      // nextScreen(context, ProductDetailPage(productId: widget.productId)),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.41,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: ThisAppColors.hover.withOpacity(0.4),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 6.0, top: 6.0, right: 6.0),
                child:
                    // picture next
                    ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(12.0)),
                  child: Image.network(
                    (editedProduct!.pictureOfProduct.isNotEmpty)
                        ? editedProduct.pictureOfProduct
                        : "https://repository.kristti.com.ua/wp-content/themes/repa/img/img/nopicture.png.pagespeed.ce.SuI672BVIb.png",
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 135,
                  ),
                ),
              ),
              if (editedProduct.isDiscount!)
                Positioned(
                  top: 6,
                  right: 4,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(8.0),
                      bottomRight: Radius.circular(3.0),
                    ),
                    child: Container(
                      color: Colors.transparent,
                      child: Image.asset(
                        "assets/discount flag.png",
                        width: 40,
                        height: 138,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
              if (editedProduct.isDiscount!)
                Container(
                  margin: const EdgeInsets.only(top: 10, right: 5),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 2.5, vertical: 2.5),
                  decoration: const BoxDecoration(
                    color: Color(0xFFC94C4C),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5.0),
                    ),
                  ),
                  child: Text(
                    (editedProduct.discountAmount! == 0)
                        ? "-5%   "
                        : '-${editedProduct.discountAmount!}%',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
          // text fields next
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(editedProduct.nameOfProduct,
                    // need to separate style var
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.white)),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text('${editedProduct.calculatedNewPrice} \u20B4 ',
                      style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: ThisAppColors.kAppPrimaryColor)),
                  const Text("/ за 1 л",
                      style: TextStyle(color: Colors.white, fontSize: 10)),
                ],
              ),
              Text(
                  (editedProduct.isDiscount!)
                      ? '${editedProduct.priceOfProduct} \u20B4'
                      : "",
                  style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: ThisAppColors.white,
                      decoration: TextDecoration.lineThrough)),
              const SizedBox(height: 10),
              // Quantity changer next
              Align(
                  alignment: Alignment.center,
                  child: QuantityChanger(
                      iconSize: 30,
                      totalHeight: 30,
                      totalWidth: 130,
                      productId: widget.productId,
                      calledNotFromCart: true)),
            ]),
          ),
        ]),
      ),
    );
  }
}
