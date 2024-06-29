import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'transaction_model.dart';

part 'transactions_model.g.dart';

part 'transactions_model.freezed.dart';

@freezed
class TransactionsModel with _$TransactionsModel {
  const TransactionsModel._();
  const factory TransactionsModel({
    @Default([]) List<TransactionModel> transactions,
  }) = _TransactionsModel;

  factory TransactionsModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionsModelFromJson(json);
}

TransactionsModel deserializeTransactionsModel(
  Map<String, dynamic> json,
) {
  if (json["cards"] == null ||
      json["cards"]["transactions"] == null ||
      json["cards"]["transactions"] is! List) {
    return const TransactionsModel(transactions: []);
  }
  List<TransactionModel> transactions = [];
  for (var item in json["cards"]["transactions"]) {
    try {
      transactions.add(TransactionModel.fromJson(item.cast<String, dynamic>()));
    } catch (e) {
      debugPrint(e.toString());
    }
  }
  return TransactionsModel(transactions: transactions);
}
