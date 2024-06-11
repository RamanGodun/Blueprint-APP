import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:country_picker/country_picker.dart';
import '../../../../State_management/Providers/Providers_for_store/common_data_provider.dart';
import '../../../../State_management/Theme_configuration/app_colors.dart';
import '../../Mini_widgets/for_shop/check_box.dart';

class StyledTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final IconData? icon;
  final double borderRadius;
  final double borderWidth;
  final InputDecoration? inputDecoration;
  final double? heightOfField;
  final double? widthOfField;
  final TextInputType? keyboardType;
  final double? textFontSize;
  final int? index;
  final String typeOfField;
  final int? maxLines;
  final int? maxSymbols;
  final String? itemId;
  final bool? needValidation;
  final TextAlign? textAlign;
  final EdgeInsetsGeometry? textPadding;
  final bool isNeedSuffixIcon;
  final int suffixLength;
  final bool isNeedPrefixIcon;
  final TextStyle? textStyle;

  const StyledTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    this.icon = Icons.edit,
    this.borderRadius = 10.0,
    this.borderWidth = 1.0,
    this.inputDecoration,
    this.heightOfField,
    this.widthOfField,
    this.keyboardType,
    this.textFontSize,
    this.index,
    required this.typeOfField,
    this.maxLines,
    this.maxSymbols = 20,
    this.itemId,
    this.needValidation,
    this.textAlign,
    this.textPadding,
    this.isNeedSuffixIcon = false,
    this.suffixLength = 3,
    this.isNeedPrefixIcon = false,
    this.textStyle = const TextStyle(
      fontSize: 15,
      color: AppColors.white,
      fontWeight: FontWeight.w700,
    ),
  });

  @override
  State<StyledTextFormField> createState() => _StyledTextFormFieldState();
}

class _StyledTextFormFieldState extends State<StyledTextFormField> {
  late Map<String, Function> mapping4OnSubmit;
  final _dummyFocusNode = FocusNode();

  //
  @override
  Widget build(BuildContext context) {
    // to pop up, when click outside
    return Listener(
      onPointerDown: (_) => _handleTapOutside(),
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: widget.heightOfField,
          width: widget.widthOfField,
          //
          child: TextFormField(
            controller: widget.controller,
            focusNode: _dummyFocusNode,
            textAlign: (widget.textAlign != null)
                ? widget.textAlign!
                : TextAlign.center,
            keyboardType: widget.keyboardType,
            //
            onChanged: (val1) {
              setState(() {
                onSubmitMethod(widget.labelText, mapping4OnSubmit, val1);
              });
            },
            //
            onFieldSubmitted: (val) {
              setState(() {
                onSubmitMethod(widget.labelText, mapping4OnSubmit, val);
              });
            },
            // use custom validator
            validator: customValidator,
            //
            maxLines: (widget.maxLines != null) ? widget.maxLines : 1,
            maxLength: widget.maxSymbols,
            //
            style:
                widget.textStyle!.copyWith(fontSize: widget.textFontSize ?? 15),
            cursorColor: AppColors.kAppPrimaryColor.withOpacity(0.5),
            decoration: InputDecoration(
              suffixIcon: (widget.isNeedSuffixIcon == true)
                  ? (widget.controller.text.length > widget.suffixLength
                      ? const CheckboxWidget(isImmutable: true)
                      : null)
                  : null,
              prefixIcon: (widget.isNeedPrefixIcon == true)
                  ? Container(
                      padding: const EdgeInsets.only(
                          left: 5.00, top: 7.00, right: 5.00, bottom: 5.00),
                      child: InkWell(
                        onTap: () {
                          showCountryPicker(
                              context: context,
                              countryListTheme: CountryListThemeData(
                                backgroundColor: Theme.of(context).focusColor,
                                bottomSheetHeight: 450,
                              ),
                              onSelect: (value) {
                                setState(() {
                                  selectedCountry = value;
                                });
                              });
                        },
                        child: Text(
                            "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                            style: TextStyle(
                                fontSize: 18,
                                color: Theme.of(context).focusColor,
                                fontWeight: FontWeight.bold)),
                      ),
                    )
                  : null,
              labelText: widget.labelText,
              counterText: '',
              contentPadding: widget.textPadding ??
                  const EdgeInsets.symmetric(vertical: 7, horizontal: 0.3),
              labelStyle: const TextStyle(
                  decorationStyle: TextDecorationStyle.solid,
                  // textBaseline: TextBaseline.ideographic,
                  fontSize: 12,
                  color: AppColors.white,
                  overflow: TextOverflow.ellipsis),
              hintText: widget.hintText,
              hintStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white),
              errorStyle: const TextStyle(
                  debugLabel: "", overflow: TextOverflow.fade, fontSize: 0),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: AppColors.white, width: widget.borderWidth),
                borderRadius:
                    BorderRadius.all(Radius.circular(widget.borderRadius)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: AppColors.kAppPrimaryColor,
                    width: widget.borderWidth),
                borderRadius:
                    BorderRadius.all(Radius.circular(widget.borderRadius)),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: AppColors.kAppPrimaryColor,
                    width: widget.borderWidth),
                borderRadius:
                    BorderRadius.all(Radius.circular(widget.borderRadius)),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.red, width: widget.borderWidth),
                borderRadius:
                    BorderRadius.all(Radius.circular(widget.borderRadius)),
              ),
            ),
          ),
        ),
      ),
    );
  }

// method checks containing of label with keys of mapping and then performs method, that I need
  void onSubmitMethod(String inputString,
      Map<String, Function> mapping4OnSubmit, String submittedText) {
    if (mapping4OnSubmit.containsKey(inputString)) {
      mapping4OnSubmit[inputString]!(submittedText);
    }
  }

