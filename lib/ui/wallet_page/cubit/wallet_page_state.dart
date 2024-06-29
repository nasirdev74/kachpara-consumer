part of 'wallet_page_cubit.dart';

@freezed
class WalletPageState with _$WalletPageState {
  const factory WalletPageState({
    @Default(WalletModel()) WalletModel wallet,
    @Default([]) List<TransactionModel> transactions,
    @Default(TokenBalance()) TokenBalance tokenBalance,
    @Default(Status.init) Status status,
    String? error,
  }) = _WalletPageState;
}
