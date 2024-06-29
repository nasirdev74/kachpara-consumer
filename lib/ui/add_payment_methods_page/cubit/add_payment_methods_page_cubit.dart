import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/domain/entities/card_details.dart';
import 'package:kachpara/domain/usecases/payment_usecase.dart';
import '../../../utils/status.dart';

part 'add_payment_methods_page_state.dart';
part 'add_payment_methods_page_cubit.freezed.dart';

@injectable
class AddPaymentMethodsPageCubit extends Cubit<AddPaymentMethodsPageState> {
  AddPaymentMethodsPageCubit(this._paymentUsecases) : super(const AddPaymentMethodsPageState());

  final PaymentUsecases _paymentUsecases;

  Future<void> createPaymentMethod({
    required String number,
    required String expirationYear,
    required String expirationMonth,
    required String cvc,
  }) async {
    emit(state.copyWith(status: Status.loading));
    if (number == "" || cvc == "" || expirationMonth == "" || expirationYear == "") {
      emit(state.copyWith(status: Status.failed));
      return;
    }

    final cardDetails = CardDetails(number: number, expMonth: expirationMonth, expYear: expirationYear, cvc: cvc);
    final result = await _paymentUsecases.addNewPaymentCard(cardDetails);
    result.when(
      success: (data) async {
        emit(state.copyWith(status: Status.success));
      },
      error: (message) => emit(state.copyWith(status: Status.failed, error: message)),
    );
  }
}
