import 'package:flutter/material.dart';
import '../../Models/models_for_store/cart_item_model.dart';
import '../../Src/Helpers/dm_methods.dart';

class CartsProvider with ChangeNotifier {
  CartsProvider(this.context) {
    dbManager = DMMethodsOnDB();
  }
  BuildContext context;
  late DMMethodsOnDB dbManager;

// for STREAM BUILDER
  Stream<List<CartItem>> get adminOrdersStream =>
      dbManager.getAdminOrdersStream();

  //
  // For ADMIN CART
  //
  List<CartItem> _adminOrdersCartList = [];
  List<CartItem> get adminOrdersCartList {
    return [..._adminOrdersCartList];
  }

  int get adminOrdersCartListLength {
    return _adminOrdersCartList.length;
  }

  CartItem? getOrder4AdminById(DateTime createdAt) {
    return _adminOrdersCartList
        .firstWhere((order) => order.createdAt == createdAt);
  }

  bool getIsOrderFinished(DateTime createdAt) {
    CartItem? chosenOrder = getOrder4AdminById(createdAt);
    return chosenOrder?.isFinished ?? false;
  }

  void toggleAdminOrderIsFinished(
      DateTime createdAt, bool isAdminOrderIsFinished) {
    CartItem? chosenOrder = getOrder4AdminById(createdAt);
    if (chosenOrder != null) {
      chosenOrder.isFinished = isAdminOrderIsFinished;
      notifyListeners();
    }
  }

  Future<void> fetchAdminOrders() async {
    _adminOrdersCartList = await DMMethodsOnDB().fetchAdminOrders();
    notifyListeners();
  }

//
  // NEXT is everything, that connected with USER LOCAL CART
//
  List<CartItem> _userOrdersCartList = [];
  List<CartItem> get userOrdersCartList {
    return [..._userOrdersCartList];
  }

  CartItem get localCart {
    return _localCart;
  }

// clean cart, when there no products in it
  final _localCart = CartItem(
    id: "",
    customerId: "",
    customerPhone: "",
    location: "",
    deliveryWay: "",
    totalSum: 0,
    isFinished: false,
    itemsList: [],
    itemsId: [],
    itemQuantity: [],
    itemsPrice: [],
    itemCounter: 0,
    bonusRequest: false,
    amountOfBonusRequest: 0,
    isVisible4Admin: true,
    createdAt: DateTime(2023),
    comments: "",
  );

  void plusButtonAction(
      String productId,
      String? productName,
      int? productPrice,
      bool? isNotFromCart,
      double quantityOfProductLeft,
      BuildContext context) {
    int index = getItemIndexInCart(productId);
    if (index == -1) {
      index =
          addItemToCartAndGetNewIndex(productId, productName!, productPrice!);
    }
    plus_05(
        getCurrentItemQuantity(index)!, index, quantityOfProductLeft, context);
    setProductDataToCartItem(index, productName!, productPrice!);
    calculateTotalAmount();
    notifyListeners();
  }

  void minusButtonAction(
      String productId, bool calledNotFromCart, bool isNeedToDelete) async {
    int index = getItemIndexInCart(productId);
    if (index == -1) {
      return;
    } else {
      if (isNeedToDelete == false) {
        minus_05(getCurrentItemQuantity(index)!, index);
        calculateTotalAmount();
        notifyListeners();
      } else {
        _localCart.totalSum =
            _localCart.totalSum! - _localCart.itemsPrice[index] * 0.5;
        removeItemFromCart(index);
        notifyListeners();
      }
    }
  }

  CartItem? getOrderItemById4Admin(DateTime createdAt) {
    return _adminOrdersCartList
        .firstWhere((item) => item.createdAt == createdAt);
  }

  int getItemIndexInCart(String productId) {
    final index = _localCart.itemsId.indexWhere((item) => item == productId);
    return index;
  }

  void plus_05(double quantityOfProduct, int index, double amountOfProduct,
      BuildContext context) {
    if (quantityOfProduct + 0.5 <= amountOfProduct) {
      quantityOfProduct += 0.5;
      _localCart.itemQuantity[index] = quantityOfProduct;
    } else {
      // showSnackbar(context, content: "більше одиниць товару недоступно");
    }
  }

  void minus_05(double quantityOfProduct, int? index) {
    if (quantityOfProduct > 0) {
      quantityOfProduct -= 0.5;
    }
    _localCart.itemQuantity[index!] = quantityOfProduct;
  }

  List<double> get itemQuantityList {
    return _localCart.itemQuantity;
  }

