part of 'payment_methods_page_cubit.dart';

@freezed
class PaymentMethodsPageState with _$PaymentMethodsPageState {
  const factory PaymentMethodsPageState({
    @Default(Status.init) Status getPaymentMethodsStatus,
    @Default([]) List<PaymentCard> paymentMethods,
    String? getPaymentMethodsErrorMessage,
  }) = _PaymentMethodsPageState;
}
