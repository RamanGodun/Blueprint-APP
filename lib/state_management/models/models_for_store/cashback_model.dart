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
