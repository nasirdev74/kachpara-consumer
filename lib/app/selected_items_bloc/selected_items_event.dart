part of 'selected_items_bloc.dart';

@freezed
class SelectedItemsEvent with _$SelectedItemsEvent {
  const factory SelectedItemsEvent.setAddress({required Address address}) = _SetAddress;
  const factory SelectedItemsEvent.initializeAddress() = _InitializeAddress;
  const factory SelectedItemsEvent.setPaymentMethod({required PaymentCard paymentMethod}) = _SetPaymentMethod;
  const factory SelectedItemsEvent.initializePaymentMethod() = _InitializePaymentMethod;
}
