import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../State_management/Models/models_for_store/product_model.dart';
import '../../../State_management/Providers/Providers_for_store/cart_provider.dart';
import '../../../State_management/Providers/Providers_for_store/common_data_provider.dart';
import '../../../State_management/Theme_configuration/app_colors.dart';

class QuantityChanger extends StatefulWidget {
  final double totalWidth;
  final double totalHeight;
  final double? iconSize;
  final double? quantityOfProduct;
  final String productId;
  final bool calledNotFromCart;

  const QuantityChanger({
    required this.totalWidth,
    required this.totalHeight,
    this.iconSize,
    this.quantityOfProduct,
    required this.productId,
    required this.calledNotFromCart,
    super.key,
  });

  @override
  State<QuantityChanger> createState() => _QuantityChangerState();
}

class _QuantityChangerState extends State<QuantityChanger> {
  //

  @override
  Widget build(BuildContext context) {
    ProductModel? addedProductItemToCart =
        Provider.of<CommonDataProvider>(context, listen: false)
            .getProductItemById(widget.productId);
    CartsProvider cartProvider =
        Provider.of<CartsProvider>(context, listen: true);

    return Stack(
      children: [
        Container(
          height: widget.totalHeight,
          width: widget.totalWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: AppColors.lightGrey.withOpacity(0.3),
          ),
        ),
        SizedBox(
          width: widget.totalWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: widget.totalHeight,
                width: widget.totalHeight,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.5),
                  color: AppColors.kAppPrimaryColor,
                ),
                child:
                    // "minus" IconButton
                    IconButton(
                  onPressed: () {
                    if (widget.calledNotFromCart &&
                        cartProvider.getItemIndexInCart(widget.productId) ==
                            -1) {
                      return;
                    } else {
                      double amountOfItemInCart = cartProvider
                              .localCart.itemQuantity[
                          cartProvider.getItemIndexInCart(widget.productId)];
                      if (amountOfItemInCart != 0.5) {
                        cartProvider.minusButtonAction(
                            widget.productId, widget.calledNotFromCart, false);
                      } else {
                        _showDeleteAlertDialog(
                            context, cartProvider, addedProductItemToCart!);
                      }
                    }
                  },
                  icon: Icon(Icons.remove,
                      size: (widget.iconSize != null) ? 15 : widget.iconSize,
                      color: Colors.black),
                ),
              ),
              const SizedBox(width: 10),
              // text with product amount
              // need to return the Consumer
              Text(
                ((cartProvider.getItemIndexInCart(widget.productId) == -1)
                        ? "0.0"
                        : cartProvider.localCart.itemQuantity[
                            cartProvider.getItemIndexInCart(widget.productId)])
                    .toString(),
                style: const TextStyle(fontSize: 16, color: AppColors.white),
              ),
              const SizedBox(width: 10),
              // "plus" IconButton
              Container(
                height: widget.totalHeight,
                width: widget.totalHeight,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: AppColors.kAppPrimaryColor,
                ),
                child: IconButton(
                    onPressed: () {
                      cartProvider.plusButtonAction(
                        widget.productId,
                        addedProductItemToCart!.nameOfProduct,
                        addedProductItemToCart.calculatedNewPrice,
                        widget.calledNotFromCart,
                        addedProductItemToCart.quantityLeft,
                        context,
                      );
                    },
                    icon: Icon(Icons.add,
                        size: (widget.iconSize != null) ? 15 : widget.iconSize,
                        color: Colors.black)),
              ),
            ],
          ),
        ),
      ],
    );
  }

//
  void _showDeleteAlertDialog(BuildContext context, CartsProvider cartInfo,
      ProductModel addedItem2Cart) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: AppColors.black1.withOpacity(0.6),
          padding: const EdgeInsets.only(bottom: 100),
          child: AlertDialog(
            elevation: 0,
            backgroundColor: AppColors.darkGrey3.withOpacity(0.8),
            contentPadding:
                const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 5),
            content: SizedBox(
                height: 90,
                child: Column(children: [
                  const Text(
                      "Ви впевнені, що бажаєте видалити цей товар з кошику?",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: AppColors.white, fontSize: 16)),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Відміна",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColors.kAppPrimaryColor,
                                  fontSize: 15)),
                        ),
                        TextButton(
                          onPressed: () {
                            cartInfo.minusButtonAction(widget.productId,
                                widget.calledNotFromCart, true);
                            Navigator.pop(context);
                          },
                          child: const Text("Так, впевнений",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColors.kAppPrimaryColor,
                                  fontSize: 14)),
                        ),
                      ]),
                ])),
          ),
        );
      },
    );
  }
  //
  //
}
