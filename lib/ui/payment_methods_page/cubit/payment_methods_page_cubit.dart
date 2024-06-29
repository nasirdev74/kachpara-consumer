import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/utils/status.dart';
import 'package:kachpara/domain/entities/payment_card.dart';

import '../../../domain/usecases/payment_usecase.dart';

part 'payment_methods_page_state.dart';
part 'payment_methods_page_cubit.freezed.dart';

@injectable
class PaymentMethodsPageCubit extends Cubit<PaymentMethodsPageState> {
  PaymentMethodsPageCubit(this._paymentUsecases) : super(const PaymentMethodsPageState()) {
    getPaymentMethods();
  }

  final PaymentUsecases _paymentUsecases;

  Future<void> getPaymentMethods() async {
    emit(state.copyWith(getPaymentMethodsStatus: Status.loading));
    final result = await _paymentUsecases.getSavedCustomerCards();
    result.when(success: (data) {
      emit(state.copyWith(getPaymentMethodsStatus: Status.success, paymentMethods: data));
    }, error: (error) {
      emit(state.copyWith(getPaymentMethodsStatus: Status.failed, getPaymentMethodsErrorMessage: error));
    });
  }

  Future<void> deletePayment(String paymentMethodId) async {
    await _paymentUsecases.deletePaymentMethod(paymentMethodId);
    getPaymentMethods();
  }
}
