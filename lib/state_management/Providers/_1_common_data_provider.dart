import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../Models/_0_models.dart';
import '../Models/models_for_store/cashback_model.dart';
import '../Models/models_for_store/product_model.dart';
import '../Src/Helpers/dm_methods.dart';

class CommonDataProvider with ChangeNotifier {
  CommonDataProvider();
  bool _isLoading = false;
  bool get isLoading => _isLoading;

//
  //  PRODUCTS MANAGING
//
  List<ProductModel> _productsList = [];
  List<ProductModel> get productsList => [..._productsList];

// PRODUCTS FETCHING from DB
  Future<void> fetchProductsFromFirestore() async {
    _isLoading = true;
    notifyListeners();
    _productsList = await DMMethodsOnDB().fetchProductsFromFirestore();
    // _productsList = await DMMethodsOnDB()
    //     .fetchDataFromFirestore<ProductModel>('Products/', 'ваш_запит');
    _isLoading = false;
    notifyListeners();
  }

// ADDING/REMOVING of PRODUCT
  void addProductItem(ProductModel productsInfo) {
    _productsList.add(productsInfo);
    notifyListeners();
  }

  void removeProductItem(String productId) {
    _productsList.removeWhere((products) => products.id == productId);
    notifyListeners();
  }

// FINDING of PRODUCT by ID and getting count
  ProductModel? getProductItemById(String productId) {
    try {
      return _productsList.firstWhere((item) => item.id == productId);
    } catch (e) {
      return null;
    }
  }

  int get productsCount {
    return _productsList.length;
  }

// SETTING of PRODUCT parameters
  void updateProductData(String productId,
      {String? newName,
      String? newPrice,
      String? newAmountLeft,
      String? newShortDescription,
      int? index,
      String? newLongDescription,
      bool isDiscount = false,
      String? newPictureURL}) {
    final ProductModel? editedProductItem = getProductItemById(productId);

    if (editedProductItem == null) {
      return;
    } else {
      // Оновити поля товару, якщо є значення
      editedProductItem.nameOfProduct =
          newName ?? editedProductItem.nameOfProduct;
      editedProductItem.priceOfProduct =
          int.parse(newPrice ?? '${editedProductItem.priceOfProduct}').toInt();
      editedProductItem.quantityLeft =
          double.parse(newAmountLeft ?? '${editedProductItem.quantityLeft}')
              .toDouble();
      editedProductItem.isDiscount = isDiscount;
      editedProductItem.shortDescription =
          newShortDescription ?? editedProductItem.shortDescription;
      editedProductItem.isDiscount = isDiscount;

      if (newLongDescription != null && index != null) {
        if (editedProductItem.longDescription != null &&
            index >= 0 &&
            index < editedProductItem.longDescription!.length) {
          editedProductItem.longDescription![index] = newLongDescription;
        }
      }

      editedProductItem.pictureOfProduct =
          newPictureURL ?? editedProductItem.pictureOfProduct;
      notifyListeners();
    }
  }

  // GETTING LIST of PRODUCTS from MAIN/non-main CATEGORY
  List<ProductModel> getMainCategoryProductsList() {
    return _productsList.where((products) => products.isMainCategory).toList();
  }

  List<ProductModel> getNonMainCategoryProductsList() {
    return _productsList.where((products) => !products.isMainCategory).toList();
  }

// actions with "isMainCategory" parameter of PRODUCT
  bool getIsMainCategory(String productId) {
    ProductModel? productItem = getProductItemById(productId);
    return productItem?.isMainCategory ?? false;
  }

  void toggleIsMainCategory4Product(
      String productId, bool isMainCategory4Product) {
    ProductModel? productItem = getProductItemById(productId);
    if (productItem != null) {
      productItem.isMainCategory = isMainCategory4Product;
      notifyListeners();
    }
  }

  // actions with "IsDISCOUNT" parameter of PRODUCT
  bool getIsDiscount4Product(String productId) {
    ProductModel? productItem = getProductItemById(productId);
    return productItem?.isDiscount ?? false;
  }

  void toggleIsDiscount4Product(String productId, bool isDiscount4Product) {
    ProductModel? productItem = getProductItemById(productId);
    if (productItem != null) {
      productItem.isDiscountPlus = isDiscount4Product;
      notifyListeners();
    }
  }

  void resetDiscounts4Item(String forDiscountID) {
    ProductModel? productItem = getProductItemById(forDiscountID);
    if (productItem != null) {
      for (int index = 0; index < productItem.discountsLevel!.length; index++) {
        productItem.discountsLevel![index] = false;
      }
      productItem.discountAmount = 0;
      productItem.isDiscount = false;
      notifyListeners();
    }
  }

  //
  // GENERAL DATA MANAGING
  //
  AdminDataModel? _generalInfoData;
  AdminDataModel get generalInfoData {
    return _generalInfoData ?? newGeneralInfoDatModel();
  }

  AdminDataModel newGeneralInfoDatModel() {
    return AdminDataModel(
      adminImageURL: "",
      certificateURL: "",
      adminEmail: "",
      adminPhoneNumber: "",
      adminName: "",
      aboutStore: "",
      sellerPoints: [],
    );
  }

