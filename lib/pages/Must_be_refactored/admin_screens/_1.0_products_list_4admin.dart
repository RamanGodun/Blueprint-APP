import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../State_management/Models/_0_models.dart';
import '../../../State_management/Providers/Providers_for_store/_1_common_data_provider.dart';
import '../../../State_management/Src/Helpers/dm_methods.dart';
import '../../../State_management/Theme_configuration/App_colors_palette/my_first_top_design.dart';
import '../../../UI_Components/Buttons/_1_custom_button.dart';
import '../../../UI_Components/Cards_and_tiles/_2_card_for_list_view.dart';

class AdminsListOfProducts extends StatefulWidget {
  final int categoryOfProducts;
  const AdminsListOfProducts({super.key, required this.categoryOfProducts});

  @override
  State<AdminsListOfProducts> createState() => _AdminsListOfProductsState();
}

class _AdminsListOfProductsState extends State<AdminsListOfProducts> {
  @override
  Widget build(BuildContext context) {
    //
    final bool isMainCategory = (widget.categoryOfProducts == 0);
    final productsInfo =
        Provider.of<CommonDataProvider>(context, listen: false);
    final List<ProductModel> productsList4Admin = isMainCategory
        ? productsInfo.getMainCategoryProductsList()
        : productsInfo.getNonMainCategoryProductsList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Stack(
        children: [
          (productsList4Admin.isNotEmpty)
              ? ListView.builder(
                  itemCount: productsList4Admin.length,
                  itemBuilder: (context, index) {
                    final productsItem = productsList4Admin[index];
                    return ProductsListViewItem(
                      productsId: productsItem.id,
                      titleOfProduct: productsItem.nameOfProduct,
                      priceOfProduct: productsItem.calculatedNewPrice,
                      amountLeft: productsItem.quantityLeft,
                      isEditingIconNeed: true,
                      needAmountLeft: true,
                    );
                  },
                )
              // case for no items next
              : const Center(
                  child: Text(
                    "Додайте свій перший товар",
                    style: TextStyle(color: IOSDarkThemeColors.amber1),
                  ),
                ),
          // layout for button next
          Column(
            children: [
              const SizedBox(height: 565),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1.0),
                child: CustomButton(
                  text: "Додати товар",
                  width: MediaQuery.of(context).size.width * 0.99,
                  height: 45,
                  onPressed: () async {
                    final String newProductsId = DateTime.now().toString();
                    final ProductModel newProductItem = ProductModel(
                      id: newProductsId,
                      nameOfProduct: "",
                      isMainCategory: true,
                      pictureOfProduct: "",
                      priceOfProduct: 0,
                      quantityLeft: 0.0,
                      shortDescription: "",
                      longDescription: ["", "", "", "", ""],
                      isDiscount: false,
                      discountAmount: 0,
                      isDiscountPlus: false,
                      discountsLevel: [false, false, false, false, false],
                    );
                    //
                    productsInfo.addProductItem(newProductItem);
                    DMMethodsOnDB()
                        .addProduct2Firebase(context, newProductItem, false);
                    // nextScreen(
                    //     context,
                    //     ProductsEditingScreen(
                    //         productId: newProductsId, isNewProductItem: true));
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
