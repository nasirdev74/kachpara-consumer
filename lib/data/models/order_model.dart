import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kachpara/data/models/order_product_model.dart';
import 'package:kachpara/domain/entities/address.dart';
import 'package:kachpara/domain/entities/order.dart' as lo;

part 'order_model.freezed.dart';

part 'order_model.g.dart';

@freezed
class OrderModel with _$OrderModel {
  OrderModel._();

  factory OrderModel({
    required String id,
    required String userId,
    required String userName,
    required String? currency,
    required String? currencySymbol,
    required String storeId,
    required String storeName,
    required String orderStatus,
    required String address,
    String? notes,
    String? curationId,
    String? giftTo,
    @JsonKey(toJson: productsToJson) required List<OrderProductModel> product,
    required double totalAmount,
    String? paymentIntentId,
    String? pickupAddress,
    required bool isDelivery,
    required bool isPickup,
    @TimestampConverter() required Timestamp deliveryTime,
    @TimestampConverter() required Timestamp pickupTime,
    @TimestampConverter() required Timestamp orderPlacementTime,
    @Default(false) bool useRewardPoints,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);

  factory OrderModel.fromDomain(lo.Order order) {
    return OrderModel(
      id: order.id,
      userId: order.userId,
      storeId: order.storeId,
      storeName: order.storeName,
      orderStatus: order.orderStatus,
      userName: order.userName,
      notes: order.notes,
      currency: order.currency,
      currencySymbol: order.currencySymbol,
      address: order.address.address,
      product: order.items.map((e) => OrderProductModel.fromCartItem(e)).toList(),
      totalAmount: order.totalAmount,
      paymentIntentId: order.paymentIntentId,
      orderPlacementTime: Timestamp.fromDate(order.orderPlacementTime),
      useRewardPoints: order.useRewardPoints,
      isDelivery: order.isDelivery,
      deliveryTime: Timestamp.fromDate(order.deliveryTime!),
      isPickup: order.isPickup,
      pickupTime: Timestamp.fromDate(order.pickupTime!),
      pickupAddress: order.pickupAddress,
      curationId: order.curationId,
      giftTo: order.giftTo,
    );
  }

  lo.Order toDomain() => lo.Order(
        id: id,
        userId: userId,
        storeId: storeId,
        storeName: storeName,
        notes: notes,
        userName: userName,
        orderStatus: orderStatus,
        currency: currency,
        currencySymbol: currencySymbol,
        address: stringToAddress(address),
        items: product.map((e) => e.toCartItem()).toList(),
        totalAmount: totalAmount,
        paymentIntentId: paymentIntentId,
        orderPlacementTime: orderPlacementTime.toDate(),
        useRewardPoints: useRewardPoints,
        isDelivery: isDelivery,
        deliveryTime: deliveryTime.toDate(),
        isPickup: isPickup,
        pickupTime: pickupTime.toDate(),
        pickupAddress: pickupAddress,
        curationId: curationId,
        giftTo: giftTo,
      );
}

Address stringToAddress(String address) {
  return Address(
    id: "",
    name: "FIXME",
    address: address,
    direction: "FIXME",
  );
}

productsToJson(List<OrderProductModel> products) => products.map((e) => e.toJson()).toList();

class TimestampConverter implements JsonConverter<Timestamp, String> {
  const TimestampConverter();

  @override
  Timestamp fromJson(String json) {
    return Timestamp.fromDate(DateTime.parse(json));
  }

  @override
  String toJson(Timestamp object) {
    return object.toDate().toIso8601String();
  }
}
