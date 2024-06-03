//  Models classes

import 'package:intl/intl.dart';

class ProductModel {
  final String id;
  String nameOfProduct;
  String pictureOfProduct;
  int priceOfProduct;
  double quantityLeft;
  bool isMainCategory;
  String shortDescription;
  List<String>? longDescription;
  bool? isDiscount;
  int? discountAmount;
  bool? isDiscountPlus;
  List<bool>? discountsLevel;

  ProductModel({
    required this.id,
    this.nameOfProduct = "",
    this.pictureOfProduct = "",
    this.priceOfProduct = 0,
    this.quantityLeft = 0.0,
    this.isMainCategory = false,
    this.shortDescription = "",
    this.longDescription = const ["", "", "", "", ""],
    this.isDiscount = false,
    this.discountAmount = 0,
    this.isDiscountPlus = false,
    this.discountsLevel = const [false, false, false, false, false],
  });

  // розрахунок акційної ціни
  int get calculatedNewPrice {
    if (isDiscount == true) {
      double discountPercentage = (100 - discountAmount!) / 100;
      int newPrice = (priceOfProduct * discountPercentage).round();
      return newPrice;
    } else {
      return priceOfProduct;
    }
  }

  // Метод для перетворення об'єкту ProductModel на Map<String, dynamic>
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nameOfProduct': nameOfProduct,
      'isMainCategory': isMainCategory,
      'pictureOfProduct': pictureOfProduct,
      'priceOfProduct': priceOfProduct,
      'quantityLeft': quantityLeft,
      'shortDescription': shortDescription,
      'longDescription': longDescription,
      'isDiscount': isDiscount,
      'discountAmount': discountAmount,
      'isDiscountPlus': isDiscountPlus,
      'discountsLevel': discountsLevel,
    };
  }

// Метод для перетворення Map<String, dynamic> об'єкту на ProductModel
  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      nameOfProduct: map['nameOfProduct'] ?? "",
      isMainCategory: map['isMainCategory'] ?? true,
      pictureOfProduct: map['pictureOfProduct'] ?? "",
      priceOfProduct: (map['priceOfProduct']) ?? 5,
      quantityLeft: map['quantityLeft'] ?? 0.0,
      shortDescription: map['shortDescription'] ?? "",
      longDescription: (map['longDescription'] as List<dynamic>?)
              ?.map((item) => item as String)
              .toList() ??
          ["", "", "", "", ""],
      isDiscount: map['isDiscount'] ?? false,
      discountAmount: map['discountAmount'] ?? 0,
      isDiscountPlus: map['isDiscountPlus'] ?? true,
      discountsLevel: (map['discountsLevel'] as List<dynamic>?)
              ?.map((item) => item as bool)
              .toList() ??
          const [false, false, false, false, false],
    );
  }
}

class CartItem {
  static final DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm");
  String id;
  DateTime createdAt;
  String customerId;
  String customerPhone;
  String location;
  String deliveryWay;
  double? totalSum;
  bool isFinished;
  final List<String> itemsList;
  final List<String> itemsId;
  final List<double> itemQuantity;
  final List<int> itemsPrice;
  bool isExpanded;
  int itemCounter;
  bool bonusRequest;
  int amountOfBonusRequest;
  bool isVisible4Admin;
  String comments;

  CartItem({
    required this.id,
    required this.createdAt,
    required this.customerId,
    required this.customerPhone,
    required this.location,
    required this.deliveryWay,
    this.totalSum = 0,
    required this.isFinished,
    required this.itemsList,
    required this.itemsId,
    required this.itemQuantity,
    required this.itemsPrice,
    this.isExpanded = false,
    this.itemCounter = 0,
    this.bonusRequest = false,
    this.amountOfBonusRequest = 0,
    this.isVisible4Admin = true,
    required this.comments,
  });

  Map<String, dynamic> toMap() {
    String formattedCreatedAt = dateFormat.format(createdAt);
    return {
      'id': id,
      'createdAt': formattedCreatedAt,
      'customerId': customerId,
      'customerPhone': customerPhone,
      'location': location,
      'deliveryWay': deliveryWay,
      'totalSum': totalSum,
      'isFinished': isFinished,
      'itemsList': itemsList,
      'itemsId': itemsId,
      'itemQuantity': itemQuantity,
      'itemsPrice': itemsPrice,
      'isExpanded': isExpanded,
      'itemCounter': itemCounter,
      'bonusRequest': bonusRequest,
      'amountOfBonusRequest': amountOfBonusRequest,
      'isVisible4Admin': isVisible4Admin,
      'comments': comments,
    };
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    DateTime createdAt = dateFormat.parse(map['createdAt']);
    return CartItem(
        id: map['id'] ?? '',
        createdAt: createdAt,
        customerId: map['customerId'] ?? '',
        customerPhone: map['customerPhone'] ?? '',
        location: map['location'] ?? '',
        deliveryWay: map['deliveryWay'] ?? '',
        totalSum: map['totalSum'] ?? 0.0,
        isFinished: map['isFinished'] ?? false,
        itemsList: List<String>.from(map['itemsList'] ?? []),
        itemsId: List<String>.from(map['itemsId'] ?? []),
        itemQuantity: List<double>.from(map['itemQuantity'] ?? []),
        itemsPrice: List<int>.from(map['itemsPrice'] ?? []),
        isExpanded: map['isExpanded'] ?? false,
        itemCounter: map['itemCounter'] ?? 0,
        bonusRequest: map['bonusRequest'] ?? false,
        amountOfBonusRequest: map['amountOfBonusRequest'] ?? 0,
        isVisible4Admin: map['isVisible4Admin'] ?? false,
        comments: map['comments'] ?? '');
  }
}

