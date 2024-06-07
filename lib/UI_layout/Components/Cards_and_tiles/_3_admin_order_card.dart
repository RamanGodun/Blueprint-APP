import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../State_management/Providers/Providers_for_store/cart_provider.dart';
import '../../../State_management/Theme_configuration/app_colors.dart';
import '../Dialogs/_general_alert_dialog.dart';
import '../Others/dash_divider.dart';
import '../Switchers/_2_my_switcher.dart';
import '../../PAGES/Tabs/default_tabs_from_shop.dart';

class AdminOrderItem extends StatefulWidget {
  final String customerName;
  final String customerAddress;
  final String wayOfDelivery;
  final double totalAmount;
  final DateTime createdAt;
  final bool isFinished;
  final String userId;
  final int requestedBonuses;

  const AdminOrderItem({
    super.key,
    required this.customerName,
    required this.customerAddress,
    required this.wayOfDelivery,
    required this.totalAmount,
    required this.createdAt,
    required this.isFinished,
    required this.userId,
    required this.requestedBonuses,
  });

  @override
  State<AdminOrderItem> createState() => _AdminOrderItemState();
}

class _AdminOrderItemState extends State<AdminOrderItem> {
  late CartsProvider adminCartData;
  //
  @override
  Widget build(BuildContext context) {
    final adminCartDate = Provider.of<CartsProvider>(context, listen: false);
    //
    return Container(
      width: double.infinity,
      height: 95,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.only(top: 5.0, right: 5, bottom: 5, left: 15),
      decoration: BoxDecoration(
          color: Theme.of(context).hoverColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(8.0)),
      child: Wrap(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(widget.customerName,
                          style: const TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w700,
                              color: AppColors.white)),
                    ),
                    Text('${widget.totalAmount.toStringAsFixed(0)}₴',
                        style: const TextStyle(
                            fontSize: 14.0,
                            color: AppColors.white,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 25,
                      child: IconButton(
                          icon: const Icon(Icons.expand_more,
                              size: 30, color: AppColors.kAppPrimaryColor),
                          onPressed: () {
                            // nextScreen(
                            //     context,
                            //     ExpandedOrderInfo(
                            //         orderIdTaken: widget.createdAt));
                          }),
                    ),
                  ],
                ),
              ),
              Text(DateFormat('yyyy/MM/dd   HH:mm').format(widget.createdAt),
                  style:
                      const TextStyle(fontSize: 12.0, color: AppColors.white)),

              //
              const SizedBox(height: 7),
              const DashedLineDivider(color: AppColors.white),
              //
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyCustomizedSwitcher(
                    mySwitcherValue:
                        adminCartDate.getIsOrderFinished(widget.createdAt),
                    orderId4Switcher: widget.createdAt,
                    createdAt: widget.createdAt,
                    userId: widget.userId,
                  ),
                  // showIsOrderFinishedDialog()
                  IconButton(
                      icon: Icon(Icons.delete,
                          color: AppColors.kAppPrimaryColor.withOpacity(0.5)),
                      onPressed: () {
                        showDeleteConfirmationDialog();
                      }),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

// methods are next
  void showDeleteConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StyledAlertDialog(
          productID: widget.createdAt.toIso8601String(),
          tabsIndex: 2,
          appBarIndex: 0,
          mappingKey: "admin's order delete",
          yesButtonText: "Так, звичайно",
          noButtonText: "Ні, дякую",
          text4Body: "Ви впевнені, що бажаєте видалити це замовлення",
          backgroundWidget: const AppTabs(bottomTab: 2, appBarIndex: 0),
          createdAt: widget.createdAt,
          userId: widget.userId,
          bonusRequest: widget.requestedBonuses,
          isFinishedOrder: widget.isFinished,
        );
      },
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    adminCartData = Provider.of<CartsProvider>(context, listen: false);
  }
}
