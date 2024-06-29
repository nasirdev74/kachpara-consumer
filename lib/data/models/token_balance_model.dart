import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'token_model.dart';
part 'token_balance_model.g.dart';
part 'token_balance_model.freezed.dart';

@freezed
class TokenBalance extends Equatable with _$TokenBalance {
  const TokenBalance._();

  const factory TokenBalance({
    @Default('0') amount,
    DateTime? updateDate,
    @Default(TokenModel()) token,
  }) = _TokenBalance;

  factory TokenBalance.fromJson(Map json) => TokenBalance(
        amount: json['amount'] as String? ?? "0",
        updateDate: json['updateDate'] == null
            ? null
            : DateTime.parse(json['updateDate'] as String),
        token: json['token'] == null
            ? const TokenModel()
            : TokenModel.fromJson(json['token']),
      );

  @override
  List<Object?> get props => [amount, updateDate];
}