  double? getCurrentItemQuantity(int index) {
    if (index == 0) {
      return itemQuantityList[0];
    } else {
      return itemQuantityList[index];
    }
  }

  int addItemToCartAndGetNewIndex(
      String productId, String productName, int productPrice) {
    _localCart.itemsId.add(productId);
    _localCart.itemQuantity.add(0.0);
    _localCart.itemsList.add(productName);
    _localCart.itemsPrice.add(productPrice);
    int newIndex = _localCart.itemsId.length - 1;
    int newItemCounter = _localCart.itemCounter + 1;
    _localCart.itemCounter = newItemCounter;
    return newIndex;
  }

  void removeItemFromCart(int index) {
    _localCart.itemsId.removeAt(index);
    _localCart.itemQuantity.removeAt(index);
    _localCart.itemsList.removeAt(index);
    _localCart.itemsPrice.removeAt(index);
    int newItemCounter =
        (_localCart.itemCounter != 0) ? _localCart.itemCounter - 1 : 0;
    _localCart.itemCounter = newItemCounter;
    notifyListeners();
  }

  void setProductDataToCartItem(int index, String productName, int itemPrice) {
    if (index >= 0 &&
        index < _localCart.itemsList.length &&
        index < _localCart.itemsPrice.length) {
      _localCart.itemsList[index] = productName;
      _localCart.itemsPrice[index] = itemPrice;
      notifyListeners();
    }
  }

  void resetItemQuantity(int index) {
    _localCart.itemQuantity[index] = 0.0;
  }

  void clearCart() {
    _localCart.itemsList.clear();
    _localCart.itemsId.clear();
    _localCart.itemQuantity.clear();
    _localCart.itemsPrice.clear();
    _localCart.itemCounter = 0;
    _localCart.bonusRequest = false;
    _localCart.amountOfBonusRequest = 0;
    notifyListeners();
  }

  void calculateTotalAmount() {
    double totalAmount = 0;
    for (int i = 0; i < _localCart.itemQuantity.length; i++) {
      double quantity = _localCart.itemQuantity[i];
      int price = _localCart.itemsPrice[i];
      totalAmount += quantity * price;
    }
    _localCart.totalSum = totalAmount;
    notifyListeners();
  }

  void toggleIsBonusRequest(
      int availableBonuses, bool? isFromOrderShippingScreen) {
    if (isFromOrderShippingScreen == true) {
      _localCart.bonusRequest = false;
      _localCart.amountOfBonusRequest = 0;
      _localCart.totalSum = _localCart.totalSum! + 2 * availableBonuses;
    }
    if (_localCart.bonusRequest == false) {
      _localCart.amountOfBonusRequest = availableBonuses;
      _localCart.totalSum = _localCart.totalSum! - availableBonuses;
    } else {
      _localCart.totalSum =
          _localCart.totalSum! + _localCart.amountOfBonusRequest;
      _localCart.amountOfBonusRequest = 0;
    }

    if (isFromOrderShippingScreen == null) {
      _localCart.bonusRequest = !_localCart.bonusRequest;
    }
    notifyListeners();
  }

  void setUserDataFromProfileProvider(
      {String? userID,
      String? customerId,
      String? customerPhone,
      String? location,
      String? deliveryWay,
      DateTime? createdAt,
      String? comments}) {
    if (userID != null) {
      _localCart.id = userID;
    }
    if (customerId != null) {
      _localCart.customerId = customerId;
    }
    if (customerPhone != null) {
      _localCart.customerPhone = customerPhone;
    }
    if (location != null) {
      _localCart.location = location;
    }
    if (deliveryWay != null) {
      _localCart.deliveryWay = deliveryWay;
    }
    if (createdAt != null) {
      _localCart.createdAt = createdAt;
    }
    if (comments != null) {
      _localCart.comments = comments;
    }
    notifyListeners();
  }

  //
  //
// methods for managing and FETCHING of USER ORDERS
  Future<void> fetchUserOrders(String userId) async {
    _userOrdersCartList = await DMMethodsOnDB().fetchUserOrders(userId);
    notifyListeners();
  }

  void resetIsExpandedInUserCartList() {
    for (var order in _userOrdersCartList) {
      order.isExpanded = false;
    }
    notifyListeners();
  }

  void inChosenOrderSetIsExpandedTrue(DateTime createdAt) {
    for (var order in _userOrdersCartList) {
      if (order.createdAt == createdAt) {
        order.isExpanded = true;
      }
    }
    notifyListeners();
  }
  //
  //
}
