import 'package:injectable/injectable.dart';
import 'package:kachpara/app/store_bloc/store_bloc.dart';
import 'package:kachpara/data/models/order_model.dart';
import 'package:kachpara/data/sources/firestore/earnings_and_reward_usage_data.dart';
import 'package:kachpara/data/sources/firestore/order_data.dart';
import 'package:kachpara/domain/entities/address.dart';
import 'package:kachpara/domain/entities/payment_card.dart';
import 'package:kachpara/domain/entities/reward_usage.dart';
import 'package:kachpara/domain/entities/store.dart';
import 'package:kachpara/domain/usecases/payment_usecase.dart';
import 'package:kachpara/domain/usecases/promotions_usecase.dart';
import 'package:flutter_stripe/flutter_stripe.dart' as stripe;

import '../../app/cart_bloc/cart_bloc.dart';
import '../../app/user_bloc/user_bloc.dart';
import '../../core/injector.dart';
import '../../utils/result.dart';
import '../entities/cart_item.dart';
import '../entities/order.dart';
import '../entities/promotion.dart';

@injectable
class OrderUseCase {
  const OrderUseCase(this._orderData, this._paymentUsecases, this._promotionUseCase, this._earningsAndRewardUsagedata);
  final OrderData _orderData;
  final PaymentUsecases _paymentUsecases;
  final PromotionUseCase _promotionUseCase;

  final EarningsAndRewardUsagedata _earningsAndRewardUsagedata;

  Future<Result<String>> placeOrder(
      {required Address address,
      required double total,
      required PaymentCard selectedPaymentcard,
      Promotion? promotion,
      Promotion? freePromotion,
      bool? useRewardPoints,
      required bool isGift,
      String? giftTo,
      required Store store,
      required List<CartItem> items,
      required DateTime foodReceivingTime,
      required bool isDelivery,
      String? notes,
      required bool donationOnly,
      String? curationId}) async {
    try {
      final paymentintent = await _paymentUsecases.payWithCard(currency: store.currency, selectedPaymentCard: selectedPaymentcard, total: total);
      final confirmPaymentResult = await stripe.Stripe.instance.confirmPayment(paymentIntentClientSecret: paymentintent.client_secret);
      print(confirmPaymentResult);
      final user = getIt<UserBloc>().state.user;
      final order = Order(
          id: "",
          userId: user!.id,
          storeId: store.id,
          address: address,
          storeName: store.name,
          items: items,
          orderStatus: (donationOnly || isGift) ? "COMPLETED" : "ACTIVE",
          totalAmount: total,
          userName: user.name ?? "",
          currency: store.currency,
          currencySymbol: store.currencySymbol,
          useRewardPoints: useRewardPoints ?? false,
          paymentIntentId: paymentintent.id,
          orderPlacementTime: DateTime.now(),
          isDelivery: isDelivery,
          deliveryTime: isDelivery ? foodReceivingTime : DateTime(1970),
          isPickup: !isDelivery,
          pickupTime: isDelivery ? DateTime(1970) : foodReceivingTime,
          pickupAddress: store.address,
          notes: notes,
          curationId: curationId,
          giftTo: giftTo);
      final result = await _orderData.createOrder(OrderModel.fromDomain(order));
      return await result.when(success: (orderId) async {
        if (promotion != null) {
          await _promotionUseCase.claimPromotion(user.id, orderId, store.id, promotion);
        }

        if (giftTo == null && freePromotion != null) {
          for (var cartItem in items) {
            if (cartItem.product.id == freePromotion.products.first.id) {
              _promotionUseCase.addDonation(store.id.toString(), orderId, cartItem.quantity, freePromotion.id);
              break;
            }
          }
        }

        if (useRewardPoints == true) {
          await _earningsAndRewardUsagedata.addRewardUsage(
              user.id, RewardUsage(id: "", orderId: orderId, storeName: store.name, amount: user.rewardPoints, createdAt: DateTime.now()));
        }
        getIt<CartBloc>().add(const CartEvent.clearCart());
        return Result.success(orderId);
      }, error: (error) {
        return Result.error(error);
      });
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<Result<String>> placeFreeOrder({
    required Address address,
    required double total,
    PaymentCard? selectedPaymentcard,
    Promotion? promotion,
    bool? useRewardPoints,
    required String storeId,
    required List<CartItem> items,
    required DateTime foodReceivingTime,
    required bool isDelivery,
  }) async {
    try {
      final store = getIt<StoreBloc>().state.stores.firstWhere((element) => element.id == storeId, orElse: () => throw Exception('Store not found'));

      final user = getIt<UserBloc>().state.user;
      final order = Order(
        id: "",
        userId: user!.id,
        storeId: storeId,
        address: address,
        storeName: store.name,
        items: items,
        orderStatus: "ACTIVE",
        totalAmount: total,
        userName: user.name ?? "",
        currency: store.currency,
        currencySymbol: store.currencySymbol,
        useRewardPoints: useRewardPoints ?? false,
        orderPlacementTime: DateTime.now(),
        isDelivery: isDelivery,
        deliveryTime: isDelivery ? foodReceivingTime : DateTime(1970),
        isPickup: !isDelivery,
        pickupTime: isDelivery ? DateTime(1970) : foodReceivingTime,
        pickupAddress: store.address,
      );
      final result = await _orderData.createOrder(OrderModel.fromDomain(order));
      return await result.when(success: (data) async {
        if (promotion != null) {
          await _promotionUseCase.claimPromotion(user.id, data, storeId, promotion);
        }
        if (useRewardPoints == true) {
          await _earningsAndRewardUsagedata.addRewardUsage(
              user.id, RewardUsage(id: "", orderId: data, storeName: store.name, amount: user.rewardPoints, createdAt: DateTime.now()));
        }
        getIt<CartBloc>().add(const CartEvent.clearCart());
        return Result.success(data);
      }, error: (error) {
        return Result.error(error);
      });
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<Result<List<Order>>> getOrders() async {
    final user = getIt<UserBloc>().state.user;
    final result = await _orderData.getOrders(user!.id);
    return result.when(success: (data) {
      return Result.success(data.map((e) => e.toDomain()).toList());
    }, error: (error) {
      return Result.error(error);
    });
  }

  Future<int?> getOrdersCount(int storeId) async {
    final user = getIt<UserBloc>().state.user;
    return await _orderData.getOrdersCount(user!.id, storeId);
  }

  Future<Result<Order>> getOrder(String id) async {
    final result = await _orderData.getOrder(id);
    return result.when(success: (order) {
      return Result.success(order.toDomain());
    }, error: (error) {
      return Result.error(error);
    });
  }

  Future<Result<bool>> checkIsFirstOrder() async {
    final user = getIt<UserBloc>().state.user;
    final result = await _orderData.checkIsFirstOrder(user!.id);
    return result.when(success: (isFirstOrder) {
      return Result.success(isFirstOrder);
    }, error: (error) {
      return Result.error(error);
    });
  }
}
