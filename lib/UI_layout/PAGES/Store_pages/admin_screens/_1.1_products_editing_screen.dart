import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../../State_management/Models/models_for_store/product_model.dart';
import '../../../../State_management/Providers/Providers_for_store/common_data_provider.dart';
import '../../../../State_management/Helpers/For_auth/dm_methods.dart';
import '../../../../State_management/Theme_configuration/app_colors.dart';
import '../../../Components/Buttons/for_shop/custom_button.dart';
import '../../../Components/Dialogs/_general_alert_dialog.dart';
import '../../../Components/Others/dashed_border_container.dart';
import '../../../Components/Text_fields/_my_first_tf.dart';

// ignore_for_file: use_build_context_synchronously
class ProductsEditingScreen extends StatefulWidget {
  final String productId;
  final bool isNewProductItem;

  const ProductsEditingScreen(
      {required this.productId, required this.isNewProductItem, super.key});

  @override
  State<ProductsEditingScreen> createState() => _ProductsEditingScreenState();
}

class _ProductsEditingScreenState extends State<ProductsEditingScreen> {
// vars next
  final formKey1 = GlobalKey<FormState>();
  late CommonDataProvider productsInfo;
  File? selectedImage;
  bool isLoading = false;
//
  List<TextEditingController> textEditingControllers =
      List.generate(9, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    CommonDataProvider productsInfo =
        Provider.of<CommonDataProvider>(context, listen: false);
    final ProductModel editingProduct =
        productsInfo.getProductItemById(widget.productId)!;

    List<int> controllerIndexes = [4, 5, 6, 7, 8];
    List<TextEditingController> listOfControllers = controllerIndexes
        .map((index) => textEditingControllers[index])
        .toList();

// "go back" is not allowed
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          leading: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
              child: Image.asset("assets/logo.png", fit: BoxFit.fill),
            ),
          ),
          title: Text(editingProduct.nameOfProduct,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600)),
          actions: [
            // deleting button
            IconButton(
                onPressed: () => callDeleteAlertDialog(widget.isNewProductItem),
                icon:
                    const Icon(Icons.delete, color: AppColors.kAppPrimaryColor))
          ],
        ),
        // body next
        body: (isLoading == true)
            ? const Center(
                child: CircularProgressIndicator(
                color: AppColors.kAppPrimaryColor,
              ))
            : SingleChildScrollView(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: mediaQuery.size.height * 0.97,
                    width: mediaQuery.size.width * 0.95,
                    child: Form(
                        key: formKey1,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 20),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                      height: mediaQuery.size.height * 0.15,
                                      width: mediaQuery.size.width * 0.3,
                                      child: Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 12.0),
                                          child: DashedBorderContainer(
                                            // picture next
                                            child: InkWell(
                                                onTap: selectImage4Product,
                                                child: (isLoading == true)
                                                    ? const Padding(
                                                        padding: EdgeInsets.all(
                                                            50.0),
                                                        child:
                                                            CircularProgressIndicator(
                                                                color: Colors
                                                                    .amber,
                                                                strokeWidth: 5),
                                                      )
                                                    : (selectedImage != null)
                                                        ? Image.file(
                                                            selectedImage!,
                                                            fit: BoxFit.cover)
                                                        : (editingProduct
                                                                .pictureOfProduct
                                                                .isNotEmpty)
                                                            ? SizedBox(
                                                                child: Image.network(
                                                                    editingProduct
                                                                        .pictureOfProduct,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    width: double
                                                                        .infinity,
                                                                    height: double
                                                                        .infinity))
                                                            : const Icon(
                                                                Icons
                                                                    .add_a_photo,
                                                                color: AppColors
                                                                    .kAppPrimaryColor,
                                                                size: 50,
                                                              )),
                                          ))),
                                  SizedBox(
                                      height: mediaQuery.size.height * 0.19,
                                      width: mediaQuery.size.width * 0.60,
                                      //  need to separate textFields
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          // name of product TextField
                                          StyledTextFormField(
                                              itemId: widget.productId,
                                              controller:
                                                  textEditingControllers[0],
                                              labelText: "назва продукту",
                                              hintText:
                                                  "Введіть назву продукту",
                                              heightOfField: 35,
                                              typeOfField: "String",
                                              keyboardType: TextInputType.text,
                                              maxSymbols: 20,
                                              maxLines: 1,
                                              needValidation: true),
                                          SizedBox(
                                            height:
                                                mediaQuery.size.width * 0.29,
                                            width: mediaQuery.size.width * 0.6,
                                            child: Row(children: [
                                              SizedBox(
                                                height: mediaQuery.size.width *
                                                    0.25,
                                                width:
                                                    mediaQuery.size.width * 0.3,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    // price textField
                                                    StyledTextFormField(
                                                      itemId: widget.productId,
                                                      controller:
                                                          textEditingControllers[
                                                              1],
                                                      labelText: "ціна за 1 л",
                                                      hintText:
                                                          "введіть ціну за 1 л",
                                                      heightOfField: 30,
                                                      typeOfField: "int",
                                                      keyboardType:
                                                          TextInputType.number,
                                                      maxSymbols: 4,
                                                      maxLines: 1,
                                                      needValidation: true,
                                                    ),
                                                    // amountLeftTextfield
                                                    StyledTextFormField(
                                                      itemId: widget.productId,
                                                      controller:
                                                          textEditingControllers[
                                                              2],
                                                      labelText:
                                                          "залишилось, л",
                                                      hintText:
                                                          "вкажіть скільки залишилось, л",
                                                      heightOfField: 30,
                                                      typeOfField: "double",
                                                      keyboardType:
                                                          TextInputType.number,
                                                      maxLines: 1,
                                                      maxSymbols: 5,
                                                      needValidation: true,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              // switcher of category next
                                              Container(
                                                  width: mediaQuery.size.width *
                                                      0.3,
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10,
                                                          top: 15,
                                                          right: 2,
                                                          bottom: 17),
                                                  child: DashedBorderContainer(
                                                    borderWidth: 0.1,
                                                    dashWidth: 1,
                                                    dashSpace: 2,
                                                    child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          const Text(
                                                            "Мед?",
                                                            style: TextStyle(
                                                              color: AppColors
                                                                  .white,
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                          Switch(
                                                              inactiveThumbColor:
                                                                  AppColors
                                                                      .hover,
                                                              activeColor:
                                                                  AppColors
                                                                      .white,
                                                              value: productsInfo
                                                                  .getProductItemById(
                                                                      widget
                                                                          .productId)!
                                                                  .isMainCategory,
                                                              onChanged:
                                                                  (value) {
                                                                setState(() {
                                                                  productsInfo
                                                                      .toggleIsMainCategory4Product(
                                                                          widget
                                                                              .productId,
                                                                          value);
                                                                });
                                                              }),
                                                        ]),
                                                  )),
                                            ]),
                                          ),
                                        ],
                                      )),
                                ]),
                            // short description textField next
                            SizedBox(
                              height: mediaQuery.size.width * 0.2,
                              child: StyledTextFormField(
                                itemId: widget.productId,
                                controller: textEditingControllers[3],
                                labelText: "короткий опис",
                                hintText: "",
                                maxLines: 5,
                                maxSymbols: 500,
                                typeOfField: "String",
                                keyboardType: TextInputType.text,
                                needValidation: true,
                              ),
                            ),
                            SizedBox(
                              height: mediaQuery.size.height * 0.35,
                              width: mediaQuery.size.width * 0.99,
                              child: DashedBorderContainer(
                                dashWidth: 0.01,
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: List.generate(
                                      5,
                                      (index) {
                                        return Container(
                                          margin: const EdgeInsets.all(5),
                                          padding: const EdgeInsets.all(2),
                                          // long description textFields next
                                          child: StyledTextFormField(
                                            itemId: widget.productId,
                                            controller:
                                                listOfControllers[index],
                                            labelText:
                                                "частина ${index + 1} розширеного опису",
                                            hintText: "введіть розширений опис",
                                            maxLines: 5,
                                            maxSymbols: 1000,
                                            typeOfField: "String",
                                            keyboardType: TextInputType.text,
                                            needValidation: (index == 0),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: mediaQuery.size.height * 0.01),
                            TextButton(
                              onPressed: () {
                                // nextScreen(
                                //   context,
                                //   DiscountsSetScreen(
                                //     productsId: widget.productId,
                                //   ),
                                // );
                              },
                              child: const Text(
                                'Застосувати акцію',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                            SizedBox(height: mediaQuery.size.height * 0.03),
                            CustomButton(
                              width: mediaQuery.size.width * 0.8,
                              height: 40,
                              text: "Прийняти зміни",
                              onPressed: () =>
                                  handleOnPressed(context, editingProduct),
                            ),
                            SizedBox(height: mediaQuery.size.height * 0.06),
                          ],
                        )),
                  ),
                ),
              ),
      ),
    );
  }

