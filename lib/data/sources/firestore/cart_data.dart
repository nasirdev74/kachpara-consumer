import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/data/models/cart_model.dart';

import '../../../utils/result.dart';
import '../../models/cart_item_model.dart';

@injectable
class CartData {
  CartData(this._firestore);

  final FirebaseFirestore _firestore;

  Future<Result<CartModel?>> getCart({required String userId}) async {
    try {
      final coll = await _firestore.collection("users").doc(userId.toString()).collection("cart").get();
      if (coll.docs.first.exists) {
        print("cart store id ${coll.docs.first.id}");
        final data = CartModel(
            restaurantId: (coll.docs.first.id),
            items: (coll.docs.first.data()["items"] as List).map((e) {
              return CartItemModel.fromJson(e);
            }).toList());

        return Result.success(data);
      } else {
        return const Result.success(null);
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print("getcart catched error : $e");
      }
      return Result.error("catched error: $e");
    }
  }

  Future<Result<void>> addCartItem(String userId, CartItemModel cartItem, String restaurantId, String? curationId) async {
    try {
      final Map<String, dynamic> data = {
        "items": FieldValue.arrayUnion([cartItem.toJson()]),
        "curationId": curationId
      };

      if (kDebugMode) {
        print("data: $data");
      }
      await _firestore.collection("users").doc(userId.toString()).collection("cart").doc(restaurantId.toString()).set(data, SetOptions(merge: true));
      return const Result.success(null);
    } catch (e) {
      if (kDebugMode) {
        print("addcartitem catched error : $e");
      }
      return Result.error("catched error: $e");
    }
  }

  Future<Result<void>> deleteCartItem(String userId, CartItemModel cartItem, String storeId) async {
    try {
      final Map<String, dynamic> data = {
        "items": FieldValue.arrayRemove([cartItem.toJson()])
      };
      final docRef = _firestore.collection("users").doc(userId.toString()).collection("cart").doc(storeId.toString());

      await _firestore.runTransaction((transaction) async {
        final doc = await transaction.get(docRef);
        if (doc.exists) {
          final items = (doc.data()!["items"] as List).map((e) {
            return CartItemModel.fromJson(e);
          }).toList();
          final item = items.firstWhere((element) => element.id == cartItem.id);
          final index = items.indexOf(item);
          items.removeAt(index);
          transaction.update(docRef, {"items": items.map((e) => e.toJson()).toList()});
        }
      });
      return const Result.success(null);
    } on Exception catch (e) {
      if (kDebugMode) {
        print("deletecartitem catched error : $e");
      }
      return Result.error("catched error: $e");
    }
  }

  Future<Result<void>> deleteCart(String userId, String storeId) async {
    try {
      await _firestore.collection("users").doc(userId.toString()).collection("cart").doc(storeId.toString()).delete();

      return const Result.success(null);
    } on Exception catch (e) {
      if (kDebugMode) {
        print("deletecart catched error : $e");
      }
      return Result.error("catched error: $e");
    }
  }

  Future<Result<void>> decreaseCartItemQuantity(
    String userId,
    int cartItemId,
    String storeId,
  ) async {
    try {
      final docRef = _firestore.collection("users").doc(userId.toString()).collection("cart").doc(storeId.toString());

      await _firestore.runTransaction((transaction) async {
        final doc = await transaction.get(docRef);
        if (doc.exists) {
          final items = (doc.data()!["items"] as List).map((e) {
            return CartItemModel.fromJson(e);
          }).toList();
          final item = items.firstWhere((element) => element.id == cartItemId);
          final index = items.indexOf(item);
          items.removeAt(index);
          items.insert(index, item.copyWith(quantity: item.quantity - 1));
          transaction.update(docRef, {"items": items.map((e) => e.toJson()).toList()});
        }
      });
      return const Result.success(null);
    } catch (e) {
      if (kDebugMode) {
        print("decreasecartitemquantity catched error : $e");
      }
      return Result.error("catched error: $e");
    }
  }

  Future<Result<void>> incrementCartItemQuantity(
    String userId,
    int cartItemId,
    String storeId,
  ) async {
    try {
      final docRef = _firestore.collection("users").doc(userId.toString()).collection("cart").doc(storeId.toString());

      await _firestore.runTransaction((transaction) async {
        final doc = await transaction.get(docRef);
        if (doc.exists) {
          final items = (doc.data()!["items"] as List).map((e) {
            return CartItemModel.fromJson(e);
          }).toList();
          final item = items.firstWhere((element) => element.id == cartItemId);
          final index = items.indexOf(item);
          items.removeAt(index);
          items.insert(index, item.copyWith(quantity: item.quantity + 1));
          transaction.update(docRef, {"items": items.map((e) => e.toJson()).toList()});
        }
      });
      return const Result.success(null);
    } catch (e) {
      if (kDebugMode) {
        print("incrementcartitemquantity catched error : $e");
      }
      return Result.error("catched error: $e");
    }
  }
}
