part of 'transfer_coin_cubit.dart';

@freezed
class TransferCoinState with _$TransferCoinState {
  const factory TransferCoinState({
    @Default(Status.init) Status status,
    @Default(0) double availableBalance,
    @Default('') String amountTransfer,
    @Default('') String destinationAddress,
    @Default('') String tokenId,
    @Default('') String walletId,
    @Default('') String idempotencyKey,
    @Default('') String createdTransactionId,
    String? error,
    String? amountError,
    String? addressError,
  }) = _TransferCoinState;
}
