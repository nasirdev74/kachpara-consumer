part of 'order_detail_page_cubit.dart';

@freezed
class OrderDetailPageState with _$OrderDetailPageState {
  const factory OrderDetailPageState({
    Order? order,
    @Default(Status.init) Status fetchorderStatus,
  }) = _OrderDetailPageState;
}
