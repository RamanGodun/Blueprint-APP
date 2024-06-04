class AdminDataModel1 {
  final String adminPhoneNumber;
  final String adminName;
  final String adminEmail;
  final String adminImageURL;
  final String certificateURL;
  final String aboutStore;
  final List<Map<String, dynamic>> salePoints;

  AdminDataModel1({
    required this.adminPhoneNumber,
    required this.adminName,
    required this.adminEmail,
    required this.adminImageURL,
    required this.certificateURL,
    required this.aboutStore,
    required this.salePoints,
  });

  factory AdminDataModel1.fromMap(Map<String, dynamic> map) {
    final List<Map<String, dynamic>> salePointsList =
        List<Map<String, dynamic>>.from(map['salePoints'] ?? []);

    return AdminDataModel1(
      adminPhoneNumber: map['adminPhoneNumber'] ?? '',
      adminName: map['adminName'] ?? '',
      adminEmail: map['adminEmail'] ?? '',
      adminImageURL: map['adminImageURL'] ?? '',
      certificateURL: map['certificateURL'] ?? '',
      aboutStore: map['aboutStore'] ?? '',
      salePoints: salePointsList,
    );
  }

  AdminDataModel1.initial()
      : adminPhoneNumber = '',
        adminName = '',
        adminEmail = '',
        adminImageURL = '',
        certificateURL = '',
        aboutStore = '',
        salePoints = [];

  Map<String, dynamic> toMap() {
    return {
      'adminPhoneNumber': adminPhoneNumber,
      'adminName': adminName,
      'adminEmail': adminEmail,
      'adminImageURL': adminImageURL,
      'certificateURL': certificateURL,
      'aboutStore': aboutStore,
      'salePoints': salePoints,
    };
  }
}
