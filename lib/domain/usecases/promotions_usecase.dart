import 'package:injectable/injectable.dart';
import 'package:kachpara/app/user_bloc/user_bloc.dart';
import 'package:kachpara/core/injector.dart';
import 'package:kachpara/data/sources/firestore/order_data.dart';
import 'package:kachpara/data/sources/firestore/promotions_data.dart';
import 'package:kachpara/domain/entities/store.dart';

import '../../utils/result.dart';
import '../entities/promotion.dart';

@injectable
class PromotionUseCase {
  final PromotionsData _promotionsData;
  final OrderData _orderData;

  PromotionUseCase(this._promotionsData, this._orderData);

  Future<Result<List<Promotion>>> getPromotions(String storeId) async {
    final result = await _promotionsData.getPromotions(storeId);
    return result.when(
        success: ((data) async {
          final promotions = data.map((e) => e.toDomain()).toList();
          // final idsToRemove = await usedPromotionIds();
          DateTime currentDate = DateTime.now();

          //apply filters
          List<Promotion> filteredPromotions = promotions
              .where((promotion) =>
                      // !idsToRemove.contains(
                      //     promotion.id) && // ID is not in the idsToRemove list
                      promotion.isEnabled && // promotion is enabled
                      promotion.startDate!.isBefore(currentDate) && // promotion has started
                      (promotion.endDate == null || promotion.endDate!.isAfter(currentDate)) // promotion has not ended
                  )
              .toList();

          return Result.success(filteredPromotions);
        }),
        error: (e) => Result.error(e));
  }

  Future<Result<Promotion>> getPromotion(String storeId, String promotionId) async {
    final result = await _promotionsData.getPromotion(storeId, promotionId);
    return result.when(success: (promotion) => Result.success(promotion.toDomain()), error: (e) => Result.error(e));
  }

  Future<Result<Promotion?>> getActivePromotion(String userId, String storeId) async {
    final result = await _promotionsData.getActivePromotion(userId, storeId);
    return result.when(success: (promotion) => Result.success((promotion != null) ? promotion.toDomain() : null), error: (e) => Result.error(e));
  }

  Future<Result<Promotion?>> getFreePromotion(String storeId) async {
    final result = await _promotionsData.getFreePromotion(storeId);
    return result.when(success: (promotion) => Result.success((promotion != null) ? promotion.toDomain() : null), error: (e) => Result.error(e));
  }

  Future<Result<Map<Store, List<Promotion>>>> getPromotionsByUser(List<Store> stores) async {
    final storePromotionsMap = <Store, List<Promotion>>{};
    for (var store in stores) {
      final result = await getPromotions(store.id);
      result.when(
          success: (promotions) {
            storePromotionsMap.putIfAbsent(store, () => promotions);
          },
          error: (e) => Result.error(e));
    }
    return Result.success(storePromotionsMap);
  }

  Future<void> claimPromotion(String userId, String orderId, String storeId, Promotion promotion) async {
    await _promotionsData.claimPromotion(userId, orderId, storeId, promotion.id);
    if (promotion.type == "FREE") {
      await _promotionsData.addFreePromotionEntries(userId, orderId, storeId, promotion.id);
    }
  }

  Future<List<String>> usedPromotionIds() async {
    final userId = getIt<UserBloc>().state.user?.id;
    if (userId != null) {
      final result = await _promotionsData.usedPromotionIds(userId);
      return result.when(
          success: (data) => data,
          error: (e) {
            print(e);
            return [];
          });
    } else {
      return [];
    }
  }

  Future<void> addDonation(String storeId, String orderId, int quantity, String promotionId) async {
    await _promotionsData.addDonation(storeId, orderId, quantity, promotionId);
  }

  Future<DateTime?> getWaitPeriodOverDateForPromotion(String storeId , String promotionId, int waitPeriodMinutes) async {
    final userId = getIt<UserBloc>().state.user?.id;
    final orderIds = await _promotionsData.getOrderIdsForPromotion(userId!, storeId, promotionId);
    if (orderIds.isEmpty) return null; // first usage of promotion.
    final latestOrderPlacementDate = await _orderData.getOrderPlacementDateForOrderIds(orderIds);
    final waitPeriodOverDate = latestOrderPlacementDate.add(Duration(minutes: waitPeriodMinutes));

    if (waitPeriodOverDate.isAfter(DateTime.now())) {
      return waitPeriodOverDate;
    }

    return null;
  }
}
