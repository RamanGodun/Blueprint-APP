import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../State_management/Models/_0_models.dart';
import '../../../State_management/Providers/Providers_for_store/_2_cart_provider.dart';
import '../../../State_management/Theme_configuration/App_colors_palette/this_app_colors.dart';
import '../../../UI_Components/Cards_and_tiles/_3_admin_order_card.dart';

class AdminOrdersList extends StatefulWidget {
  const AdminOrdersList({super.key});

  @override
  State<AdminOrdersList> createState() => _AdminOrdersListState();
}

class _AdminOrdersListState extends State<AdminOrdersList> {
  late CartsProvider cartProvider;

  @override
  void initState() {
    super.initState();
    cartProvider = Provider.of<CartsProvider>(context, listen: false);
    cartProvider.fetchAdminOrders();
  }

  @override
  Widget build(BuildContext context) {
    final List<CartItem> listOfOrders4Admin =
        Provider.of<CartsProvider>(context, listen: true).adminOrdersCartList;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 45,
        backgroundColor: ThisAppColors.black,
        title: const Text(
          "Поточні замовлення",
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: IconButton(
              icon: const Icon(Icons.article_outlined, size: 30),
              color: ThisAppColors.amber1,
              onPressed: () {
                // nextScreen(context, const DiscountSystem());
              },
            ),
          ),
        ],
      ),
      // body next
      body: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            child:
                // empty case next
                (listOfOrders4Admin.isEmpty)
                    ? const Padding(
                        padding: EdgeInsets.only(bottom: 90.0),
                        child: Center(
                            child: Text(
                          "Поки що немає активних замовлень",
                          style: TextStyle(color: ThisAppColors.white),
                        )),
                      )
                    // ListView builder next
                    : ListView.builder(
                        itemCount: listOfOrders4Admin.length,
                        itemBuilder: (context, index) {
                          final cartItem = listOfOrders4Admin[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 7.0, vertical: 3),
                            child: AdminOrderItem(
                              customerName: cartItem.customerId,
                              customerAddress: cartItem.location,
                              wayOfDelivery: cartItem.deliveryWay,
                              totalAmount: cartItem.totalSum!,
                              createdAt: cartItem.createdAt,
                              isFinished: cartItem.isFinished,
                              userId: cartItem.id,
                              requestedBonuses: cartItem.amountOfBonusRequest,
                            ),
                          );
                        },
                      ),
          ),
          const SizedBox(height: 25)
        ],
      ),
    );
  }
}
