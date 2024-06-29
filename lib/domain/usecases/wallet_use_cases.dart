import 'package:injectable/injectable.dart';
import 'package:kachpara/data/models/token_balance_model.dart';
import 'package:kachpara/data/models/transaction_model.dart';
import 'package:kachpara/data/models/wallet_model.dart';
import 'package:kachpara/data/sources/cloud_functions/circle_functions.dart';
import 'package:kachpara/data/sources/firestore/wallet_data.dart';
import 'package:kachpara/utils/result.dart';

abstract class WalletUseCases {
  Future<Result<List<TransactionModel>>> getTransactions(String walletId);
  Future<Result<TokenBalance>> getTokensBalance(String walletId);
  Future<Result<String>> sendTransaction({
    required String walletId,
    required String tokenId,
    required String amount,
    required String destinationAddress,
    required String idempotencyKey,
  });
  Future<Result<TransactionModel>> getTransaction(String id);
  Future<Result<WalletModel>> getWallet();
}

@LazySingleton(as: WalletUseCases)
class WalletUseCasesImpl implements WalletUseCases {
  final CircleData _circleData;
  final WalletData _walletData;

  WalletUseCasesImpl(this._circleData, this._walletData);

  @override
  Future<Result<WalletModel>> getWallet() {
    return _walletData.getWallet();
  }

  @override
  Future<Result<List<TransactionModel>>> getTransactions(String walletId) async {
    final result = await _circleData.getTransactions(walletId);
    return result.when(
      success: (model) {
        final transactions = model.transactions;
        return Result.success(transactions);
      },
      error: (e) {
        return Result.error(e);
      },
    );
  }

  @override
  Future<Result<TokenBalance>> getTokensBalance(String walletId) async {
    final result = await _circleData.getTokensBalance(walletId);
    return result.when(
      success: (model) {
        return Result.success(model.tokens.firstWhere((element) => element.token.name == "USDC"));
      },
      error: (e) {
        return Result.error(e);
      },
    );
  }

  @override
  Future<Result<String>> sendTransaction({
    required String walletId,
    required String tokenId,
    required String amount,
    required String destinationAddress,
    required String idempotencyKey,
  }) async {
    final result = await _circleData.sendTransaction(
      walletId: walletId,
      tokenId: tokenId,
      destinationAddress: destinationAddress,
      amount: amount,
    );
    return result.when(
        success: (createdTransaction) {
          return Result.success(createdTransaction.id);
        },
        error: (e) => Result.error(e));
  }

  @override
  Future<Result<TransactionModel>> getTransaction(String id) async {
    return _circleData.getTransactionDetail(id);
  }
}
