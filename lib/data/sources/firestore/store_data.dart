import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:kachpara/data/models/competition_model.dart';
import 'package:kachpara/domain/entities/store.dart';
import '../../../utils/result.dart';
import '../../models/store_model.dart';

@injectable
class StoreDataFirebase {
  final FirebaseFirestore _firestore;

  StoreDataFirebase(this._firestore);

  Future<Result<StoreModel>> addMainStore(StoreModel store) async {
    try {
      final result = await _firestore.collection("stores").add({
        "address": store.address,
        "name": store.name,
        "referralCode": store.referralCode,
        "kachparaEnabled": store.kachparaEnabled,
        "lat": store.lat,
        "lng": store.lng,
        "placeId": store.placeId,
        "currency": store.currency,
        "currencySymbol": store.currencySymbol,
        "storeUrl": store.storeUrl
      });

      final resultStore = await result.get();
      Map<String, dynamic> dataMap = resultStore.data()!;
      dataMap["id"] = resultStore.id;
      StoreModel data = StoreModel.fromJson(dataMap);

      return Result.success(data);
    } on Exception catch (e) {
      if (kDebugMode) {
        print("addstore catched error : $e");
      }
      return Result.error("catched error: $e");
    }
  }

  Future<Result<void>> addStore(String? userId, StoreModel store, {String? referralCode}) async {
    try {
      final userDoc = await _firestore.collection("users").doc(userId).collection("stores").doc(store.id).get();
      // do not add store if it is already there by other referralcode
      if (userDoc.exists) return const Result.success(null);

      // add store with referralcode
      await _firestore.collection("users").doc(userId.toString()).collection("stores").doc(store.id.toString()).set({
        "id": store.id,
        "name": store.name,
        if (referralCode != null) "sourceReferralCode": referralCode,
      }, SetOptions(merge: true));

      return const Result.success(null);
    } on Exception catch (e) {
      if (kDebugMode) {
        print("addstore catched error : $e");
      }
      return Result.error("catched error: $e");
    }
  }

  Future<Result<void>> deleteStore(String? userId, String storeId) async {
    try {
      await _firestore.collection("users").doc(userId.toString()).collection("stores").doc(storeId.toString()).delete();
      return const Result.success(null);
    } on Exception catch (e) {
      if (kDebugMode) {
        print("deleteStore catched error : $e");
      }
      return Result.error("catched error: $e");
    }
  }

  Future<Result<List<String>>> getStoreIdsByUser(String? userId) async {
    debugPrint("Getting stores from firestore for user $userId");
    try {
      final stores = await _firestore.collection("users").doc(userId.toString()).collection("stores").get();
      final storeList = stores.docs.map((e) => e.id).toList();
      return Result.success(storeList);
    } on Exception catch (e) {
      if (kDebugMode) {
        print("getStores catched error : $e");
      }
      return Result.error("catched error: $e");
    }
  }

  Future<Map<String, String>> getStoreReferralCodesByUser(String? userId) async {
    debugPrint("Getting stores from Firestore for user $userId");
    try {
      final stores = await _firestore.collection("users").doc(userId.toString()).collection("stores").get();
      final storeMap = Map<String, String>();

      for (var storeDoc in stores.docs) {
        final storeId = storeDoc.id;
        final referralCode = storeDoc["shareableReferralCode"] as String;

        storeMap[storeId] = referralCode;
      }

      return storeMap;
    } on Exception catch (e) {
      if (kDebugMode) {
        print("getStoreReferralCodesByUser caught error: $e");
      }
      rethrow;
    }
  }

  Future<Result<StoreModel>> getStoreById(String storeId) async {
    try {
      final resultStore = await _firestore.collection("stores").doc(storeId).get();

      Map<String, dynamic> dataMap = resultStore.data()!;
      dataMap["id"] = resultStore.id;
      StoreModel data = StoreModel.fromJson(dataMap);
      print("StoreModel :: $data");

      return Result.success(data);
    } on Exception catch (e) {
      if (kDebugMode) {
        print("getStoreById catched error : $e");
      }
      return Result.error("catched error: $e");
    }
  }

