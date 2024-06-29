part of 'add_payment_methods_page_cubit.dart';

@freezed
class AddPaymentMethodsPageState with _$AddPaymentMethodsPageState {
  const factory AddPaymentMethodsPageState({
    @Default(Status.init) Status status,
    String? error,
  }) = _AddPaymentMethodsPageState;
}
