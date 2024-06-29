part of 'my_orders_page_cubit.dart';

@freezed
class MyOrdersPageState with _$MyOrdersPageState {
  const factory MyOrdersPageState({
    @Default(Status.init) getOrdersStatus,
    @Default([]) List<Order> activeOrders,
    @Default([]) List<Order> ordersHistory,
  }) = _MyOrdersPageState;
}
