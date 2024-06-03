// general
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../State_management/Providers/Providers_for_store/_1_auth_profile_provider.dart';
import '../../State_management/Providers/Providers_for_store/_1_common_data_provider.dart';
import '../../State_management/Providers/Providers_for_store/_2_cart_provider.dart';
import '../../State_management/Src/Helpers/dm_methods.dart';
import '../../State_management/Theme_configuration/App_colors_palette/my_first_top_design.dart';
// state management

// screens or widgets

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
    //
    final AuthProvider aP = Provider.of<AuthProvider>(context, listen: false);
    final adminCartItemInfo =
        Provider.of<CartsProvider>(context, listen: false);
    final CommonDataProvider productsInfo =
        Provider.of<CommonDataProvider>(context, listen: false);
//
//
    Map<String, Function> mapping4Functions = {
      //
      "exit from app": (String nothing) async {
        await aP.userSignOut();
        await aP.saveUserDataToSP();
        // nextScreenReplace(context, const MyApp(isNewUser: false));
      },
      //
      "product's delete": (String productId) async {
        if (widget.isNewProductItem == false) {
          await DMMethodsOnDB().deleteProductImageOnStorage(widget.productID!);
        }
        await DMMethodsOnDB()
            .removeProductOnFirebase(context, widget.productID!);
        if (mounted) {
          productsInfo.removeProductItem(productId);
          // nextScreenReplace(
          //     context, AppTabs(bottomTab: 0, appBarIndex: widget.appBarIndex));
        }
      },
      //
      "admin's order delete": (String itemId) async {
        try {
          await DMMethodsOnDB().inAdminOrderSetIsNotVisible(widget.createdAt!,
              widget.userId!, widget.bonusRequest!, widget.isFinishedOrder!);
          await adminCartItemInfo.fetchAdminOrders();
        } catch (error) {
          // ignore: avoid_print
          print("mistake during deleting of order by admin $error");
        }
      },
      //
      // "customer cart": (String nothing) async {
      //   nextScreenReplace(context, const AppTabs(bottomTab: 1, appBarIndex: 0));
      // },
      //
      // "product delete from QuantityChanger": (String nothing) {
      //   nextScreen(
      //       context,
      //       CustomerInfo(
      //           isFromOrderScreen: widget.isFromOrderScreen,
      //           totalSum: widget.totalSum));
      // },
    };

// when finds containsKey – perform that part
    void currentMethod(String inputString,
        Map<String, Function> mapping4OnSubmit, String? productsId) {
      if (mapping4OnSubmit.containsKey(inputString)) {
        mapping4OnSubmit[inputString]!(productsId);
      }
    }

    return Container(
        decoration: BoxDecoration(
            color: IOSDarkThemeColors.black1.withOpacity(0.65),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 0.1)),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 100),
          child: AlertDialog(
              backgroundColor: IOSDarkThemeColors.grey1.withOpacity(0.96),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              content: Column(mainAxisSize: MainAxisSize.min, children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(widget.text4Body,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: IOSDarkThemeColors.white, fontSize: 18)),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        child: Text(
                          widget.noButtonText,
                          style: TextStyle(
                              fontSize: 16,
                              color:
                                  IOSDarkThemeColors.amber2.withOpacity(0.7)),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text(
                          widget.yesButtonText,
                          style: TextStyle(
                              fontSize: 16,
                              color:
                                  IOSDarkThemeColors.yellow2.withOpacity(0.7)),
                        ),
                        onPressed: () {
                          currentMethod(widget.mappingKey, mapping4Functions,
                              widget.productID!);
                          // Navigator.of(context).pop();
                        },
                      ),
                    ]),
              ]),
              contentPadding: const EdgeInsets.only(top: 10),
              actionsPadding: const EdgeInsets.all(3)),
        ));
  }
}