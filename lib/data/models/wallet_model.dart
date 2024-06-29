import 'package:freezed_annotation/freezed_annotation.dart';
part 'wallet_model.g.dart';
part 'wallet_model.freezed.dart';

@freezed
class WalletModel with _$WalletModel {
  const WalletModel._();
  const factory WalletModel({
    @Default("") String accountType,
    @Default("") String address,
    @Default("") String blockchain,
    DateTime? createDate,
    @Default("") String custodyType,
    @Default("") String id,
    @Default("") String refId,
    @Default("") String state,
    DateTime? updateDate,
    @Default("") String walletSetId,
  }) = _WalletModel;

  factory WalletModel.fromJson(Map<String, dynamic> json) =>
      _$WalletModelFromJson(json);

  bool get available {
    return state == "LIVE" && id.isNotEmpty;
  }
}
