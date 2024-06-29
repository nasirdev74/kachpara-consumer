import 'package:equatable/equatable.dart';
import 'package:kachpara/domain/entities/product.dart';

class Promotion extends Equatable {
  final String id;
  final String type;
  final double discountAmount;
  final String title;
  final String? description;
  final int orderLimit;
  final List<Product> products;
  final double? minimumPurchaseAmount;
  final DateTime? startDate;
  final DateTime? endDate;
  final String storeName;
  final String storeId;
  final String? currentSponsor;
  final String? currentSponsorURL;
  final bool isEnabled;
  final bool? isApplied;
  final bool? isClaimAnytime;
  final int? claimBeginTime;
  final int? claimEndTime;
  final List<String>? beneficiaryList;
  final int? totalDonations;
  final int? claimedDonations;
  final int? waitPeriodInMinutes;

  const Promotion(
      {required this.title,
      required this.products,
      this.description,
      this.minimumPurchaseAmount,
      required this.id,
      required this.orderLimit,
      this.startDate,
      this.isApplied,
      this.endDate,
      required this.storeName,
      required this.storeId,
      required this.type,
      required this.discountAmount,
      required this.isEnabled,
      this.currentSponsor,
      this.currentSponsorURL,
      this.isClaimAnytime,
      this.claimBeginTime,
      this.claimEndTime,
      this.beneficiaryList,
      this.totalDonations,
      this.claimedDonations,
      this.waitPeriodInMinutes});

  @override
  List<Object?> get props => [
        id,
        type,
        discountAmount,
        minimumPurchaseAmount,
        title,
        products,
        orderLimit,
        description,
        startDate,
        endDate,
        storeName,
        storeId,
        currentSponsor,
        currentSponsorURL,
        isApplied,
        isEnabled,
        claimBeginTime,
        claimEndTime,
        isClaimAnytime,
        beneficiaryList,
        totalDonations,
        claimedDonations,
        waitPeriodInMinutes
      ];

  Promotion copyWith(
      {String? id,
      String? type,
      double? discountAmount,
      double? minimumPurchaseAmount,
      String? title,
      String? description,
      int? orderLimit,
      List<Product>? products,
      DateTime? startDate,
      DateTime? endDate,
      String? storeName,
      String? currentSponsor,
      String? currentSponsorURL,
      String? storeId,
      bool? isApplied,
      bool? isEnabled,
      int? claimBeginTime,
      int? claimEndTime,
      bool? isClaimAnytime,
      List<String>? beneficiaryList,
      int? totalDonations,
      int? claimedDonations,
      int? waitPeriodInMinutes}) {
    return Promotion(
      id: id ?? this.id,
      type: type ?? this.type,
      discountAmount: discountAmount ?? this.discountAmount,
      minimumPurchaseAmount: minimumPurchaseAmount ?? this.minimumPurchaseAmount,
      title: title ?? this.title,
      products: products ?? this.products,
      orderLimit: orderLimit ?? this.orderLimit,
      description: description ?? this.description,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      storeName: storeName ?? this.storeName,
      currentSponsor: currentSponsor ?? this.currentSponsor,
      currentSponsorURL: currentSponsorURL ?? this.currentSponsorURL,
      storeId: storeId ?? this.storeId,
      isApplied: isApplied ?? this.isApplied,
      isEnabled: isEnabled ?? this.isEnabled,
      claimBeginTime: claimBeginTime ?? this.claimBeginTime,
      claimEndTime: claimEndTime ?? this.claimEndTime,
      isClaimAnytime: isClaimAnytime ?? this.isClaimAnytime,
      beneficiaryList: beneficiaryList ?? this.beneficiaryList,
      totalDonations: totalDonations ?? this.totalDonations,
      claimedDonations: claimedDonations ?? this.claimedDonations,
      waitPeriodInMinutes: waitPeriodInMinutes ?? this.waitPeriodInMinutes,
    );
  }
}
