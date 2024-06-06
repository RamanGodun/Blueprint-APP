import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../State_management/Models/models_for_store/product_model.dart';
import '../../../../State_management/Providers/Providers_for_store/auth_profile_provider.dart';
import '../../../../State_management/Providers/Providers_for_store/common_data_provider.dart';
import '../../../../State_management/Theme_configuration/this_app_colors.dart';
import '../../../Components/Buttons/for_shop/custom_button.dart';
import '../../../Components/Cards_and_tiles/_1_grid_view_card.dart';

class ProductsGrid extends StatefulWidget {
  final bool showMainCategory;

  const ProductsGrid(
    this.showMainCategory, {
    super.key,
  });

  @override
  State<ProductsGrid> createState() => _ProductsGridState();
}

class _ProductsGridState extends State<ProductsGrid> {
  //
  @override
  Widget build(BuildContext context) {
    final CommonDataProvider productsData =
        Provider.of<CommonDataProvider>(context, listen: true);
    final List<ProductModel> products = widget.showMainCategory
        ? productsData.getMainCategoryProductsList()
        : productsData.getNonMainCategoryProductsList();
    final mQ = MediaQuery.of(context).size;
    final AuthProvider aP = Provider.of<AuthProvider>(context);

    //
    return Container(
      decoration: BoxDecoration(color: AppColors.black.withOpacity(0.5)),
      width: mQ.width * 0.82,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(height: 10),
                  (products.isNotEmpty)
                      ? Expanded(
                          child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 3.0),
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.7,
                                    crossAxisSpacing: 15,
                                    mainAxisSpacing: 10),
                            shrinkWrap: true,
                            itemCount: products.length,
                            itemBuilder: (ctx, i) {
                              final product = products[i];
                              return CardOfProductItem4GridView(
                                productId: product.id,
                              );
                            },
                          ),
                        ))
                      // case, when there no products
                      : const Expanded(
                          child: Center(
                          child: Text("Продукти даної категорії відсутні",
                              style:
                                  TextStyle(color: AppColors.kAppPrimaryColor)),
                        )),
                  const SizedBox(height: 50),
                ]),
          ),
          // button next
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 535.0),
              child: CustomButton(
                text: "Перейти до кошику",
                onPressed: () async {
                  await aP.getUserDataFromFirestore();
                  // ignore: use_build_context_synchronously
                  // nextScreen(context, const CustomerCartScreen());
                },
                width: 370,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
