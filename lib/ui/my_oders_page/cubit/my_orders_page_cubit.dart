import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/domain/usecases/order_usecase.dart';
import 'package:kachpara/utils/status.dart';

import '../../../domain/entities/order.dart';

part 'my_orders_page_state.dart';
part 'my_orders_page_cubit.freezed.dart';

@injectable
class MyOrdersPageCubit extends Cubit<MyOrdersPageState> {
  MyOrdersPageCubit(this._orderUseCase) : super(const MyOrdersPageState()) {
    getOrders();
  }

  final OrderUseCase _orderUseCase;

  Future<void> getOrders() async {
    emit(state.copyWith(getOrdersStatus: Status.loading));
    final result = await _orderUseCase.getOrders();
    result.when(success: ((data) {
      final activeOrder = data.where((element) => element.orderStatus == 'ACTIVE').toList();
      final pastOrder = data.where((element) => (element.orderStatus == 'COMPLETED' || element.orderStatus == 'CANCELLED')).toList();
      emit(state.copyWith(getOrdersStatus: Status.success, activeOrders: activeOrder, ordersHistory: pastOrder));
    }), error: (e) {
      emit(state.copyWith(
        getOrdersStatus: Status.failed,
      ));
    });
  }
}
