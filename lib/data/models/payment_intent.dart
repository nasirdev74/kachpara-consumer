import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_intent.g.dart';
part 'payment_intent.freezed.dart';

@freezed
class PaymentIntent with _$PaymentIntent {
  const factory PaymentIntent({
    required String id,
    required String client_secret,
    required String status,
    required double amount,
    required String currency,
  }) = _PaymentIntent;

  factory PaymentIntent.fromJson(Map<String, dynamic> json) => _$PaymentIntentFromJson(json);
}
