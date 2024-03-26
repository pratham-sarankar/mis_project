import 'package:mis_project/app/data/models/profit_and_loss.dart';

class Ledger {
  num totalFreight;
  num advance;
  num? balance;
  ProfitAndLoss profitAndLoss;

  Ledger({
    required this.totalFreight,
    required this.advance,
    this.balance,
    required this.profitAndLoss,
  });

  factory Ledger.fromJson(Map<String, dynamic> json) {
    return Ledger(
      totalFreight: json['totalFreight'],
      advance: json['advance'],
      balance: json['balance'],
      profitAndLoss: ProfitAndLoss.fromJson(json['profitAndLoss']),
    );
  }

  factory Ledger.empty() {
    return Ledger(
      totalFreight: 0,
      advance: 0,
      profitAndLoss: ProfitAndLoss.empty(),
    );
  }

  Map<String, dynamic> toJson({
    bool isInline = false,
  }) {
    return {
      'totalFreight': totalFreight,
      'advance': advance,
      'balance': balance,
      if (isInline)
        ...profitAndLoss.toJson()
      else
        'profitAndLoss': profitAndLoss.toJson(),
    };
  }
}