  void updateGeneralInfoDataInProvider(
      {String? newAdminsNickName,
      String? newAdminPicture,
      String? newAdminsEmail,
      String? newAdminPhoneNumber,
      String? newCertificateURL}) {
    _isLoading = true;
    notifyListeners();
    if (_generalInfoData != null) {
      if (newAdminsNickName != null) {
        _generalInfoData!.adminName = newAdminsNickName;
      }
      if (newAdminPicture != null) {
        _generalInfoData!.adminImageURL = newAdminPicture;
      }
      if (newAdminsEmail != null) {
        _generalInfoData!.adminEmail = newAdminsEmail;
      }
      if (newAdminPhoneNumber != null) {
        _generalInfoData!.adminPhoneNumber = newAdminPhoneNumber;
      }
      if (newCertificateURL != null) {
        _generalInfoData!.certificateURL = newCertificateURL;
      }
      // print(generalInfoData.toMap());
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> saveGeneralDataToFirebase() async {
    _isLoading = true;
    notifyListeners();
    await DMMethodsOnDB().saveGeneralDataToFirebase(generalInfoData);
    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchGeneralDataFromFirestore() async {
    _isLoading = true;
    notifyListeners();
    final fetchedGeneralDataFromFirestore =
        await DMMethodsOnDB().fetchGeneralDataFromFirestore();

    if (fetchedGeneralDataFromFirestore != null) {
      _generalInfoData = fetchedGeneralDataFromFirestore;
      _isLoading = false;
      notifyListeners();
    } else {
      // print("General data are not fetched");
      _isLoading = false;
      notifyListeners();
    }
  }

//
// SELLER LOCATIONS MANAGING
//
  SellerPointsInfo sellerPointsInfo = SellerPointsInfo();
  List<String> get filteredTowns => sellerPointsInfo.sellerPointsTowns
      .where((town) => town.isNotEmpty)
      .toList();

  List<String> get filteredStreets => sellerPointsInfo.sellerPointsStreets
      .where((street) => street.isNotEmpty)
      .toList();

  void setSellerLocation(String newCityOfSellerPoint, int index) {
    var temporaryList = List<String>.from(sellerPointsInfo.sellerPointsTowns);
    temporaryList[index] = newCityOfSellerPoint;
    sellerPointsInfo.sellerPointsTowns = temporaryList;
    notifyListeners();
  }

  void setSellerAddress(String newAddressOfSellerPoint, int index) {
    var temporaryList = List<String>.from(sellerPointsInfo.sellerPointsStreets);
    temporaryList[index] = newAddressOfSellerPoint;
    sellerPointsInfo.sellerPointsStreets = temporaryList;
    notifyListeners();
  }

  Future<void> fetchSellerPointsInfoFromFirestore() async {
    _isLoading = true;
    notifyListeners();
    final fetchedSellerPointsInfo =
        await DMMethodsOnDB().fetchSellerPointsInfoFromFirestore();

    if (fetchedSellerPointsInfo != null) {
      sellerPointsInfo = fetchedSellerPointsInfo;
      _isLoading = false;
      notifyListeners();
    } else {
      // print("Data of Seller's Points are not fetched");
      _isLoading = false;
      notifyListeners();
    }
  }

  //
  // BONUS SYSTEM MANAGING
//
  BonusSystem _bonusSystem = BonusSystem(
    discountAmount: [0, 0, 0, 0],
    spentMoneyLevel: [0, 0, 0, 0],
  );
  BonusSystem get bonusSystem {
    return _bonusSystem;
  }

  void updateBonusSystem(BonusSystem newBonusSystem) {
    _bonusSystem = newBonusSystem;
    notifyListeners();
  }

  void updateDiscountAmount(double newDiscountAmount, int? index) {
    if (index != null) {
      _bonusSystem.discountAmount[index] = newDiscountAmount;
      notifyListeners();
    }
  }

  void updateSpentMoneyLevel(int newSpentMoneyLevel, int? index) {
    if (index != null) {
      _bonusSystem.spentMoneyLevel[index] = newSpentMoneyLevel;
      notifyListeners();
    }
  }

  double findCashbackPercentageAmount(double inputAmount) {
    for (int i = _bonusSystem.spentMoneyLevel.length - 1; i >= 0; i--) {
      if (inputAmount >= _bonusSystem.spentMoneyLevel[i]) {
        double foundedDiscountAmount = _bonusSystem.discountAmount[i];
        // print("Знижка для $inputAmount: $foundedDiscountAmount%");
        return foundedDiscountAmount;
      }
    }
    // print("Немає відповідної знижки для $inputAmount");
    return 0;
  }

  Future<void> fetchBonusSystemFromFirestore() async {
    _isLoading = true;
    notifyListeners();
    final fetchedBonusSystemFromFirestore =
        await DMMethodsOnDB().fetchBonusSystemFromFirestore();

    if (fetchedBonusSystemFromFirestore != null) {
      _bonusSystem = fetchedBonusSystemFromFirestore;
      _isLoading = false;
      notifyListeners();
    } else {
      // print("Data of Seller's Points are not fetched");
      _isLoading = false;
      notifyListeners();
    }
  }

  //
  //
}
