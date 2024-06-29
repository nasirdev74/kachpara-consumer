import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/data/models/curation_model.dart';
import 'package:kachpara/utils/result.dart';

@injectable
class CurationData {
  CurationData(this._firestore);
  final FirebaseFirestore _firestore;

  Future<Result<List<CurationModel>>> getCuration(String userId) async {
    try {
      final coll = await _firestore.collection("users").doc(userId.toString()).collection("curations").get();
      if (coll.docs.isNotEmpty) {
        final List<CurationModel> curations = [];
        for (final refdoc in coll.docs) {
          final ref = refdoc.data();

          final doc = ref["ref"] as DocumentReference<Map<String, dynamic>>;
          final listdata = await doc.get();

          if ((!listdata.exists)) continue;
          final curation = CurationModel.fromJson(listdata.data()!);
          curations.add(curation);
        }
        print("===============================================");
        print(curations);
        print("===============================================");
        return Result.success(curations);
      }
      return const Result.error("no data");
    } on Exception catch (e) {
      if (kDebugMode) {
        print("getCuration catched error : $e");
      }
      return Result.error("catched error: $e");
    }
  }

  Future<Result<CurationModel>> getCurationById(String id) async {
    try {
      final coll = await _firestore.collection("curations").where("id", isEqualTo: id).limit(1).get();
      if (coll.docs.isNotEmpty) {
        final data = CurationModel.fromJson(coll.docs[0].data());
        return Result.success(data);
      }
      return const Result.error("no data");
    } on Exception catch (e) {
      if (kDebugMode) {
        print("getCurationById catched error : $e");
      }
      return Result.error("catched error: $e");
    }
  }

  Future<Result<List<String>>> getStoreIdsByCuration(String curationId) async {
    try {
      final stores = await _firestore.collection("curations").doc(curationId.toString()).get();
      final storeList = (stores.data()?['stores'] as List).map((e) => e.toString()).toList();
      return Result.success(storeList);
    } on Exception catch (e) {
      if (kDebugMode) {
        print("getStoreIdsByCuratedList catched error : $e");
      }
      return Result.error("catched error: $e");
    }
  }

  Future<Result<CurationModel>> getCurationByReferralCode(String code) async {
    try {
      final coll = await _firestore.collection("curations").where("referralCode", isEqualTo: code).limit(1).get();
      if (coll.docs.isNotEmpty) {
        final data = CurationModel.fromJson(coll.docs[0].data());
        return Result.success(data);
      }
      return const Result.error("no data");
    } on Exception catch (e) {
      if (kDebugMode) {
        print("getCurationByReferralCode catched error : $e");
      }
      return Result.error("catched error: $e");
    }
  }

  Future<Result<void>> addCuration(String userId, CurationModel curation, {String? referralCode, String? referredBy}) async {
    try {
      final data = curation.toJson();
      if (referralCode != null) {
        data["sourceReferralCode"] = referralCode;
      }
      if (referredBy != null) {
        data["referredBy"] = referredBy;
      }
      final list = _firestore.collection("curations").doc(curation.id.toString());
      await _firestore
          .collection("users")
          .doc(userId.toString())
          .collection("curations")
          .doc(curation.id.toString())
          .set({"ref": _firestore.doc("curations/${curation.id.toString()}"), "sourceReferralCode": referralCode, "referredBy": referredBy});

      return const Result.success(null);
    } on Exception catch (e) {
      if (kDebugMode) {
        print("addCuration catched error : $e");
      }
      return Result.error("catched error: $e");
    }
  }

  Future<Result<void>> deleteCuration(String userId, String id) async {
    try {
      await _firestore.collection("users").doc(userId.toString()).collection("curations").doc(id).delete();

      return const Result.success(null);
    } on Exception catch (e) {
      if (kDebugMode) {
        print("deleteCuration catched error : $e");
      }
      return Result.error("catched error: $e");
    }
  }
}
