import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../State_management/Models/models_for_store/product_model.dart';
import '../../../../State_management/Providers/Providers_for_store/common_data_provider.dart';
import '../../Images/image_widgets.dart';
import '../../Pickers/for_shop/quantity_changer.dart';
import '../../_Widgets_STYLING/cards_and_tiles_styles.dart';
import '../../_Widgets_STYLING/app_text_styles_for_ui.dart';

class CardOfProductItem4GridView extends StatefulWidget {
  const CardOfProductItem4GridView({required this.productId, super.key});

  final String productId;

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
      child: Container(
        width: MediaQuery.of(context).size.width * 0.41,
        decoration: CardsAndTilesStyles.cardDecoration(context),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              _ItemPhotoWidget(editedProduct: editedProduct),
              if (editedProduct!.isDiscount!) const _DiscountFlagWidget(),
              if (editedProduct.isDiscount!)
                _DiscountLabelWidget(editedProduct: editedProduct),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(editedProduct.nameOfProduct,
                    style: AppTextStyles.productNameStyle()),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text('${editedProduct.calculatedNewPrice} \u20B4 ',
                      style: AppTextStyles.newPriceStyle()),
                  Text("/ за 1 л", style: AppTextStyles.priceStyle()),
                ],
              ),
              Text(
                  (editedProduct.isDiscount!)
                      ? '${editedProduct.priceOfProduct} \u20B4'
                      : "",
                  style: AppTextStyles.oldPriceStyle()),
              const SizedBox(height: 10),
              _QuantityChangerWidget(widget: widget),
            ]),
          ),
        ]),
      ),
    );
  }
}

class _DiscountLabelWidget extends StatelessWidget {
  const _DiscountLabelWidget({
    required this.editedProduct,
  });

  final ProductModel? editedProduct;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, right: 5),
      padding: const EdgeInsets.symmetric(horizontal: 2.5, vertical: 2.5),
      decoration: CardsAndTilesStyles.discountDecoration(),
      child: Text(
        (editedProduct!.discountAmount! == 0)
            ? "-5%   "
            : '-${editedProduct!.discountAmount!}%',
        style: AppTextStyles.discountTextStyle(),
      ),
    );
  }
}

class _QuantityChangerWidget extends StatelessWidget {
  const _QuantityChangerWidget({
    required this.widget,
  });

  final CardOfProductItem4GridView widget;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: QuantityChanger(
            iconSize: 30,
            totalHeight: 30,
            totalWidth: 130,
            productId: widget.productId,
            calledNotFromCart: true));
  }
}

class _ItemPhotoWidget extends StatelessWidget {
  const _ItemPhotoWidget({
    required this.editedProduct,
  });

  final ProductModel? editedProduct;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6.0, top: 6.0, right: 6.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12.0)),
        child: editedProduct!.pictureOfProduct.isNotEmpty
            ? Image.network(
                editedProduct!.pictureOfProduct,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 135,
              )
            : AppImages.noImagePlaceholder(),
      ),
    );
  }
}

class _DiscountFlagWidget extends StatelessWidget {
  const _DiscountFlagWidget();

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
    );
  }
}