  Future<Result<StoreModel>> getStorebyReferralCode(String referralCode) async {
    try {
      final coll = await _firestore.collection("stores").where("referralCode", isEqualTo: referralCode).limit(1).get();
      if (coll.docs.isNotEmpty) {
        Map<String, dynamic> dataMap = coll.docs[0].data();
        dataMap["id"] = coll.docs[0].id;
        StoreModel data = StoreModel.fromJson(dataMap);
        return Result.success(data);
      }
      return const Result.error("no data");
    } on Exception catch (e) {
      if (kDebugMode) {
        print("getStorebyReferralCode catched error : $e");
      }
      return Result.error("catched error: $e");
    }
  }

  Future<Result<Map<String, dynamic>>> getRefferedStoreOrCuration(String referralCode) async {
    try {
      final code = await _firestore.collection("referralCodes").doc(referralCode).get();
      if (code.exists) {
        return Result.success({
          "storeId": code.data()?["storeId"],
          "curationId": code.data()?["curationId"],
          "ownerUserId": code.data()?["ownerUserId"],
        });
      }
      return const Result.error("No such code exists");
    } on Exception catch (e) {
      if (kDebugMode) {
        print("getRefferedStores catched error : $e");
      }
      return Result.error("catched error: $e");
    }
  }

  Future<Result<StoreModel>> getStorebyPlaceId(String placeId) async {
    try {
      final coll = await _firestore.collection("stores").where("placeId", isEqualTo: placeId).limit(1).get();
      if (coll.docs.isNotEmpty) {
        Map<String, dynamic> dataMap = coll.docs[0].data();
        dataMap["id"] = coll.docs[0].id;
        StoreModel data = StoreModel.fromJson(dataMap);
        return Result.success(data);
      }
      return const Result.error("no data");
    } on Exception catch (e) {
      if (kDebugMode) {
        print("getStorebyReferralCode catched error : $e");
      }
      return Result.error("catched error: $e");
    }
  }

  Future<CompetitionModel?> getCurrentCompetition(String storeId) async {
    try {
      // Get the current date
      DateTime currentDate = DateTime.now();

      // You can use the generated competitionId to fetch the competition data from Firestore
      // Example: Replace 'competition' with the actual subcollection name for competitions
      final competitionCollection = _firestore.collection('stores').doc(storeId).collection('competition');
      final querySnapshot =
          await competitionCollection.where('startDate', isLessThanOrEqualTo: currentDate).orderBy('startDate', descending: true).limit(1).get();

      if (querySnapshot.docs.isNotEmpty) {
        // Check if the current date is within the competition's date range
        final competitionData = querySnapshot.docs.first.data() as Map<String, dynamic>;
        DateTime startDate = (competitionData['startDate'] as Timestamp).toDate();
        DateTime endDate = (competitionData['endDate'] as Timestamp).toDate();

        if (currentDate.isAfter(startDate) && currentDate.isBefore(endDate)) {
          // Competition data exists for the current date
          return CompetitionModel.fromJson(competitionData);
        }
      }

      // Competition data does not exist for the current date
      // You may want to handle this case according to your application's logic
      // For now, returning null
      return null;
    } catch (e) {
      if (kDebugMode) {
        print("getCurrentCompetition catched error: $e");
      }
      // Handle the error as needed
      rethrow;
    }
  }

  Future<Result<Store>> updateStore({required StoreModel store}) async {
    try {
      await _firestore.collection("stores").doc(store.id).update(store.toJson());

      return Result.success(store.toDomain());
    } on Exception catch (e) {
      if (kDebugMode) {
        print("addstore catched error : $e");
      }
      return Result.error("catched error: $e");
    }
  }
}
