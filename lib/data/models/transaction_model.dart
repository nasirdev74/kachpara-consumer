// ignore_for_file: constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kachpara/l10n/extensions/localizations_extension.dart';
import 'package:kachpara/ui/wallet_page/widgets/constant.dart';

part 'transaction_model.g.dart';
part 'transaction_model.freezed.dart';

@freezed
class TransactionModel with _$TransactionModel {
  const TransactionModel._();

  String get amount {
    try {
      return transactionType.inComing
          ? "+${amounts.first}"
          : "-${amounts.first}";
    } catch (e) {
      return "0";
    }
  }

  String get partnerAddress {
    final address =
        transactionType.inComing ? sourceAddress : destinationAddress;
    try {
      final hidingAddress =
          "${address.substring(0, 5)}...${address.substring(address.length - 3)}";
      return hidingAddress;
    } catch (e) {
      return address;
    }
  }

  const factory TransactionModel({
    @Default("") String id,
    @Default("") String blockchain,
    @Default("") String tokenId,
    @Default("") String walletId,
    @Default("") String sourceAddress,
    @Default("") String destinationAddress,
    @Default(TransactionType.DUMMY) TransactionType transactionType,
    @Default("Pending") String state,
    @Default(["0"]) List<String> amounts,
    DateTime? createDate,
    DateTime? updateDate,
    @Default("") String txHash,
  }) = _TransactionModel;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);

  factory TransactionModel.dummy() {
    return TransactionModel(
      id: "",
      blockchain: "",
      tokenId: "",
      walletId: "",
      sourceAddress: "",
      destinationAddress: "",
      transactionType: TransactionType.DUMMY,
      state: "",
      amounts: ["0"],
      createDate: DateTime.now(),
      updateDate: DateTime.now(),
      txHash: '',
    );
  }
}

enum TransactionType {
  INBOUND,
  OUTBOUND,
  DUMMY;

  bool get outGoing {
    return this == TransactionType.OUTBOUND;
  }

  bool get inComing {
    return this == TransactionType.INBOUND;
  }

  Color get bgColor {
    return inComing ? bgInComingColor : bgOutGoingColor;
  }

  Color get iconColor {
    return inComing ? iconDownColor : iconUpColor;
  }

  String displayText(BuildContext context) {
    if (this == TransactionType.DUMMY) return "";
    return inComing ? context.l10n.receive : context.l10n.transfer;
  }

  IconData get icon {
    return inComing
        ? CupertinoIcons.arrow_down_left
        : CupertinoIcons.arrow_up_right;
  }
}

deserializeTransactionModel(
  Map<String, dynamic> json,
) {
  if (json["cards"] == null ||
      json["cards"]["transaction"] == null ||
      json["cards"]["transaction"] is! Map) {
    return TransactionModel.dummy();
  }
  try {
    json["cards"]["transaction"].cast<String, dynamic>();
    return TransactionModel.fromJson(
        json["cards"]["transaction"].cast<String, dynamic>());
  } catch (e) {
    return TransactionModel.dummy();
  }
}
