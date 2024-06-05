class UserDataModel {
  String userId;
  String? userPhoneNumber;
  String? userPhoneNumberForDelivery;
  String? userAccountName;
  String? userFullName;
  String? userImageURL;
  String? userAddress;
  String? userPostOfficeData;
  String? userSelectedWayOfDelivery;
  // if it will be necessary I'll save ordersList to user profile
  // List<CartItem>? ordersList;
  String? comments;
  double? usersSumOfAllOrders;
  int? userBonuses;

  UserDataModel({
    required this.userId,
    required this.userPhoneNumber,
    required this.userPhoneNumberForDelivery,
    required this.userFullName,
    required this.userAccountName,
    required this.userImageURL,
    required this.userAddress,
    required this.userSelectedWayOfDelivery,
    required this.userPostOfficeData,
    // required this.ordersList,
    required this.comments,
    required this.usersSumOfAllOrders,
    required this.userBonuses,
  });
  String get deliveryWay {
    return userSelectedWayOfDelivery ?? "самовивіз";
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'phoneNumber': userPhoneNumber,
      'phone4Delivery': userPhoneNumberForDelivery,
      'personalId': userFullName,
      'personalNickName': userAccountName,
      'profilePicture': userImageURL,
      'town': userAddress,
      'wayOfDelivery': userSelectedWayOfDelivery,
      'deliveryPoint': userPostOfficeData,
      // 'ordersList': ordersList?.map((item) => item.toMap()).toList(),
      'comments': comments,
      'totalSumOfOrders': usersSumOfAllOrders,
      'amountOfBonuses': userBonuses,
    };
  }

  factory UserDataModel.fromMap(Map<String, dynamic> map) {
    return UserDataModel(
      userId: map['userId'] as String,
      userPhoneNumber: map['phoneNumber'] as String,
      userPhoneNumberForDelivery: map['phone4Delivery'] as String,
      userFullName: map['personalId'] as String?,
      userAccountName: map['personalNickName'] as String?,
      userImageURL: map['profilePicture'] as String?,
      userAddress: map['town'] as String?,
      userSelectedWayOfDelivery: map['wayOfDelivery'] as String?,
      userPostOfficeData: map['deliveryPoint'] as String?,
      // ordersList: (map['ordersList'] as List<dynamic>?)
      //     ?.map((item) => CartItem.fromMap(item))
      //     .toList(),
      comments: map['comments'] as String?,
      usersSumOfAllOrders: map['totalSumOfOrders'] as double?,
      userBonuses: map['amountOfBonuses'] as int?,
    );
  }
}
