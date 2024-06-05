import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../State_management/Providers/Providers_for_store/auth_profile_provider.dart';
import '../../../State_management/Theme_configuration/App_colors_palette/this_app_colors.dart';

class DeliverySelectionWidget extends StatefulWidget {
  const DeliverySelectionWidget({super.key});

  @override
  State<DeliverySelectionWidget> createState() =>
      _DeliverySelectionWidgetState();
}

class _DeliverySelectionWidgetState extends State<DeliverySelectionWidget> {
  final List<String> deliveryMethods = [
    "Самовивіз",
    "Нова Пошта",
    "Укрпошта",
  ];

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<AuthProvider>(context, listen: false);

    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: ThisAppColors.white),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ExpansionTile(
                  tilePadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                  iconColor: ThisAppColors.white,
                  collapsedIconColor: ThisAppColors.white,
                  title: Text(
                      (profileProvider.userProfileData.deliveryWay.isNotEmpty)
                          ? profileProvider.userProfileData.deliveryWay
                          : "Оберіть спосіб доставки",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: ThisAppColors.white,
                      )),
                  children: [
                    Column(
                      children: deliveryMethods.map((method) {
                        return buildExpansionTileItem(method, profileProvider);
                      }).toList(),
                    ),
                  ]),
            ),
          ),
        ]);
  }

  Widget buildExpansionTileItem(String method, AuthProvider profileProvider) {
    return GestureDetector(
      onTap: () {
        _updateDeliveryMethod(method, profileProvider);
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 20),
          child: Text(
            method,
            style: TextStyle(
                color: (profileProvider.userProfileData.deliveryWay == method)
                    ? ThisAppColors.kAppPrimaryColor
                    : ThisAppColors.white),
          ),
        ),
      ),
    );
  }

  void _updateDeliveryMethod(String method, AuthProvider profileProvider) {
    setState(() {
      profileProvider.updateProfileData(newDeliveryMethod: method);
    });
  }
}
