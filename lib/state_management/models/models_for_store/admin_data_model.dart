class AdminDataModel {
  String adminName;
  String adminEmail;
  String adminImageURL;
  String adminPhoneNumber;
  String certificateURL;
  String aboutStore;
  List<Map<String, dynamic>> sellerPoints;
  // final List<SellerPointsInfo> sellerPoints;

  AdminDataModel({
    required this.adminPhoneNumber,
    required this.adminName,
    required this.adminEmail,
    required this.adminImageURL,
    required this.certificateURL,
    required this.aboutStore,
    required this.sellerPoints,
  });

  Map<String, dynamic> toMap() {
    return {
      'adminPhoneNumber': adminPhoneNumber,
      'adminName': adminName,
      'adminEmail': adminEmail,
      'adminImageURL': adminImageURL,
      'certificateURL': certificateURL,
      'aboutStore': aboutStore,
      'salePoints': sellerPoints,
    };
  }

  factory AdminDataModel.fromMap(Map<String, dynamic> map) {
    final List<Map<String, dynamic>> salePointsList =
        List<Map<String, dynamic>>.from(map['salePoints'] ?? []);
    return AdminDataModel(
      adminPhoneNumber: map['adminPhoneNumber'] ?? '',
      adminName: map['adminName'] ?? '',
      adminEmail: map['adminEmail'] ?? '',
      adminImageURL: map['adminImageURL'] ?? '',
      certificateURL: map['certificateURL'] ?? '',
      aboutStore: map['aboutStore'] ?? '',
      sellerPoints: salePointsList,
    );
  }

  AdminDataModel.initial()
      : adminPhoneNumber = '',
        adminName = '',
        adminEmail = '',
        adminImageURL = '',
        certificateURL = '',
        aboutStore = '',
        sellerPoints = [];
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
