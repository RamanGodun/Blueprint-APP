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
