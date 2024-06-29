import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/data/models/order_model.dart';
import 'package:kachpara/utils/result.dart';

@injectable
class OrderData {
  final FirebaseFirestore _firestore;

  OrderData(this._firestore);

  Future<Result<String>> createOrder(OrderModel order) async {
    try {
      final id = _firestore.collection('orders').doc().id;
      final orderWithId = order.copyWith(id: id);
      await _firestore.collection("orders").doc(id).set(orderWithId.toJson());
      return Result.success(id);
    } catch (e) {
      debugPrint("Error in creating order: $e");
      return Result.error(e.toString());
    }
  }

  Future<Result<List<OrderModel>>> getOrders(String userId) async {
    print("Getting active orders for user $userId");
    try {
      final orders = await _firestore.collection("orders").where("userId", isEqualTo: userId).get();
      final orderList = orders.docs.map((e) => OrderModel.fromJson(e.data())).toList();
      print("orderList: $orderList");
      return Result.success(orderList);
    } catch (e) {
      debugPrint("Error in getting orders: $e");
      return Result.error(e.toString());
    }
  }

  Future<int?> getOrdersCount(String userId, int storeId) async {
    try {
      final orders = await _firestore.collection("orders").where("userId", isEqualTo: userId).where("storeId", isEqualTo: storeId).count().get();
      return orders.count;
    } catch (e) {
      debugPrint("Error in getting orders: $e");
      return -1;
    }
  }

  Future<Result<OrderModel>> getOrder(String id) async {
    try {
      final order = await _firestore.collection("orders").doc(id).get();
      if (order.exists) {
        final data = OrderModel.fromJson(order.data()!);
        debugPrint(" order data: $data");
        return Result.success(data);
      } else {
        return const Result.error("Order not found");
      }
    } catch (e) {
      debugPrint("Error in getting order: $e");
      return Result.error(e.toString());
    }
  }

  Future<Result<bool>> checkIsFirstOrder(String userId) async {
    try {
      final orders = await _firestore.collection("orders").where("userId", isEqualTo: userId).get();

      return Result.success(orders.docs.isEmpty);
    } catch (e) {
      debugPrint("Error in getting orders: $e");
      return Result.error(e.toString());
    }
  }

  Future<DateTime> getOrderPlacementDateForOrderIds(List<String> orderIds) async {
    final ordersRef = _firestore.collection('orders');
    final querySnapshot = await ordersRef.where('id', whereIn: orderIds).orderBy('orderPlacementTime', descending: true).limit(1).get();

    if (querySnapshot.docs.isEmpty) {
      throw Exception('No order found for orderId=$orderIds');
    }

    return DateTime.parse(querySnapshot.docs.first.data()['orderPlacementTime']);
  }
}
