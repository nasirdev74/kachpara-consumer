import 'package:equatable/equatable.dart';
import 'package:kachpara/domain/entities/address.dart';
import 'package:kachpara/domain/entities/cart_item.dart';

class Order extends Equatable {
  final String id;
  final String userId;
  final Address address;
  final List<CartItem> items;
  final String? paymentIntentId;
  final DateTime orderPlacementTime;
  final double totalAmount;
  final String storeId;
  final String userName;
  final String? currency;
  final String? currencySymbol;
  final String orderStatus;
  final String? notes;
  final String storeName;
  final bool useRewardPoints;
  final bool isDelivery;
  final DateTime? deliveryTime;
  final bool isPickup;
  final DateTime? pickupTime;
  final String? pickupAddress;
  final String? curationId;
  final String? giftTo;

  const Order({
    required this.id,
    required this.storeId,
    required this.storeName,
    required this.userId,
    required this.address,
    required this.items,
    required this.totalAmount,
    this.paymentIntentId,
    required this.orderPlacementTime,
    required this.userName,
    required this.orderStatus,
    required this.isDelivery,
    this.notes,
    this.currency,
    this.currencySymbol,
    this.useRewardPoints = false,
    this.deliveryTime,
    required this.isPickup,
    this.pickupTime,
    this.pickupAddress,
    this.curationId,
    this.giftTo,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        address,
        storeId,
        storeName,
        notes,
        items,
        paymentIntentId,
        orderPlacementTime,
        totalAmount,
        userName,
        currency,
        currencySymbol,
        orderStatus,
        useRewardPoints,
        isDelivery,
        deliveryTime,
        pickupTime,
        curationId,
        giftTo,
      ];
}
