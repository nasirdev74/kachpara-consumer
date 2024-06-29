import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/data/models/reward_balance_model.dart';
import 'package:kachpara/data/models/user_model.dart';
import 'package:kachpara/data/models/user_store_model.dart';
import 'package:kachpara/domain/entities/user.dart';
import 'package:kachpara/domain/entities/user_store.dart';
import 'package:kachpara/utils/email_utils.dart';
import 'package:kachpara/utils/result.dart';

@injectable
class UserData {
  final FirebaseFirestore _firestore;

  UserData(this._firestore);

  Future<Result<bool>> updateUser(User user) async {
    try {
      await _firestore.collection("users").doc(user.id).set({"name": user.name}, SetOptions(merge: true));
      return const Result.success(true);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Result<bool>> updateFCMToken(String userId, String fcmToken) async {
    try {
      await _firestore.collection("users").doc(userId).set({"fcmToken": fcmToken}, SetOptions(merge: true));
      return const Result.success(true);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> updateVerifiedStudentUser(
    User user,
    String studentEmail,
  ) async {
    try {
      await _firestore
          .collection("users")
          .doc(user.id)
          .set({"studentEmail": studentEmail, "isStudentVerified": true, "studentVerificationDate": Timestamp.now()}, SetOptions(merge: true));
    } catch (e) {
      log(e.toString());
    }
  }

  Future<Result<void>> saveCustomerIdToFirestore(String customerId, String userId) async {
    try {
      await _firestore.collection("users").doc(userId).update({
        "customerId": customerId,
      });
      return const Result.success(null);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<Result<String?>> getCustomerIdFromFirestore(String userId) async {
    try {
      final userDoc = await _firestore.collection("users").doc(userId).get();
      if (userDoc.exists) {
        return Result.success(userDoc.data()?["customerId"]);
      } else {
        return const Result.error("User not found");
      }
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<Result<void>> updateSelectedAddress(String userId, String addressId) async {
    try {
      await _firestore.collection('users').doc(userId).update({"selectedAddressId": addressId});
      return const Result.success(null);
    } catch (e) {
      if (kDebugMode) {
        print('AuthData: createUser: error: $e');
      }
      return Result.error(e.toString());
    }
  }

  Future<Result<void>> updateSelectedPaymentMethod(String userId, String paymentMethodId) async {
    try {
      await _firestore.collection('users').doc(userId).update({"selectedPaymentMethodId": paymentMethodId});
      return const Result.success(null);
    } catch (e) {
      if (kDebugMode) {
        print('AuthData: createUser: error: $e');
      }
      return Result.error(e.toString());
    }
  }

  Future<Result<RewardBalanceModel>> getRewardBalance(String userId, String storeId) async {
    final userDoc = await _firestore.collection("users").doc(userId).collection("rewards").doc(storeId).get();
    if (userDoc.exists) {
      return Result.success(RewardBalanceModel.fromJson(userDoc.data()!));
    }

    return Result.success(RewardBalanceModel(balance: 0, storeId: storeId));
  }

  Future<void> checkIfalreadyRegistered(String email) async {
    final coll = await _firestore.collection("users").where("studentEmail", isEqualTo: EmailUtils.normalizeEmail(email)).get();

    if (coll.docs.isNotEmpty && email != "test@kachpara.edu.tr") {
      throw Exception('$email already registered');
    }
  }

  Future<UserStore?> getUserStore(String userId, String storeId) async {
    final userDoc = await _firestore.collection("users").doc(userId).collection("stores").doc(storeId).get();

    if (userDoc.exists) {
      Map<String, dynamic> dataMap = userDoc.data()!;
      dataMap["id"] = userDoc.id;
      return UserStoreModel.fromJson(dataMap).toDomain();
    }

    return null;
  }

  Future<bool> isUserRegistered(String phoneNumber) async {
    final coll = await _firestore.collection("users").where("phoneNo", isEqualTo: phoneNumber).get();

    if (coll.docs.isNotEmpty) {
      return true;
    }

    return false;
  }

  Future<User?> getUserByPhoneNumber(String phoneNumber) async {
    final userSnapshot = await _firestore.collection("users").where("phoneNo", isEqualTo: phoneNumber).get();

    for (var doc in userSnapshot.docs) {
      return UserModel.fromJson(doc.data()).toDomain();
    }
    return null;
  }

  Future<bool> isStoreAdded(String userId, String storeId) async {
    final userDoc = await _firestore.collection("users").doc(userId).collection("stores").doc(storeId).get();

    return userDoc.exists;
  }

  Future<User?> getUser(String userId) async {
    final userDoc = await _firestore.collection("users").doc(userId).get();

    if (userDoc.exists) {
      return UserModel.fromJson(userDoc.data()!).toDomain();
    }

    return null;
  }

  Future<Map<User, UserStore>?> getUsersByStoreId(String storeId) async {
    try {
      final QuerySnapshot storeDocs = await _firestore.collectionGroup("stores").where("id", isEqualTo: storeId).get();
      if (storeDocs.docs.isNotEmpty) {
        Map<User, UserStore> usersByStore = {};
        List<Future<void>> userFetchFutures = [];

        for (var storeDoc in storeDocs.docs) {
          final userParentDoc = storeDoc.reference.parent.parent;

          if (userParentDoc == null) {
            print("Skipping document ${storeDoc.id} because parent.parent is null");
            continue;
          }

          userFetchFutures.add(_fetchUserAndStore(storeDoc, userParentDoc, usersByStore));
        }

        await Future.wait(userFetchFutures);

        return usersByStore.isNotEmpty ? usersByStore : null;
      }

      return null;
    } catch (e, stackTrace) {
      print(stackTrace);
      return null; // Handle the error as needed
    }
  }

  Future<void> _fetchUserAndStore(QueryDocumentSnapshot storeDoc, DocumentReference userParentDoc, Map<User, UserStore> usersByStore) async {
    try {
      final userParent = await userParentDoc.get();
      Map<String, dynamic>? userData = userParent.data() as Map<String, dynamic>;
      userData["id"] = userParentDoc.id;
      UserModel userModel = UserModel.fromJson(userData);
      User user = userModel.toDomain();

      Map<String, dynamic>? dataMap = storeDoc.data() as Map<String, dynamic>?;

      if (dataMap != null) {
        dataMap["id"] = storeDoc.id;
        UserStore userStore = UserStoreModel.fromJson(dataMap).toDomain();
        usersByStore[user] = userStore;
      }
    } catch (e, stackTrace) {
      print(stackTrace);
    }
  }

  Future<List<User>> getUsers(List<String> userIds) async {
    try {
      if (userIds.isEmpty) {
        return []; // No user IDs provided
      }

      final List<User> users = [];

      for (String userId in userIds) {
        final userDoc = await _firestore.collection("users").doc(userId).get();

        if (userDoc.exists) {
          users.add(UserModel.fromJson(userDoc.data()!).toDomain());
        }
      }

      return users;
    } catch (e) {
      return []; // Handle the error as needed
    }
  }

  Future<bool> updateContactUserIds(String userId, List<String> newContactUserIds) async {
    try {
      await _firestore.collection("users").doc(userId).update({
        "contactUserIds": FieldValue.arrayUnion(newContactUserIds),
      });
      return true;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<bool> updateUserStoreVisits(String userId, String storeId) async {
    try {
      await _firestore.collection("users").doc(userId).collection("stores").doc(storeId).update({
        'totalVisits': FieldValue.increment(1),
        'currentVisits': FieldValue.increment(1),
        'visits': FieldValue.arrayUnion([DateTime.now().millisecondsSinceEpoch])
      });

      return true;
    } catch (e, stackTrace) {
      print(stackTrace);
    }

    return false;
  }

  Future<int> getGlobalWaitPeriod() async {
    final doc = await _firestore.collection("configs").doc("userConfigs").get();
    int globalWaitPeriod = doc.data()?["globalWaitPeriod"];
    return globalWaitPeriod;
  }

  Future<void> deleteUser(String id) async {
    try {
      await _firestore.collection("users").doc(id).update({
        "toBeDeleted": DateTime.now(),
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
