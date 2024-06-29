import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/domain/usecases/order_usecase.dart';
import 'package:kachpara/utils/status.dart';

import '../../../domain/entities/order.dart';

part 'order_detail_page_state.dart';
part 'order_detail_page_cubit.freezed.dart';

@injectable
class OrderDetailPageCubit extends Cubit<OrderDetailPageState> {
  OrderDetailPageCubit(this._orderUseCase, @factoryParam Order? order, @factoryParam String orderId) : super(OrderDetailPageState(order: order)) {
    if (state.order == null) {
      fetchOrder(orderId);
    }
  }

  final OrderUseCase _orderUseCase;

  Future<void> fetchOrder(String orderId) async {
    emit(state.copyWith(fetchorderStatus: Status.loading));
    final result = await _orderUseCase.getOrder(orderId);
    result.when(success: ((data) {
      emit(state.copyWith(fetchorderStatus: Status.success, order: data));
    }), error: (e) {
      emit(state.copyWith(
        fetchorderStatus: Status.failed,
      ));
    });
  }
}
