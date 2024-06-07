import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../../State_management/Providers/Providers_for_store/auth_profile_provider.dart';
import '../../../../State_management/Providers/Providers_for_store/cart_provider.dart';
import '../../../../State_management/Helpers/For_auth/dm_methods.dart';
import '../../../../State_management/Theme_configuration/app_colors.dart';
import '../../../Components/Buttons/for_shop/custom_button.dart';
import '../../../Components/Dialogs/_general_alert_dialog.dart';
import '../../../Components/Images/_6_customer_pic_4edit_screen.dart';
import '../../../Components/Static/_dash_divider.dart';
import '../../../Components/Others/_dashed_border_container.dart';
import '../../../Components/Text_fields/_my_first_tf.dart';
import '_5_delivery_selection.dart';
// ignore_for_file: use_build_context_synchronously

class CustomerInfo extends StatefulWidget {
  final double? totalSum;
  final bool? isFromOrderScreen;
  const CustomerInfo({
    super.key,
    this.totalSum,
    this.isFromOrderScreen,
  });

  @override
  State<CustomerInfo> createState() => _CustomerInfoState();
}

class _CustomerInfoState extends State<CustomerInfo> {
  final formKey = GlobalKey<FormState>();
  File? selectedImageOfCustomer;
  bool isLoading = false;

  List<TextEditingController> textEditingControllers = List.generate(
    6,
    (index) => TextEditingController(),
  );

  //

  @override
  Widget build(BuildContext context) {
    final mQ = MediaQuery.of(context).size;
    final profileInfo = Provider.of<AuthProvider>(context, listen: false);
    final cartProvider = Provider.of<CartsProvider>(context, listen: false);
//
    var repeatedPartOfWidget = Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        (widget.isFromOrderScreen == false)
            ? Column(children: [
                const SizedBox(height: 20),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SizedBox(
                      height: 20, child: Image.asset("assets/3sot up.png")),
                  const Text(
                    "Особисті дані",
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 20, child: Image.asset("assets/3sot up.png"))
                ]),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                              height: 80,
                              width: 90,
                              child: DashedBorderContainer(
                                borderWidth: 0.5,
                                dashWidth: 2,
                                child: InkWell(
                                  onTap: () => selectImageOfCustomer(),
                                  child: ProfileImageWidget(
                                      isLoading: isLoading,
                                      selectedImageOfCustomer:
                                          selectedImageOfCustomer,
                                      profilePictureUrl: profileInfo
                                          .userProfileData.userImageURL,
                                      onTap: () => selectImageOfCustomer()),
                                ),
                              )),
                          StyledTextFormField(
                              controller: textEditingControllers[4],
                              labelText: "назва аккаунту:",
                              hintText: "введіть назву свого аккаунту",
                              typeOfField: "String",
                              heightOfField: 35,
                              widthOfField: mQ.width * 0.6,
                              maxSymbols: 35,
                              textAlign: TextAlign.start,
                              textPadding: const EdgeInsets.only(left: 25),
                              needValidation: true),
                        ])),
              ])
            : Container(),

        //
        // TextFormFieldBlock1ForCustomerDataEditing(
        //   textEditingController1: textEditingControllers[0],
        //   textEditingController2: textEditingControllers[1],
        // ),
        //
        const DeliverySelectionWidget(),
        //
        // TextFormFieldBlock2ForCustomerDataEditing(
        //   textEditingController3: textEditingControllers[2],
        //   textEditingController4: textEditingControllers[3],
        //   textEditingController6: textEditingControllers[5],
        // ),
        //
      ],
    );
//
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(40.0),
          child: AppBar(
            backgroundColor: Colors.grey[900],
            leading:
                // functionality of "go back button"
                IconButton(
                    icon: const Icon(Icons.arrow_back_ios,
                        size: 20, color: AppColors.white),
                    onPressed: () {
                      if (widget.isFromOrderScreen == true) {
                        final int amountOfBonuses =
                            cartProvider.localCart.amountOfBonusRequest;
                        cartProvider.toggleIsBonusRequest(
                            amountOfBonuses, true);
                        profileInfo.updateProfileData(
                            newAmountOfBonuses: amountOfBonuses);
                        // nextScreenReplace(context, const CustomerCartScreen());
                      } else {
                        // nextScreenReplace(context,
                        //     const AppTabs(bottomTab: 2, appBarIndex: 0));
                      }
                    }),
            title: Align(
              alignment: Alignment.topLeft,
              child: Text(
                  (widget.isFromOrderScreen == true)
                      ? "назад до деталей замовлення"
                      : "назад до особистого кабінету",
                  style: const TextStyle(color: AppColors.white, fontSize: 13)),
            ),
          )),
      //
      // BODY NEXT
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            if (widget.isFromOrderScreen == true)
              Column(
                children: [
                  repeatedPartOfWidget,
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const DashedLineDivider(),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text("Загальна сума замовлення",
                                  style: TextStyle(
                                      color: AppColors.kAppPrimaryColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800)),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 30,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: AppColors.grey2.withOpacity(0.5)),
                              child: Text(
                                  widget.totalSum == null
                                      ? "0"
                                      : widget.totalSum!.toString(),
                                  textAlign: TextAlign.center,
                                  style:
                                      const TextStyle(color: AppColors.white)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 35),
                      ],
                    ),
                  )
                ],
              )
            else
              Column(children: [
                repeatedPartOfWidget,
                const SizedBox(height: 35),
              ]),

            // NEXT the Button
            Align(
              alignment: Alignment.center,
              child: CustomButton(
                  width: mQ.width * 0.9,
                  text: (widget.isFromOrderScreen == false)
                      ? "Прийняти зміни"
                      : "Оформити замовлення",
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      if (widget.isFromOrderScreen == false) {
                        //  uploading of admin's picture 2 DB and getting URL
                        //and then updating in DB and AuthProvider
                        await updatingOfUserPicAndDataOnDB(
                            context, profileInfo);
                      } else {
                        // code for finishing of order
                        final DateTime createdAt = DateTime.now();
                        String formattedCreatedAt =
                            DateFormat("yyyy-MM-dd HH:mm").format(createdAt);
                        String documentName =
                            "${formattedCreatedAt}_${profileInfo.userProfileData.userId}";

                        await finishingOfOrder(context, documentName,
                            cartProvider, profileInfo, createdAt);
                      }
                    } else {
                      // showSnackbar(context,
                      //     color: ThisAppColors.darkAmber1,
                      //     content: "заповніть коректно всі поля");
                    }
                  }),
            ),
            const SizedBox(height: 50)
          ],
        ),
      ),
    );
  }

