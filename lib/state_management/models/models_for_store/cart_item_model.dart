import 'package:intl/intl.dart';

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
