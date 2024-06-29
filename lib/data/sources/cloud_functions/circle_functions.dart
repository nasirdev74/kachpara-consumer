import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/data/models/created_transaction_model.dart';
import 'package:kachpara/data/models/tokens_balance_model.dart';
import 'package:kachpara/data/models/transaction_model.dart';
import 'package:kachpara/data/models/transactions_model.dart';
import 'package:kachpara/utils/result.dart';

@lazySingleton
class CircleData {
  final FirebaseFunctions _functions;
  CircleData(this._functions);
  Future<Result<TransactionsModel>> getTransactions(
    String walletId,
  ) async {
    final body = {
      "walletId": walletId,
    };

    try {
      final response = await _functions.httpsCallable("getTransactions").call(
            body,
          );

      final transactionsModel = await compute(
        deserializeTransactionsModel,
        response.data as Map<String, dynamic>,
      );
      return Result.success(transactionsModel);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<Result<CreatedTransactionModel>> sendTransaction({
    required String walletId,
    required String tokenId,
    required String destinationAddress,
    required String amount,
  }) async {
    try {
      final body = {
        "walletId": walletId,
        "tokenId": tokenId,
        "destinationAddress": destinationAddress,
        "amount": amount,
      };
      final response = await _functions.httpsCallable("sendTransaction").call(
            body,
          );
      final createdTransaction = await compute(
        deserializeCreatedTransactionModel,
        response.data as Map<String, dynamic>,
      );
      return Result.success(createdTransaction);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<Result<TokensBalanceModel>> getTokensBalance(
    String walletId, {
    String name = "USDC",
  }) async {
    final body = {
      "walletId": walletId,
      "name": name,
    };
    try {
      final response = await _functions.httpsCallable("getTokensBalance").call(
            body,
          );
      final tokensBalance = await compute(
        deserializeTokensBalanceModel,
        response.data as Map<String, dynamic>,
      );
      return Result.success(tokensBalance);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<Result<TransactionModel>> getTransactionDetail(String id) async {
    final body = {
      "transactionId": id,
    };

    try {
      final response = await _functions.httpsCallable("getTransactionDetail").call(body);
      final transaction = await compute(
        deserializeTransactionModel,
        response.data as Map<String, dynamic>,
      );
      return Result.success(transaction);
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}
