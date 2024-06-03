import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../State_management/Models/_0_models.dart';
import '../../State_management/Providers/Providers_for_store/_1_auth_profile_provider.dart';
import '../../State_management/Providers/Providers_for_store/_1_common_data_provider.dart';
import '../../State_management/Theme_configuration/App_colors_palette/this_app_colors.dart';
import '../Others/dashed_border_container.dart';

class UsersInfoCard extends StatelessWidget {
  final bool isAdmin;
  final bool isSellersInfo;

  //
  const UsersInfoCard({
    required this.isAdmin,
    required this.isSellersInfo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //vars
    final CommonDataProvider productsProviderInfo =
        Provider.of<CommonDataProvider>(context, listen: false);
    final AuthProvider proFile =
        Provider.of<AuthProvider>(context, listen: false);
    final ProfileInfoModel proFileInfo = proFile.userProfileData;

    List<String> customerData = [
      (proFileInfo.personalNickName!.isNotEmpty)
          ? proFileInfo.personalNickName!
          : "Дані ще не введено",
      (proFileInfo.phoneNumber!.isNotEmpty)
          ? proFileInfo.phoneNumber!
          : "Дані ще не введено",
      proFileInfo.amountOfBonuses.toString(),
    ];
    List<String> sellerData = [
      (isAdmin == true && proFileInfo.personalNickName!.isNotEmpty ||
              isAdmin == false &&
                  productsProviderInfo
                      .generalInfoData.adminsNickName.isNotEmpty)
          ? productsProviderInfo.generalInfoData.adminsNickName
          : "Продавець ще не вів дані",
      (isAdmin == true &&
                  productsProviderInfo.generalInfoData.adminsEmail.isNotEmpty ||
              isAdmin == false &&
                  productsProviderInfo.generalInfoData.adminsEmail.isNotEmpty)
          ? productsProviderInfo.generalInfoData.adminsEmail
          : "е-пошта не введена",
      (isAdmin == true && proFileInfo.phoneNumber!.isNotEmpty ||
              isAdmin == false &&
                  productsProviderInfo
                      .generalInfoData.adminPhoneNumber.isNotEmpty)
          ? productsProviderInfo.generalInfoData.adminPhoneNumber
          : "Продавець ще не вів дані",
    ];

//
    return Stack(
      children: [
        Container(
          margin:
              const EdgeInsets.only(top: 5.0, bottom: 5.00, left: 8, right: 8),
          padding: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            color: ThisAppColors.hover.withOpacity(0.4),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // profile photo next
                DashedBorderContainer(
                  borderWidth: 0.05,
                  dashSpace: 0.5,
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            bottomLeft: Radius.circular(10.0))),
                    child:
                        //
                        (isAdmin == true &&
                                    proFile.userProfileData.profilePicture!
                                        .isNotEmpty ||
                                isAdmin == false &&
                                    isSellersInfo == false &&
                                    proFile.userProfileData.profilePicture!
                                        .isNotEmpty)
                            ? ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(7),
                                    bottomLeft: Radius.circular(7)),
                                child: Image.network(
                                    proFile.userProfileData.profilePicture!,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: double.infinity),
                              )
                            : (isAdmin == false && isSellersInfo == true)
                                ? ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(7),
                                        bottomLeft: Radius.circular(7)),
                                    child: Image.network(
                                        productsProviderInfo
                                            .generalInfoData.adminPicture,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: double.infinity),
                                  )
                                : const Icon(Icons.add_a_photo,
                                    color: ThisAppColors.yellow1, size: 50),
                  ),
                ),
                const SizedBox(width: 10),
                // Profile info next
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(left: 33.0),
                            child: Text(
                              (isSellersInfo == true)
                                  ? "Контактні дані"
                                  : "Персональні дані",
                              style: const TextStyle(
                                  color: ThisAppColors.amber1,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                            )),
                        const SizedBox(height: 7),
                        // List builder next:
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: customerData.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 3),
                              child: Row(children: [
                                Icon(
                                  (isSellersInfo == true)
                                      ? _getIconForIndex2(index)
                                      : _getIconForIndex1(index),
                                  color: ThisAppColors.white,
                                  size: 18,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                    (isSellersInfo == true)
                                        ? sellerData[index]
                                        : (isSellersInfo != true && index == 2)
                                            ? "Мої бонуси ${customerData[index]}"
                                            : customerData[index],
                                    style: TextStyle(
                                        color: (isSellersInfo != true &&
                                                index == 2)
                                            ? ThisAppColors.amber1
                                            : ThisAppColors.white,
                                        fontSize: 13)),
                              ]),
                            );
                          },
                        ),
                      ]),
                ),
              ]),
        ),
        //
        // editing icon next
        //
        (isSellersInfo != true && isAdmin == false ||
                isSellersInfo == true && isAdmin == true)
            ? Row(
                children: [
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      // nextScreen(
                      //   context,
                      //   (isSellersInfo == false && isAdmin == false)
                      //       ? const CustomerInfo(isFromOrderScreen: false)
                      //       : const PersonalDataEditing4Admin(),
                      // );
                    },
                    icon: const Icon(Icons.edit,
                        color: ThisAppColors.yellow2, size: 20),
                  ),
                ],
              )
            : Container(),
      ],
    );
  }
}

IconData _getIconForIndex1(int index) {
  switch (index) {
    case 0:
      return Icons.person;
    case 1:
      return Icons.phone;
    case 2:
      return Icons.camera;
    default:
      return Icons.person;
  }
}

IconData _getIconForIndex2(int index) {
  switch (index) {
    case 0:
      return Icons.person;
    case 1:
      return Icons.mail;
    case 2:
      return Icons.phone;
    default:
      return Icons.person;
  }
}
