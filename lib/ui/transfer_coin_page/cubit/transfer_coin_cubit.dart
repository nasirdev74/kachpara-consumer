import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/domain/usecases/wallet_use_cases.dart';
import 'package:kachpara/l10n/extensions/localizations_extension.dart';
import 'package:kachpara/utils/status.dart';
import 'package:uuid/uuid.dart';

part 'transfer_coin_state.dart';
part 'transfer_coin_cubit.freezed.dart';

@injectable
class TransferCoinCubit extends Cubit<TransferCoinState> {
  final WalletUseCases useCases;

  TransferCoinCubit(this.useCases) : super(const TransferCoinState());

  void initAvailableBalance({
    required String availableBalance,
    required String tokenId,
    required String walletId,
  }) {
    emit(
      state.copyWith(
        availableBalance: double.parse(availableBalance),
        tokenId: tokenId,
        walletId: walletId,
        idempotencyKey: const Uuid().v4(),
      ),
    );
  }

  void setAmountTransfer(String amount) {
    emit(
      state.copyWith(
        amountTransfer: amount,
        amountError: null,
      ),
    );
  }

  void setDestinationAddress(String address) {
    emit(
      state.copyWith(
        destinationAddress: address,
        addressError: null,
      ),
    );
  }

  Future<void> send(BuildContext context) async {
    bool validated = true;
    final amountTransfer = double.tryParse(state.amountTransfer) ?? -1;
    if (amountTransfer <= 0) {
      emit(
        state.copyWith(amountError: context.l10n.please_enter_a_valid_amount),
      );
      validated = false;
    } else if (amountTransfer > state.availableBalance) {
      emit(
        state.copyWith(
          amountError: context.l10n.amount_must_be_less_than_available_balance,
        ),
      );
      validated = false;
    }

    final regexWalletAddress = RegExp(r'^0x[a-fA-F0-9]{40}$');
    if (!regexWalletAddress.hasMatch(state.destinationAddress)) {
      emit(
        state.copyWith(
          addressError: context.l10n.invalid_wallet_address,
        ),
      );
      validated = false;
    }

    if (!validated) {
      return;
    }

    emit(state.copyWith(status: Status.loading));
    try {
      final result = await useCases.sendTransaction(
        walletId: state.walletId,
        tokenId: state.tokenId,
        amount: state.amountTransfer,
        destinationAddress: state.destinationAddress,
        idempotencyKey: state.idempotencyKey,
      );
      result.when(
        success: (transactionId) {
          emit(state.copyWith(
            status: Status.success,
            createdTransactionId: transactionId,
          ));
        },
        error: (e) {
          emit(state.copyWith(
            status: Status.failed,
            error: e,
          ));
        },
      );
    } catch (e) {
      emit(state.copyWith(
        status: Status.failed,
        error: context.l10n.something_went_wrong,
      ));
    }
  }
}