//
// METHODS NEXT
//
  Future<void> selectImage4Product() async {
    setState(() {
      isLoading = true;
    });
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage != null) {
        selectedImage = File(pickedImage.path);
      } else {
        return;
      }
    });

    setState(() {
      isLoading = false;
    });
  }

  void callDeleteAlertDialog(bool isNewProductItem) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StyledAlertDialog(
          mappingKey: "product's delete",
          productID: widget.productId,
          appBarIndex: productsInfo.getIsMainCategory(widget.productId) ? 0 : 1,
          backgroundWidget: ProductsEditingScreen(
              productId: widget.productId, isNewProductItem: isNewProductItem),
          text4Body:
              "Ви впевнені, що хочете видалити продукт з бази даних безповоротно",
          yesButtonText: "Так, впевнений",
          noButtonText: "Ні, дякую",
          isNewProductItem: isNewProductItem,
        );
      },
    );
  }

  void handleOnPressed(BuildContext context, ProductModel editProduct) async {
    if (formKey1.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      if (widget.isNewProductItem == true) {
        // Перевірка чи обрано картинку
        if (selectedImage != null) {
          String pictureOfProductURL = await DMMethodsOnDB()
                  .uploadImageToStorage(
                      selectedFile4DB: selectedImage!,
                      fileNameOnStorage: widget.productId,
                      isProduct: true,
                      isCertificate: false) ??
              "";

          // Додавання даних продукту в базу даних та в Provider
          productsInfo.updateProductData(widget.productId,
              isDiscount: editProduct.isDiscount!,
              newPictureURL: pictureOfProductURL);
          await DMMethodsOnDB().addProduct2Firebase(context, editProduct, true);
        } else {
          // Показуємо помилку, коли картинка не обрана
          // showSnackbar(context, content: "Картинка не обрана");
          setState(() {
            isLoading = false;
          });
          return;
        }
      } else {
        // Завантаження картинки, якщо вона обрана
        if (selectedImage != null) {
          editProduct.pictureOfProduct = await DMMethodsOnDB()
                  .uploadImageToStorage(
                      selectedFile4DB: selectedImage!,
                      fileNameOnStorage: widget.productId,
                      isProduct: true,
                      isCertificate: false) ??
              "";
        }

        // Оновлення даних продукту в базі даних та в Provider
        productsInfo.updateProductData(widget.productId,
            isDiscount: editProduct.isDiscount!);
        await DMMethodsOnDB()
            .updateProductOnFirebase(context, widget.productId, editProduct);
      }

      setState(() {
        isLoading = false;
      });

      // nextScreenReplace(
      //     context,
      //     AppTabs(
      //         bottomTab: 0, appBarIndex: editProduct.isMainCategory ? 0 : 1));
    } else {
      // showSnackbar(context,
      //     color: Colors.red,
      //     content: "Не всі поля заповнені або заповнені некоректно");
      return;
    }
  }

  @override
  void initState() {
    super.initState();

    productsInfo = Provider.of<CommonDataProvider>(context, listen: false);
    ProductModel? editedProductsItem =
        productsInfo.getProductItemById(widget.productId);

    for (int i = 0; i < 9; i++) {
      textEditingControllers[i] = TextEditingController(
        text: (!widget.isNewProductItem)
            ? (i == 0)
                ? editedProductsItem?.nameOfProduct
                : (i == 1)
                    ? editedProductsItem?.calculatedNewPrice.toString()
                    : (i == 2)
                        ? editedProductsItem?.quantityLeft.toString()
                        : (i == 3)
                            ? editedProductsItem?.shortDescription
                            : editedProductsItem?.longDescription![i - 4]
            : '',
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    for (var controller in textEditingControllers) {
      controller.dispose();
    }
  }

  //
}
