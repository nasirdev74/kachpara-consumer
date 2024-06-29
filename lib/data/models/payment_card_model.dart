import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/payment_card.dart';

part 'payment_card_model.freezed.dart';
part 'payment_card_model.g.dart';

@freezed
class PaymentCardModel with _$PaymentCardModel {
  PaymentCardModel._();
  factory PaymentCardModel({
    @JsonKey(readValue: _readId) required String id,
    @JsonKey(readValue: _readBrand) required String brand,
    @JsonKey(readValue: _readLast4) required String last4,
    @JsonKey(readValue: _readExpMonth) required int expMonth,
    @JsonKey(readValue: _readExpYear) required int expYear,
  }) = _PaymentCardModel;

  factory PaymentCardModel.fromJson(Map<String, dynamic> json) => _$PaymentCardModelFromJson(json);

  PaymentCard toDomain() {
    return PaymentCard(
      id: id,
      brand: brand,
      last4: last4,
      expMonth: expMonth.toString(),
      expYear: expYear.toString(),
    );
  }

  factory PaymentCardModel.fromDomain(PaymentCard paymentCard) {
    return PaymentCardModel(
      id: paymentCard.id,
      brand: paymentCard.brand,
      last4: paymentCard.last4,
      expMonth: int.parse(paymentCard.expMonth),
      expYear: int.parse(paymentCard.expYear),
    );
  }
}

Object? _readId(p1, String p2) {
  return p1['id'];
}

Object? _readBrand(p1, String p2) {
  return p1['card']['brand'];
}

Object? _readLast4(p1, String p2) {
  return p1['card']['last4'];
}

Object? _readExpYear(p1, String p2) {
  return p1['card']['exp_year'];
}

Object? _readExpMonth(p1, String p2) {
  return p1['card']['exp_month'];
}
