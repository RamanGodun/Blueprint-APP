import 'package:flutter/material.dart';
import '../../_Widgets_STYLING/dialogs_styles.dart';

class StyledAlertDialog extends StatefulWidget {
  final String? productID;
  final Widget backgroundWidget;
  final String mappingKey;
  final String yesButtonText;
  final String noButtonText;
  final String text4Body;
  final int? tabsIndex;
  final int? appBarIndex;
  final double? totalSum;
  final bool? isFromOrderScreen;
  final bool? isNewProductItem;
  final DateTime? createdAt;
  final String? userId;
  final int? bonusRequest;
  final bool? isFinishedOrder;

  const StyledAlertDialog({
    super.key,
    this.productID,
    required this.backgroundWidget,
    required this.mappingKey,
    required this.yesButtonText,
    required this.noButtonText,
    required this.text4Body,
    this.tabsIndex = 0,
    this.appBarIndex = 0,
    this.totalSum = 0,
    this.isFromOrderScreen = true,
    this.isNewProductItem = true,
    this.createdAt,
    this.userId,
    this.bonusRequest,
    this.isFinishedOrder,
  });

  @override
  State<StyledAlertDialog> createState() => _StyledAlertDialogState();
}

class _StyledAlertDialogState extends State<StyledAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return AppDialogsStyles.dialogFromGG(
      context: context,
      text4Body: widget.text4Body,
      yesButtonText: widget.yesButtonText,
      noButtonText: widget.noButtonText,
      mappingKey: widget.mappingKey,
      productID: widget.productID,
      isNewProductItem: widget.isNewProductItem,
      createdAt: widget.createdAt,
      userId: widget.userId,
      bonusRequest: widget.bonusRequest,
      isFinishedOrder: widget.isFinishedOrder,
    );
  }
}
