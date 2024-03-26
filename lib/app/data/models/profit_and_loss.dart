class ProfitAndLoss {
  num freightOffered;
  num expenses;
  num? profit;

  ProfitAndLoss({required this.freightOffered, this.expenses = 0, this.profit});

  factory ProfitAndLoss.fromJson(Map<String, dynamic> json) {
    return ProfitAndLoss(
      freightOffered: json['freightOffered'],
      expenses: json['expenses'],
      profit: json['profit'],
    );
  }

  factory ProfitAndLoss.empty() {
    return ProfitAndLoss(freightOffered: 0);
  }

  Map<String, dynamic> toJson() {
    return {
      'freightOffered': freightOffered,
      'expenses': expenses,
      'profit': profit,
    };
  }
}
