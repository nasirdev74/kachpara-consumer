import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/data/models/wallet_model.dart';
import 'package:kachpara/utils/result.dart';

@lazySingleton
class WalletData {
  WalletData(this._firestore, this._auth);

  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  Future<Result<WalletModel>> getWallet() async {
    final userId = _auth.currentUser?.uid;
    if (userId != null) {
      try {
        final snapshot = await _firestore.collection("users").doc(userId).collection("wallets").get();

        return Result.success(
          WalletModel.fromJson(
            snapshot.docs.first.data(),
          ),
        );
      } catch (e) {
        return const Result.error("You don't have a wallet yet.");
      }
    }
    return const Result.error("userId is null");
  }
}
