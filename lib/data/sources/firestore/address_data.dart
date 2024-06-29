import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/data/models/address_model.dart';
import 'package:kachpara/utils/result.dart';

@injectable
class AddressData {
  final FirebaseFirestore _firestore;

  AddressData(this._firestore);

  Future<Result<AddressModel>> addAddress(String userId, AddressModel address) async {
    try {
      //generate doc id
      final id = _firestore.collection("_").doc().id;
      final data = address.copyWith(id: id).toJson();
      await _firestore.collection("users").doc(userId.toString()).collection("addresses").doc(id).set(data);
      return Result.success(AddressModel.fromJson(data));
    } catch (e) {
      debugPrint("addAddress: $e");
      return Result.error("catched error: $e");
    }
  }

  Future<Result<void>> updateAddress(String userId, AddressModel address) async {
    try {
      final data = address.toJson();
      await _firestore.collection("users").doc(userId.toString()).collection("addresses").doc(address.id).update(data);
      return const Result.success(null);
    } catch (e) {
      debugPrint("updateAddress: $e");
      return Result.error("catched error: $e");
    }
  }

  Future<Result<void>> deleteAddress(String userId, String id) async {
    try {
      await _firestore.collection("users").doc(userId.toString()).collection("addresses").doc(id).delete();
      return const Result.success(null);
    } catch (e) {
      debugPrint("deleteAddress: $e");
      return Result.error("catched error: $e");
    }
  }

  Future<Result<List<AddressModel>>> getAddresses(String userId) async {
    try {
      final coll = await _firestore.collection("users").doc(userId.toString()).collection("addresses").get();

      final data = coll.docs.map((e) => AddressModel.fromJson(e.data())).toList(growable: false);
      return Result.success(data);
    } on Exception catch (e) {
      debugPrint("getAddresses: $e");
      return Result.error("catched error: $e");
    }
  }

  Future<Result<void>> setSelectedAddress(String userId, addressId) async {
    try {
      await _firestore.collection("users").doc(userId.toString()).update({"selectedAddressId": addressId});

      return const Result.success(null);
    } on Exception catch (e) {
      debugPrint("getAddresses: $e");
      return Result.error("catched error: $e");
    }
  }

  Future<Result<AddressModel>> getSelectedAddress(String? userId, String? addressId) async {
    try {
      final coll = await _firestore.collection("users").doc(userId.toString()).collection("addresses").doc(addressId).get();

      return Result.success(AddressModel.fromJson(coll.data()!));
    } on Exception catch (e) {
      debugPrint("getSelectedAddress: $e");
      return Result.error("catched error: $e");
    }
  }
}
