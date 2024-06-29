import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/data/models/promotion_model.dart';

import '../../../utils/result.dart';

@injectable
class PromotionsData {
  PromotionsData(this._firestore);
  final FirebaseFirestore _firestore;

  Future<Result<List<PromotionModel>>> getPromotions(String storeId) async {
    try {
      final snapshot = await _firestore.collection('stores').doc(storeId.toString()).collection('promotions').get();
      final promotions = snapshot.docs.map((doc) {
        return PromotionModel.fromJson(doc.data());
      }).toList();

      return Result.success(promotions);
    } catch (e) {
      debugPrint("Error getting promotions: $e");
      return Result.error(e.toString());
    }
  }

  Future<void> claimPromotion(String userId, String orderId, String storeId, String promotionId) async {
    try {
      final snapshot = await _firestore
          .collection('users')
          .doc(userId)
          .collection('used_promotions')
          .add({"orderId": orderId, "userId": userId, "storeId": storeId, "promotionId": promotionId});
    } catch (e) {
      debugPrint("Error getting promotions: $e");
    }
  }

  Future<void> addFreePromotionEntries(String userId, String orderId, String storeId, String promotionId) async {
    try {
      await _firestore
          .collection('stores')
          .doc(storeId.toString())
          .collection('promotions')
          .doc(promotionId)
          .collection('claims')
          .add({"orderId": orderId, "userId": userId, "storeId": storeId, "promotionId": promotionId});

      await _firestore
          .collection('stores')
          .doc(storeId.toString())
          .collection('promotions')
          .doc(promotionId)
          .update({"claimedDonations": FieldValue.increment(1)});
    } catch (e) {
      debugPrint("Error getting promotions: $e");
    }
  }

  Future<Result<PromotionModel>> getPromotion(String storeId, String promotionId) async {
    try {
      final snapshot = await _firestore.collection('stores').doc(storeId.toString()).collection('promotions').doc(promotionId).get();
      if (snapshot.exists) {
        final promotion = PromotionModel.fromJson(snapshot.data()!);

        return Result.success(promotion);
      } else {
        return const Result.error("promotion dont exist");
      }
    } catch (e) {
      debugPrint("Error getting promotions: $e");
      return Result.error(e.toString());
    }
  }

  Future<Result<PromotionModel?>> getActivePromotion(String userId, String storeId) async {
    try {
      final snapshot = await _firestore
          .collection('stores')
          .doc(storeId.toString())
          .collection('promotions')
          .where('type', isEqualTo: "DISCOUNT")
          // .where('isEnabled', isEqualTo: true)
          // .where("endDate", isGreaterThanOrEqualTo: DateTime.now())
          // .where("startDate", isLessThanOrEqualTo: DateTime.now())
          .get();

      if (snapshot.docs.isNotEmpty) {
        final promotion = PromotionModel.fromJson(snapshot.docs.first.data());
        final promotionUsed = await isPromotionUsed(userId, promotion.id, storeId);
        return (promotionUsed) ? const Result.success(null) : Result.success(promotion);
      } else {
        return const Result.error("promotion dont exist");
      }
    } catch (e) {
      debugPrint("Error getting promotions: $e");
      return Result.error(e.toString());
    }
  }

  Future<Result<PromotionModel?>> getFreePromotion(String storeId) async {
    try {
      final snapshot = await _firestore.collection('stores').doc(storeId.toString()).collection('promotions').where('type', isEqualTo: "FREE").get();

      if (snapshot.docs.isNotEmpty) {
        final promotion = PromotionModel.fromJson(snapshot.docs.first.data());
        return Result.success(promotion);
      } else {
        return const Result.error("promotion dont exist");
      }
    } catch (e) {
      debugPrint("Error getting promotions: $e");
      return Result.error(e.toString());
    }
  }

  Future<Result<List<String>>> usedPromotionIds(String userId) async {
    try {
      final list = <String>[];
      final snapshot = await _firestore.collection('users').doc(userId).collection('used_promotions').get();
      for (var element in snapshot.docs) {
        list.add(element.data()['promotionId']);
      }
      return Result.success(list);
    } catch (e) {
      debugPrint("Error getting promotions: $e");
      return Result.error(e.toString());
    }
  }

  Future<bool> isPromotionUsed(String userId, String promotionId, String storeId) async {
    final snapshot = await _firestore
        .collection('users')
        .doc(userId)
        .collection('used_promotions')
        .where('promotionId', isEqualTo: promotionId)
        .where('storeId', isEqualTo: storeId)
        .get();
    if (snapshot.docs.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<void> addDonation(String storeId, String orderId, int quantity, String promotionId) async {
    try {
      await _firestore
          .collection('stores')
          .doc(storeId.toString())
          .collection('promotions')
          .doc(promotionId)
          .collection('donations')
          .add({"orderId": orderId, "quantity": quantity, "storeId": storeId, "promotionId": promotionId});

      await _firestore
          .collection('stores')
          .doc(storeId.toString())
          .collection('promotions')
          .doc(promotionId)
          .update({"totalDonations": FieldValue.increment(quantity)});
    } catch (e) {
      debugPrint("Error getting promotions: $e");
    }
  }

  Future<List<String>> getOrderIdsForPromotion(String userId, String storeId, String promotionId) async {
    final usedPromotionsRef = _firestore.collection('users').doc(userId).collection('used_promotions');
    final querySnapshot = await usedPromotionsRef.where('promotionId', isEqualTo: promotionId).where('storeId', isEqualTo: storeId).get();

    if (querySnapshot.docs.isEmpty) {
      return [];
    }

    return querySnapshot.docs.map((doc) => doc.data()['orderId'].toString()).toList();
  }
}
