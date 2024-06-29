import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kachpara/data/models/token_balance_model.dart';
part 'tokens_balance_model.g.dart';
part 'tokens_balance_model.freezed.dart';

@freezed
class TokensBalanceModel with _$TokensBalanceModel {
  const TokensBalanceModel._();

  const factory TokensBalanceModel({
    @Default([]) List<TokenBalance> tokens,
  }) = _TokensBalanceModel;

  factory TokensBalanceModel.fromJson(Map<String, dynamic> json) =>
      _$TokensBalanceModelFromJson(json);
}

deserializeTokensBalanceModel(
  Map<String, dynamic> json,
) {
  if (json["cards"] == null ||
      json["cards"]["tokenBalances"] == null ||
      json["cards"]["tokenBalances"] is! List) {
    return const TokensBalanceModel(tokens: []);
  }
  List<TokenBalance> tokens = [];
  for (var item in json["cards"]["tokenBalances"]) {
    try {
      tokens.add(TokenBalance.fromJson(item.cast<String, dynamic>()));
    } catch (e) {
      debugPrint(e.toString());
    }
  }
  return TokensBalanceModel(tokens: tokens);
}
