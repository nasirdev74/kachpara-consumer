import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/data/models/token_balance_model.dart';
import 'package:kachpara/data/models/transaction_model.dart';
import 'package:kachpara/data/models/wallet_model.dart';
import 'package:kachpara/domain/usecases/wallet_use_cases.dart';
import 'package:kachpara/utils/result.dart';
import '../../../utils/status.dart';

part 'wallet_page_state.dart';
part 'wallet_page_cubit.freezed.dart';

@lazySingleton
class WalletPageCubit extends Cubit<WalletPageState> {
  final WalletUseCases useCases;
  Timer? timer;

  WalletPageCubit(this.useCases) : super(const WalletPageState()) {
    initialize();
  }

  Future<void> initialize() async {
    emit(state.copyWith(status: Status.loading));
    final result = await useCases.getWallet();
    result.when(
      success: (wallet) {
        emit(state.copyWith(wallet: wallet));
        refreshData();
      },
      error: (e) {
        emit(state.copyWith(status: Status.failed, error: e));
      },
    );
  }

  Future<void> refreshData() async {
    List<Future> futures = [
      useCases.getTransactions(state.wallet.id),
      useCases.getTokensBalance(state.wallet.id),
    ];
    await Future.wait(futures).then((value) {
      List<TransactionModel> transactions = [];
      TokenBalance tokenBalance = const TokenBalance();
      String? error;
      (value[0] as Result<List<TransactionModel>>).when(
        success: (data) => transactions = data,
        error: (e) => error = e,
      );
      (value[1] as Result<TokenBalance>).when(
        success: (data) => tokenBalance = data,
        error: (e) => error = e,
      );
      emit(
        state.copyWith(
          status: error != null ? Status.failed : Status.success,
          transactions: transactions,
          tokenBalance: tokenBalance,
          error: error,
        ),
      );
    }).catchError((e) {
      emit(
        state.copyWith(
          status: Status.failed,
          error: e.toString(),
        ),
      );
    });
  }

  void triggerPeriodicFetch() {
    if (timer == null) {
      refreshData();
      timer ??= Timer.periodic(const Duration(seconds: 5), (_) {
        refreshData();
      });
    }
  }

  void disposeTimer() {
    timer?.cancel();
    timer = null;
  }
}
