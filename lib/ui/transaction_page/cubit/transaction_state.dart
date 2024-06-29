part of 'transaction_cubit.dart';

@freezed
class TransactionState with _$TransactionState {
  factory TransactionState({
    TransactionModel? transaction,
    @Default(Status.init) Status status,
    String? error,
  }) = _TransactionState;
}