// profile model
class ProfileInfoModel {
  String userId;
  String? phoneNumber;
  String? phone4Delivery;
  String? personalNickName;
  String? personalId;
  String? profilePicture;
  String? town;
  String? deliveryPoint;
  String? wayOfDelivery;
  // if it will be necessary I'll save ordersList to user profile
  // List<CartItem>? ordersList;
  String? comments;
  double? totalSumOfOrders;
  int? amountOfBonuses;

  ProfileInfoModel({
    required this.userId,
    required this.phoneNumber,
    required this.phone4Delivery,
    required this.personalId,
    required this.personalNickName,
    required this.profilePicture,
    required this.town,
    required this.wayOfDelivery,
    required this.deliveryPoint,
    // required this.ordersList,
    required this.comments,
    required this.totalSumOfOrders,
    required this.amountOfBonuses,
  });
  String get deliveryWay {
    return wayOfDelivery ?? "самовивіз";
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'phoneNumber': phoneNumber,
      'phone4Delivery': phone4Delivery,
      'personalId': personalId,
      'personalNickName': personalNickName,
      'profilePicture': profilePicture,
      'town': town,
      'wayOfDelivery': wayOfDelivery,
      'deliveryPoint': deliveryPoint,
      // 'ordersList': ordersList?.map((item) => item.toMap()).toList(),
      'comments': comments,
      'totalSumOfOrders': totalSumOfOrders,
      'amountOfBonuses': amountOfBonuses,
    };
  }

  factory ProfileInfoModel.fromMap(Map<String, dynamic> map) {
    return ProfileInfoModel(
      userId: map['userId'] as String,
      phoneNumber: map['phoneNumber'] as String,
      phone4Delivery: map['phone4Delivery'] as String,
      personalId: map['personalId'] as String?,
      personalNickName: map['personalNickName'] as String?,
      profilePicture: map['profilePicture'] as String?,
      town: map['town'] as String?,
      wayOfDelivery: map['wayOfDelivery'] as String?,
      deliveryPoint: map['deliveryPoint'] as String?,
      // ordersList: (map['ordersList'] as List<dynamic>?)
      //     ?.map((item) => CartItem.fromMap(item))
      //     .toList(),
      comments: map['comments'] as String?,
      totalSumOfOrders: map['totalSumOfOrders'] as double?,
      amountOfBonuses: map['amountOfBonuses'] as int?,
    );
  }
}

class GeneralInfoData {
  String adminsNickName;
  String adminsEmail;
  String adminPicture;
  String adminPhoneNumber;
  String certificateURL;

  GeneralInfoData({
    this.adminsNickName = "",
    this.adminsEmail = "",
    this.adminPicture = "",
    this.adminPhoneNumber = "",
    this.certificateURL = "",
  });

  Map<String, dynamic> toMap() {
    return {
      'adminsNickName': adminsNickName,
      'adminsEmail': adminsEmail,
      'adminPicture': adminPicture,
      'adminPhoneNumber': adminPhoneNumber,
      'certificateURL': certificateURL,
    };
  }

  factory GeneralInfoData.fromMap(Map<String, dynamic> map) {
    return GeneralInfoData(
      adminsNickName: map['adminsNickName'] as String? ?? "",
      adminsEmail: map['adminsEmail'] as String? ?? "",
      adminPicture: map['adminPicture'] as String? ?? "",
      adminPhoneNumber: map['adminPhoneNumber'] as String? ?? "",
      certificateURL: map['certificateURL'] as String? ?? "",
    );
  }
}

class SellerPointsInfo {
  List<String> sellerPointsTowns;
  List<String> sellerPointsStreets;
  SellerPointsInfo(
      {this.sellerPointsTowns = const ["Почаїв", "", "", "", "", ""],
      this.sellerPointsStreets = const ["Лосятинська 11", "", "", "", "", ""]});

  Map<String, dynamic> toMap() {
    return {
      'sellerPointsTowns': sellerPointsTowns,
      'sellerPointsStreets': sellerPointsStreets,
    };
  }

  factory SellerPointsInfo.fromMap(Map<String, dynamic> map) {
    return SellerPointsInfo(
      sellerPointsTowns: List<String>.from(map['sellerPointsTowns'] ?? []),
      sellerPointsStreets: List<String>.from(map['sellerPointsStreets'] ?? []),
    );
  }
}

//
class BonusSystem {
  // rename to cashBackAmount
  final List<double> discountAmount;
  final List<int> spentMoneyLevel;

  BonusSystem({
    required this.discountAmount,
    required this.spentMoneyLevel,
  });
  Map<String, dynamic> toMap() {
    return {
      'discountAmount': discountAmount,
      'spentMoneyLevel': spentMoneyLevel,
    };
  }

  factory BonusSystem.fromMap(Map<String, dynamic> map) {
    return BonusSystem(
      discountAmount: List<double>.from(map['discountAmount']),
      spentMoneyLevel: List<int>.from(map['spentMoneyLevel']),
    );
  }
}