// validation should be improved (!)
  String? customValidator(String? value) {
    if (widget.needValidation == true) {
      if (value != null) {
        if (widget.typeOfField == "String") {
          return validateText(value);
        } else if (widget.typeOfField == "int") {
          return validateDigits(value);
        } else {
          if (widget.typeOfField == "double") {
            return validateDouble(value);
          } else {
            //
          }
        }
      }
    }
    return null;
  }

  String? validateText(String? value) {
    if (value == null || value.isEmpty) {
      return 'Це поле не може бути пустим';
    }
    return null;
  }

  String? validateDigits(String? value) {
    if (value == null || value.isEmpty) {
      return 'Це поле не може бути пустим';
    }
    if (value == "0" || value == "0.0") {
      return "Не має бути рівним 0";
    }
    final isDigitsOnly = RegExp(r'^\d+$').hasMatch(value);
    if (!isDigitsOnly) {
      return 'Введіть лише цифри';
    }

    return null;
  }

  String? validateDouble(String? value) {
    if (value == null || value.isEmpty) {
      return 'Це поле не може бути пустим';
    }

    if (value == "0.0") {
      return "Не має бути рівним 0";
    }

    final double? number = double.tryParse(value);
    if (number == null) {
      return 'Введіть лише цифри';
    }

    return null;
  }

  //
  @override
  void initState() {
    super.initState();
    final CommonDataProvider productsInfo =
        Provider.of<CommonDataProvider>(context, listen: false);
    // final profileProvider = Provider.of<AuthProvider>(context, listen: false);

    mapping4OnSubmit = {
      "поріг витрат, грн": (val) {
        if (val.isNotEmpty) {
          productsInfo.updateSpentMoneyLevel(int.parse(val), widget.index);
        }
      },
      "скидка, %": (val) {
        if (val.isNotEmpty) {
          productsInfo.updateDiscountAmount(double.parse(val), widget.index);
        }
      },
      "назва продукту": (val) {
        productsInfo.updateProductData(widget.itemId!, newName: val!);
      },
      "ціна за 1 л": (val) {
        productsInfo.updateProductData(widget.itemId!, newPrice: val!);
      },
      "залишилось, л": (val) {
        productsInfo.updateProductData(widget.itemId!, newAmountLeft: val!);
      },
      "короткий опис": (val) {
        productsInfo.updateProductData(widget.itemId!,
            newShortDescription: val!);
      },
      "частина 1 розширеного опису": (val) {
        productsInfo.updateProductData(widget.itemId!,
            index: 0, newLongDescription: val!);
      },
      "частина 2 розширеного опису": (val) {
        productsInfo.updateProductData(widget.itemId!,
            index: 1, newLongDescription: val!);
      },
      "частина 3 розширеного опису": (val) {
        productsInfo.updateProductData(widget.itemId!,
            index: 2, newLongDescription: val!);
      },
      "частина 4 розширеного опису": (val) {
        productsInfo.updateProductData(widget.itemId!,
            index: 3, newLongDescription: val!);
      },
      "частина 5 розширеного опису": (val) {
        productsInfo.updateProductData(widget.itemId!,
            index: 4, newLongDescription: val!);
      },
      "ПІБ:": (val) {
        // profileProvider.updateProfileData(newPersonalId: val);
      },
      "телефон:": (val) {
        // profileProvider.updateProfileData(newPhoneNumber: val);
      },
      "ваше місто:": (val) {
        // profileProvider.updateProfileData(newTown: val);
      },
      "обрати відділення:": (val) {
        // profileProvider.updateProfileData(newDeliveryPoint: val);
      },
      "коментарі:": (val) {
        // profileProvider.updateProfileData(newComments: val);
      },
      "назва аккаунту:": (val) {
        // profileProvider.updateProfileData(newPersonalNickName: val);
      },
      "електронна адреса:": (val) {
        productsInfo.updateGeneralInfoDataInProvider(newAdminsEmail: val);
      },
      "нас. пункт №1:": (val) {
        productsInfo.setSellerLocation(val, 0);
      },
      "нас. пункт №2:": (val) {
        productsInfo.setSellerLocation(val, 1);
      },
      "нас. пункт №3:": (val) {
        productsInfo.setSellerLocation(val, 2);
      },
      "нас. пункт №4:": (val) {
        productsInfo.setSellerLocation(val, 3);
      },
      "нас. пункт №5:": (val) {
        productsInfo.setSellerLocation(val, 4);
      },
      "нас. пункт №6:": (val) {
        productsInfo.setSellerLocation(val, 5);
      },
      "адреса локації № 1:": (val) {
        productsInfo.setSellerAddress(val, 0);
      },
      "адреса локації № 2:": (val) {
        productsInfo.setSellerAddress(val, 1);
      },
      "адреса локації № 3:": (val) {
        productsInfo.setSellerAddress(val, 2);
      },
      "адреса локації № 4:": (val) {
        productsInfo.setSellerAddress(val, 3);
      },
      "адреса локації № 5:": (val) {
        productsInfo.setSellerAddress(val, 4);
      },
      "адреса локації № 6:": (val) {
        productsInfo.setSellerAddress(val, 5);
      },
    };
  }

  void _handleTapOutside() {
    if (_dummyFocusNode.hasFocus) {
      _dummyFocusNode.unfocus();
    }
  }

  @override
  void dispose() {
    _dummyFocusNode.dispose();
    super.dispose();
  }

//
  Country selectedCountry = Country(
    phoneCode: "38",
    countryCode: "UA",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "Ukraine",
    example: "Ukraine",
    displayName: "Ukraine",
    displayNameNoCountryCode: "UA",
    e164Key: "",
  );
  //
}
