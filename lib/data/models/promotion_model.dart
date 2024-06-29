import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kachpara/data/models/product_model.dart';
import 'package:kachpara/domain/entities/product.dart';
import 'package:kachpara/utils/timestamp_to_datetime.dart';

import '../../domain/entities/promotion.dart';

part 'promotion_model.freezed.dart';
part 'promotion_model.g.dart';

@freezed
class PromotionModel with _$PromotionModel {
  PromotionModel._();
  factory PromotionModel(
      {required String id,
      required String title,
      String? description,
      required double discountAmount,
      required String type,
      required int orderLimit,
      double? minimumPurchaseAmount,
      required List<ProductModel> products,
      @DateTimeConverter() DateTime? startDate,
      @DateTimeConverter() DateTime? endDate,
      required String storeName,
      String? currentSponsor,
      String? currentSponsorURL,
      // dynamic because we support legacy storeIds in firestore with int type
      required dynamic storeId,
      required bool isEnabled,
      int? claimBeginTime,
      int? claimEndTime,
      bool? isClaimAnytime,
      List<String>? beneficiaryList,
      int? totalDonations,
      int? claimedDonations,
      int? waitPeriodInMinutes}) = _PromotionModel;

  factory PromotionModel.fromJson(Map<String, dynamic> json) => _$PromotionModelFromJson(json);

  factory PromotionModel.fromDomain(Promotion promotion) {
    return PromotionModel(
      id: promotion.id,
      title: promotion.title,
      description: promotion.description,
      discountAmount: promotion.discountAmount,
      orderLimit: promotion.orderLimit,
      products: PromotionModel.fromDomain(promotion).products,
      type: promotion.type,
      minimumPurchaseAmount: promotion.minimumPurchaseAmount,
      startDate: promotion.startDate,
      endDate: promotion.endDate,
      storeName: promotion.storeName,
      currentSponsor: promotion.currentSponsor,
      currentSponsorURL: promotion.currentSponsorURL,
      storeId: promotion.storeId is int
          ? promotion.storeId
          : int.tryParse(promotion.storeId) ?? 0,
      isEnabled: promotion.isEnabled,
      claimBeginTime: promotion.claimBeginTime,
      claimEndTime: promotion.claimEndTime,
      isClaimAnytime: promotion.isClaimAnytime,
      beneficiaryList: promotion.beneficiaryList,
      totalDonations: promotion.totalDonations,
      claimedDonations: promotion.claimedDonations,
      waitPeriodInMinutes: promotion.waitPeriodInMinutes,
    );
  }

  Promotion toDomain() {
    return Promotion(
      id: id,
      title: title,
      description: description,
      discountAmount: discountAmount,
      products: products.map<Product>((p) => Product.fromModel(p)).toList(),
      type: type,
      orderLimit: orderLimit,
      minimumPurchaseAmount: minimumPurchaseAmount,
      storeName: storeName,
      currentSponsor: currentSponsor,
      currentSponsorURL: currentSponsorURL,
      storeId: storeId.toString(),
      isEnabled: isEnabled,
      startDate: startDate,
      endDate: endDate,
      claimBeginTime: claimBeginTime,
      claimEndTime: claimEndTime,
      isClaimAnytime: isClaimAnytime,
      beneficiaryList: beneficiaryList,
      totalDonations: totalDonations,
      claimedDonations: claimedDonations,
      waitPeriodInMinutes: waitPeriodInMinutes,
    );
  }
}
