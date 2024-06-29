part of 'selected_items_bloc.dart';

@freezed
class SelectedItemsState with _$SelectedItemsState {
  const factory SelectedItemsState({
    Address? selectedAddress,
    PaymentCard? selectedPaymentMethod,
  }) = _SelecteditemsState;
}