// Used methods are next:
  Future<void> updatingOfUserPicAndDataOnDB(
      BuildContext context, AuthProvider profileInfo) async {
    if (selectedImageOfCustomer != null) {
      String? userPictureURL = await DMMethodsOnDB().uploadImageToStorage(
        selectedFile4DB: selectedImageOfCustomer,
        fileNameOnStorage: profileInfo.userProfileData.userId,
        isProduct: false,
        isCertificate: false,
      );
      await DMMethodsOnDB().updateProfileOrCertificatePictureURLonDB(
        context: context,
        userId: profileInfo.userProfileData.userId,
        newPictureURL: userPictureURL ?? "",
        isProfilePicture: true,
      );
      profileInfo.userProfileData.userImageURL = userPictureURL;
    }

    await profileInfo.saveUserDataToFirebase(false);
    // nextScreenReplace(context, const AppTabs(bottomTab: 2, appBarIndex: 0));
  }

  Future<void> finishingOfOrder(
      BuildContext context,
      String documentName,
      CartsProvider cartProvider,
      AuthProvider profileInfo,
      DateTime createdAt) async {
    cartProvider.setUserDataFromProfileProvider(
      userID: profileInfo.userProfileData.userId,
      customerId: profileInfo.userProfileData.userFullName,
      customerPhone: profileInfo.userProfileData.userPhoneNumberForDelivery,
      location: (profileInfo.userProfileData.userPostOfficeData!.isNotEmpty)
          ? "${profileInfo.userProfileData.userAddress}. ${profileInfo.userProfileData.userPostOfficeData}"
          : "${profileInfo.userProfileData.userAddress}",
      deliveryWay: profileInfo.userProfileData.deliveryWay,
      createdAt: createdAt,
      comments: profileInfo.userProfileData.comments,
    );

    await profileInfo.saveUserDataToFirebase(false);
    // nextScreenReplace(context, const AppTabs(bottomTab: 1, appBarIndex: 0));

    try {
      await FirebaseFirestore.instance
          .collection('Orders')
          .doc(documentName)
          .set(cartProvider.localCart.toMap());
    } catch (e) {
      // showSnackbar(context, content: "Замовлення не оформлено, помилка: $e");
    }

    cartProvider.clearCart();
    await cartProvider.fetchUserOrders(profileInfo.userProfileData.userId);
    await cartProvider.fetchAdminOrders();

    showDialog(
      context: context,
      builder: (context) => StyledAlertDialog(
          backgroundWidget: const CustomerInfo(),
          mappingKey: "customer cart",
          yesButtonText: "Ok",
          noButtonText: "Відміна",
          text4Body:
              "Вашу заявку прийнято, ми зв'яжемося з вами найближчим часом та доставимо Ваше замовлення в найкоротші терміни :)",
          isFromOrderScreen: true,
          totalSum: widget.totalSum),
    );
  }

  // selecting of image method
  Future<void> selectImageOfCustomer() async {
    setState(() {
      isLoading = true;
    });
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage != null) {
        selectedImageOfCustomer = File(pickedImage.path);
      } else {
        return;
      }
    });
    setState(() {
      isLoading = false;
    });
  }

//
  @override
  void initState() {
    super.initState();
    final profileInfo = Provider.of<AuthProvider>(context, listen: false);
    textEditingControllers[0] =
        TextEditingController(text: profileInfo.userProfileData.userFullName);
    textEditingControllers[1] = TextEditingController(
        text: profileInfo.userProfileData.userPhoneNumberForDelivery!);
    textEditingControllers[2] = TextEditingController(
        text: profileInfo.userProfileData.userAddress!.isNotEmpty
            ? profileInfo.userProfileData.userAddress
            : "");
    textEditingControllers[3] = TextEditingController(
        text: profileInfo.userProfileData.comments!.isNotEmpty
            ? profileInfo.userProfileData.comments
            : "відсутні");
    textEditingControllers[4] = TextEditingController(
        text: profileInfo.userProfileData.userAccountName);
    textEditingControllers[5] = TextEditingController(
        text: profileInfo.userProfileData.userPostOfficeData!.isNotEmpty
            ? profileInfo.userProfileData.userPostOfficeData
            : null);
  }

  @override
  void dispose() {
    super.dispose();
    for (var controller in textEditingControllers) {
      controller.dispose();
    }
  }

  //
  //
}
