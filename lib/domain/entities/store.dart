import 'package:equatable/equatable.dart';

class Store extends Equatable {
  final String id;
  final String name;
  final String shortenedName; // New field for shortened name
  final bool? kachparaEnabled;
  final bool? orderEnabled;

  // final String? description;
  final String? imageFileName;
  final String address;
  final String referralCode;
  final String storeUrl;
  final String? googleMapsUrl;
  final bool? isRewardEnabled;
  final bool? isLoyaltyEnabled;
  final bool? isCompetitionEnabled;

  // final String? phone;
  // final String? email;
  // final String? website;
  final String? whatsapp;

  final String? facebookUrl;
  // final String? instagramUrl;
  final String? twitterUrl;
  final String? youtubeUrl;
  // final String? logoFileName;
  // final String? logoContentType;
  // final int? logoFileSize;
  // final String? logoUpdatedAt;
  // final String? deliveryLong;
  // final String? deliveryLongType;
  // final bool? nextDayOnly;
  // final int? orderAheadDaysLimit;
  // final int? foodPreparationTime;
  // final bool? taxEnable;
  // final double? taxValue;
  // final bool? tipEnable;
  // final String? tip;
  final String? lat;
  final String? lng;

  // final double? deliveryFee;
  // final int? deliveryTime;
  // final int? businessTypeId;
  // final int? marketplaceId;
  // final String? createdAt;
  // final String? updatedAt;
  final String currency;
  final String currencySymbol;
  final int? firstPurchaseReward;
  final int? addStoreReward;

  // final int? deliveryTimeHours;
  // final int? deliveryTimeMinutes;
  // final int? userId;
  // final int? resellerUserId;
  // final String? subDomain;
  final String? placeId;
  int visitsRewardTreshold;
  String? visitsRewardDescription;
  String? visitsRewardEarnedDescription;
  List<String> adminUserIds;

  Store({
    required this.id,
    required this.name,
    String? shortenedName, // New parameter for the shortened name
    this.kachparaEnabled,
    this.orderEnabled,
    required this.referralCode,
    required this.storeUrl,
    this.googleMapsUrl,
    // this.description,
    this.imageFileName,
    required this.address,
    // this.phone,
    // this.email,
    // this.website,
    this.facebookUrl,
    // this.instagramUrl,
    this.twitterUrl,
    this.youtubeUrl,
    this.whatsapp,
    this.isRewardEnabled,
    this.isLoyaltyEnabled,
    this.isCompetitionEnabled,
    // this.logoFileName,
    // this.logoContentType,
    // this.logoFileSize,
    // this.logoUpdatedAt,
    // this.deliveryLong,
    // this.deliveryLongType,
    // this.nextDayOnly,
    // this.orderAheadDaysLimit,
    // this.foodPreparationTime,
    // this.taxEnable,
    // this.taxValue,
    // this.tipEnable,
    // this.tip,
    this.lat,
    this.lng,
    // this.deliveryFee,
    // this.deliveryTime,
    // this.businessTypeId,
    // this.marketplaceId,
    // this.createdAt,
    // this.updatedAt,
    required this.currency,
    required this.currencySymbol,
    this.firstPurchaseReward,
    this.addStoreReward,
    // this.deliveryTimeHours,
    // this.deliveryTimeMinutes,
    // this.userId,
    // this.resellerUserId,
    // this.subDomain,
    this.placeId,
    this.visitsRewardTreshold = 100,
    this.visitsRewardDescription,
    this.visitsRewardEarnedDescription,
    this.adminUserIds = const [],
  }) : shortenedName = name.length > 20 ? '${name.substring(0, 20)}...' : name;

  @override
  List<Object?> get props => [
        id,
        name,
        shortenedName, // Include the new field in props
        kachparaEnabled,
        orderEnabled,
        referralCode,
        storeUrl,
        googleMapsUrl,
        // description,
        imageFileName,
        address,
        isRewardEnabled,
        isLoyaltyEnabled,
        isCompetitionEnabled,
        // phone,
        // email,
        // website,
        facebookUrl,
        // instagramUrl,
        twitterUrl,
        youtubeUrl,
        whatsapp,
        // logoFileName,
        // logoContentType,
        // logoFileSize,
        // logoUpdatedAt,
        // deliveryLong,
        // deliveryLongType,
        // nextDayOnly,
        // orderAheadDaysLimit,
        // foodPreparationTime,
        // taxEnable,
        // taxValue,
        // tipEnable,
        // tip,
        lat,
        lng,
        // deliveryFee,
        // deliveryTime,
        // businessTypeId,
        // marketplaceId,
        // createdAt,
        // updatedAt,
        currency,
        currencySymbol,
        firstPurchaseReward,
        addStoreReward,
        // deliveryTimeHours,
        // deliveryTimeMinutes,
        // userId,
        // resellerUserId,
        // subDomain,
        placeId,
        visitsRewardTreshold,
        visitsRewardDescription,
        visitsRewardEarnedDescription,
        adminUserIds,
      ];
}
