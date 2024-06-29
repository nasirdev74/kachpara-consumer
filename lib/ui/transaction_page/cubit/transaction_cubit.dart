import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/data/models/transaction_model.dart';
import 'package:kachpara/domain/usecases/wallet_use_cases.dart';
import 'package:kachpara/utils/status.dart';

part 'transaction_state.dart';
part 'transaction_cubit.freezed.dart';

@injectable
class TransactionCubit extends Cubit<TransactionState> {
  final WalletUseCases useCases;
  final String id;

  TransactionCubit(this.useCases, @factoryParam this.id) : super(TransactionState()) {
    initialize();
  }

  Future<void> initialize() async {
    emit(TransactionState(status: Status.loading));
    final result = await useCases.getTransaction(id);
    result.when(
      success: (transaction) {
        emit(TransactionState(
          transaction: transaction,
          status: Status.success,
        ));
      },
      error: (e) {
        emit(TransactionState(
          status: Status.failed,
          error: e,
        ));
      },
    );
  }
}
