import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/data/models/gift_model.dart';
import 'package:kachpara/domain/entities/gift.dart';

@injectable
class GiftsData {
  GiftsData(this._firestore);
  final FirebaseFirestore _firestore;

  Future<List<Gift>> getGifts(String userId) async {
    final snapshot =
        await _firestore.collection('users').doc(userId).collection('gifts').where("type", isEqualTo: "GIFT").where("status", isEqualTo: "ACTIVE").get();
    List<Gift> gifts = [];
    gifts = snapshot.docs.map((doc) {
      return GiftModel.fromJson(doc.data()).toDomain();
    }).toList();

    return gifts;
  }

  Future<void> claimGift(String userId, String orderId) async {
    final snapshot = await _firestore.collection('users').doc(userId).collection('gifts').where("orderId", isEqualTo: orderId).get();

// Update each document in the snapshot
    for (final doc in snapshot.docs) {
      await doc.reference.set(
        {'status': 'CLAIMED'},
        SetOptions(merge: true),
      );
    }
  }
}
