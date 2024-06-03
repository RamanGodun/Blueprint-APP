// general
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../State_management/Providers/Providers_for_store/_2_cart_provider.dart';
import '../../State_management/Theme_configuration/App_colors_palette/my_first_top_design.dart';
// state management

class CheckboxWidget extends StatefulWidget {
  final VoidCallback? onPressed;
  final bool isImmutable;
  final int availableBonuses;
  final double? totalSumOfOrder;

  const CheckboxWidget({
    super.key,
    this.onPressed,
    this.isImmutable = false,
    this.availableBonuses = 0,
    this.totalSumOfOrder,
  });

  @override
  State<CheckboxWidget> createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  bool isChecked = false;
  late int reservedAvailableBonuses;

  @override
  void initState() {
    super.initState();
    reservedAvailableBonuses = widget.availableBonuses;
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartsProvider>(context, listen: false);
    // final profileProvider = Provider.of<AuthProvider>(context, listen: false);
    //
    return (widget.isImmutable == false)
        ? GestureDetector(
            onTap: () {
              if (reservedAvailableBonuses == 0) {
                // showSnackbar(context,
                //     color: IOSDarkThemeColors.darkAmber2,
                //     content: "бонуси відсутні");
              } else if (widget.totalSumOfOrder! < reservedAvailableBonuses) {
                // if () {}else{}
                // showSnackbar(context,
                //     color: IOSDarkThemeColors.darkAmber2,
                //     content:
                //         "сума замовлення має бути більшої кількості використаних бонусів");
                //
              } else {
                // Виклик методу toggleIsBonusRequest у кошику
                cartProvider.toggleIsBonusRequest(
                    reservedAvailableBonuses, null);
                setState(() {
                  isChecked = !isChecked;
                  if (widget.onPressed != null) {
                    widget.onPressed!();
                  }
                });
                // Виклик методу updateAmountOfBonuses для оновлення кількості бонусів у профілі
                if (isChecked) {
                  // profileProvider.updateProfileData(newAmountOfBonuses: 0);
                } else {
                  // profileProvider.updateProfileData(
                  //     newAmountOfBonuses: reservedAvailableBonuses);
                }
              }
            },
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 2),
                borderRadius: BorderRadius.circular(4),
                color: isChecked
                    ? IOSDarkThemeColors.white.withOpacity(0.8)
                    : Colors.transparent,
              ),
              child: isChecked
                  ? const Icon(Icons.check, color: Colors.green, size: 20)
                  : null,
            ),
          )
        // next for registration page, for textField only
        : Container(
            height: 30,
            width: 30,
            margin: const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
            ),
            child: const Icon(Icons.done, color: Colors.white, size: 20),
          );
  }
}
