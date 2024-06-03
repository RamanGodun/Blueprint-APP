import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../State_management/Providers/Providers_for_store/_2_cart_provider.dart';
import '../../State_management/Theme_configuration/App_colors_palette/this_app_colors.dart';
import '../Others/dash_divider.dart';

class CustomersOrderItem extends StatefulWidget {
  final DateTime createdAt;
  final double totalAmount;

  const CustomersOrderItem({
    super.key,
    required this.createdAt,
    required this.totalAmount,
  });

  @override
  State<CustomersOrderItem> createState() => _CustomersOrderItemState();
}

class _CustomersOrderItemState extends State<CustomersOrderItem> {
  @override
  Widget build(BuildContext context) {
    CartsProvider cartProvider = Provider.of<CartsProvider>(context);
// card for user order in his page
    return Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(
              top: 5.0, bottom: 5.00, left: 10, right: 10),
          padding:
              const EdgeInsets.only(top: 15.0, right: 10, bottom: 10, left: 15),
          decoration: BoxDecoration(
            color: ThisAppColors.hover.withOpacity(0.5),
            borderRadius: BorderRadius.circular(7.0),
          ),
          child: Wrap(children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Замовлення за:',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Theme.of(context).focusColor,
                                ),
                              ),
                              Text(
                                  DateFormat('yyyy/MM/dd   HH:mm')
                                      .format(widget.createdAt),
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Theme.of(context).focusColor,
                                  )),
                            ]),
                        Text(
                          '${widget.totalAmount.toStringAsFixed(2)} \u20B4',
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: ThisAppColors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.expand_more,
                              color: Colors.amber),
                          onPressed: () {
                            cartProvider.inChosenOrderSetIsExpandedTrue(
                                widget.createdAt);
                          },
                        ),
                      ]),
                  const DashedLineDivider(color: ThisAppColors.silver)
                ]),
          ]),
        ));
  }
}
