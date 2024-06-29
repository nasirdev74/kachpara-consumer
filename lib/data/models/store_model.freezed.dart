// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StoreModel _$StoreModelFromJson(Map<String, dynamic> json) {
  return _Store.fromJson(json);
}

/// @nodoc
mixin _$StoreModel {
  String get id => throw _privateConstructorUsedError;
  bool? get kachparaEnabled => throw _privateConstructorUsedError;
  bool? get orderEnabled =>
      throw _privateConstructorUsedError; // int? businessTypeId,
// int? marketplaceId,
// String? createdAt,
// String? updatedAt,
  String get currency => throw _privateConstructorUsedError;
  String get currencySymbol => throw _privateConstructorUsedError;
  int? get firstPurchaseReward => throw _privateConstructorUsedError;
  int? get addStoreReward =>
      throw _privateConstructorUsedError; // int? deliveryTimeHours,
// int? deliveryTimeMinutes,
  String? get facebook =>
      throw _privateConstructorUsedError; // String? instagram,
  String? get twitter => throw _privateConstructorUsedError;
  String? get whatsapp => throw _privateConstructorUsedError;
  bool? get isRewardEnabled => throw _privateConstructorUsedError;
  bool? get isLoyaltyEnabled => throw _privateConstructorUsedError;
  bool? get isCompetitionEnabled => throw _privateConstructorUsedError;
  String? get youtube =>
      throw _privateConstructorUsedError; // String? location,
  String get name => throw _privateConstructorUsedError;
  String get referralCode => throw _privateConstructorUsedError;
  String get storeUrl => throw _privateConstructorUsedError;
  String? get googleMapsUrl => throw _privateConstructorUsedError;
  String? get imageFileName =>
      throw _privateConstructorUsedError; // String? phone,
// int? userId,
// int? resellerUserId,
// String? subDomain,
// String? logoFileName,
// String? logoContentType,
// int? logoFileSize,
// String? logoUpdatedAt,
// String? deliveryLong,
// String? deliveryLongType,
// bool? nextDayOnly,
// int? orderAheadDaysLimit,
// int? foodPreparationTime,
// bool? taxEnable,
// double? taxValue,
// bool? tipEnable,
// String? tip,
  String? get lat => throw _privateConstructorUsedError;
  String? get lng => throw _privateConstructorUsedError; // double? deliveryFee,
// int? deliveryTime,
  String get address => throw _privateConstructorUsedError;
  String? get placeId => throw _privateConstructorUsedError;
  int get visitsRewardTreshold => throw _privateConstructorUsedError;
  String? get visitsRewardDescription => throw _privateConstructorUsedError;
  String? get visitsRewardEarnedDescription =>
      throw _privateConstructorUsedError;
  List<String> get adminUserIds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoreModelCopyWith<StoreModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreModelCopyWith<$Res> {
  factory $StoreModelCopyWith(
          StoreModel value, $Res Function(StoreModel) then) =
      _$StoreModelCopyWithImpl<$Res, StoreModel>;
  @useResult
  $Res call(
      {String id,
      bool? kachparaEnabled,
      bool? orderEnabled,
      String currency,
      String currencySymbol,
      int? firstPurchaseReward,
      int? addStoreReward,
      String? facebook,
      String? twitter,
      String? whatsapp,
      bool? isRewardEnabled,
      bool? isLoyaltyEnabled,
      bool? isCompetitionEnabled,
      String? youtube,
      String name,
      String referralCode,
      String storeUrl,
      String? googleMapsUrl,
      String? imageFileName,
      String? lat,
      String? lng,
      String address,
      String? placeId,
      int visitsRewardTreshold,
      String? visitsRewardDescription,
      String? visitsRewardEarnedDescription,
      List<String> adminUserIds});
}

/// @nodoc
class _$StoreModelCopyWithImpl<$Res, $Val extends StoreModel>
    implements $StoreModelCopyWith<$Res> {
  _$StoreModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? kachparaEnabled = freezed,
    Object? orderEnabled = freezed,
    Object? currency = null,
    Object? currencySymbol = null,
    Object? firstPurchaseReward = freezed,
    Object? addStoreReward = freezed,
    Object? facebook = freezed,
    Object? twitter = freezed,
    Object? whatsapp = freezed,
    Object? isRewardEnabled = freezed,
    Object? isLoyaltyEnabled = freezed,
    Object? isCompetitionEnabled = freezed,
    Object? youtube = freezed,
    Object? name = null,
    Object? referralCode = null,
    Object? storeUrl = null,
    Object? googleMapsUrl = freezed,
    Object? imageFileName = freezed,
    Object? lat = freezed,
    Object? lng = freezed,
    Object? address = null,
    Object? placeId = freezed,
    Object? visitsRewardTreshold = null,
    Object? visitsRewardDescription = freezed,
    Object? visitsRewardEarnedDescription = freezed,
    Object? adminUserIds = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      kachparaEnabled: freezed == kachparaEnabled
          ? _value.kachparaEnabled
          : kachparaEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      orderEnabled: freezed == orderEnabled
          ? _value.orderEnabled
          : orderEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      currencySymbol: null == currencySymbol
          ? _value.currencySymbol
          : currencySymbol // ignore: cast_nullable_to_non_nullable
              as String,
      firstPurchaseReward: freezed == firstPurchaseReward
          ? _value.firstPurchaseReward
          : firstPurchaseReward // ignore: cast_nullable_to_non_nullable
              as int?,
      addStoreReward: freezed == addStoreReward
          ? _value.addStoreReward
          : addStoreReward // ignore: cast_nullable_to_non_nullable
              as int?,
      facebook: freezed == facebook
          ? _value.facebook
          : facebook // ignore: cast_nullable_to_non_nullable
              as String?,
      twitter: freezed == twitter
          ? _value.twitter
          : twitter // ignore: cast_nullable_to_non_nullable
              as String?,
      whatsapp: freezed == whatsapp
          ? _value.whatsapp
          : whatsapp // ignore: cast_nullable_to_non_nullable
              as String?,
      isRewardEnabled: freezed == isRewardEnabled
          ? _value.isRewardEnabled
          : isRewardEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLoyaltyEnabled: freezed == isLoyaltyEnabled
          ? _value.isLoyaltyEnabled
          : isLoyaltyEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCompetitionEnabled: freezed == isCompetitionEnabled
          ? _value.isCompetitionEnabled
          : isCompetitionEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      youtube: freezed == youtube
          ? _value.youtube
          : youtube // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      referralCode: null == referralCode
          ? _value.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String,
      storeUrl: null == storeUrl
          ? _value.storeUrl
          : storeUrl // ignore: cast_nullable_to_non_nullable
              as String,
      googleMapsUrl: freezed == googleMapsUrl
          ? _value.googleMapsUrl
          : googleMapsUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      imageFileName: freezed == imageFileName
          ? _value.imageFileName
          : imageFileName // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String?,
      lng: freezed == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as String?,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      placeId: freezed == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String?,
      visitsRewardTreshold: null == visitsRewardTreshold
          ? _value.visitsRewardTreshold
          : visitsRewardTreshold // ignore: cast_nullable_to_non_nullable
              as int,
      visitsRewardDescription: freezed == visitsRewardDescription
          ? _value.visitsRewardDescription
          : visitsRewardDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      visitsRewardEarnedDescription: freezed == visitsRewardEarnedDescription
          ? _value.visitsRewardEarnedDescription
          : visitsRewardEarnedDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      adminUserIds: null == adminUserIds
          ? _value.adminUserIds
          : adminUserIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StoreImplCopyWith<$Res> implements $StoreModelCopyWith<$Res> {
  factory _$$StoreImplCopyWith(
          _$StoreImpl value, $Res Function(_$StoreImpl) then) =
      __$$StoreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      bool? kachparaEnabled,
      bool? orderEnabled,
      String currency,
      String currencySymbol,
      int? firstPurchaseReward,
      int? addStoreReward,
      String? facebook,
      String? twitter,
      String? whatsapp,
      bool? isRewardEnabled,
      bool? isLoyaltyEnabled,
      bool? isCompetitionEnabled,
      String? youtube,
      String name,
      String referralCode,
      String storeUrl,
      String? googleMapsUrl,
      String? imageFileName,
      String? lat,
      String? lng,
      String address,
      String? placeId,
      int visitsRewardTreshold,
      String? visitsRewardDescription,
      String? visitsRewardEarnedDescription,
      List<String> adminUserIds});
}

/// @nodoc
class __$$StoreImplCopyWithImpl<$Res>
    extends _$StoreModelCopyWithImpl<$Res, _$StoreImpl>
    implements _$$StoreImplCopyWith<$Res> {
  __$$StoreImplCopyWithImpl(
      _$StoreImpl _value, $Res Function(_$StoreImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? kachparaEnabled = freezed,
    Object? orderEnabled = freezed,
    Object? currency = null,
    Object? currencySymbol = null,
    Object? firstPurchaseReward = freezed,
    Object? addStoreReward = freezed,
    Object? facebook = freezed,
    Object? twitter = freezed,
    Object? whatsapp = freezed,
    Object? isRewardEnabled = freezed,
    Object? isLoyaltyEnabled = freezed,
    Object? isCompetitionEnabled = freezed,
    Object? youtube = freezed,
    Object? name = null,
    Object? referralCode = null,
    Object? storeUrl = null,
    Object? googleMapsUrl = freezed,
    Object? imageFileName = freezed,
    Object? lat = freezed,
    Object? lng = freezed,
    Object? address = null,
    Object? placeId = freezed,
    Object? visitsRewardTreshold = null,
    Object? visitsRewardDescription = freezed,
    Object? visitsRewardEarnedDescription = freezed,
    Object? adminUserIds = null,
  }) {
    return _then(_$StoreImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      kachparaEnabled: freezed == kachparaEnabled
          ? _value.kachparaEnabled
          : kachparaEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      orderEnabled: freezed == orderEnabled
          ? _value.orderEnabled
          : orderEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      currencySymbol: null == currencySymbol
          ? _value.currencySymbol
          : currencySymbol // ignore: cast_nullable_to_non_nullable
              as String,
      firstPurchaseReward: freezed == firstPurchaseReward
          ? _value.firstPurchaseReward
          : firstPurchaseReward // ignore: cast_nullable_to_non_nullable
              as int?,
      addStoreReward: freezed == addStoreReward
          ? _value.addStoreReward
          : addStoreReward // ignore: cast_nullable_to_non_nullable
              as int?,
      facebook: freezed == facebook
          ? _value.facebook
          : facebook // ignore: cast_nullable_to_non_nullable
              as String?,
      twitter: freezed == twitter
          ? _value.twitter
          : twitter // ignore: cast_nullable_to_non_nullable
              as String?,
      whatsapp: freezed == whatsapp
          ? _value.whatsapp
          : whatsapp // ignore: cast_nullable_to_non_nullable
              as String?,
      isRewardEnabled: freezed == isRewardEnabled
          ? _value.isRewardEnabled
          : isRewardEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLoyaltyEnabled: freezed == isLoyaltyEnabled
          ? _value.isLoyaltyEnabled
          : isLoyaltyEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCompetitionEnabled: freezed == isCompetitionEnabled
          ? _value.isCompetitionEnabled
          : isCompetitionEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      youtube: freezed == youtube
          ? _value.youtube
          : youtube // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      referralCode: null == referralCode
          ? _value.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String,
      storeUrl: null == storeUrl
          ? _value.storeUrl
          : storeUrl // ignore: cast_nullable_to_non_nullable
              as String,
      googleMapsUrl: freezed == googleMapsUrl
          ? _value.googleMapsUrl
          : googleMapsUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      imageFileName: freezed == imageFileName
          ? _value.imageFileName
          : imageFileName // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String?,
      lng: freezed == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as String?,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      placeId: freezed == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String?,
      visitsRewardTreshold: null == visitsRewardTreshold
          ? _value.visitsRewardTreshold
          : visitsRewardTreshold // ignore: cast_nullable_to_non_nullable
              as int,
      visitsRewardDescription: freezed == visitsRewardDescription
          ? _value.visitsRewardDescription
          : visitsRewardDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      visitsRewardEarnedDescription: freezed == visitsRewardEarnedDescription
          ? _value.visitsRewardEarnedDescription
          : visitsRewardEarnedDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      adminUserIds: null == adminUserIds
          ? _value._adminUserIds
          : adminUserIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StoreImpl extends _Store {
  _$StoreImpl(
      {required this.id,
      this.kachparaEnabled,
      this.orderEnabled,
      required this.currency,
      required this.currencySymbol,
      this.firstPurchaseReward,
      this.addStoreReward,
      this.facebook,
      this.twitter,
      this.whatsapp,
      this.isRewardEnabled,
      this.isLoyaltyEnabled,
      this.isCompetitionEnabled,
      this.youtube,
      required this.name,
      required this.referralCode,
      required this.storeUrl,
      this.googleMapsUrl,
      this.imageFileName,
      this.lat,
      this.lng,
      required this.address,
      this.placeId,
      this.visitsRewardTreshold = 100,
      this.visitsRewardDescription,
      this.visitsRewardEarnedDescription,
      final List<String> adminUserIds = const []})
      : _adminUserIds = adminUserIds,
        super._();

  factory _$StoreImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoreImplFromJson(json);

  @override
  final String id;
  @override
  final bool? kachparaEnabled;
  @override
  final bool? orderEnabled;
// int? businessTypeId,
// int? marketplaceId,
// String? createdAt,
// String? updatedAt,
  @override
  final String currency;
  @override
  final String currencySymbol;
  @override
  final int? firstPurchaseReward;
  @override
  final int? addStoreReward;
// int? deliveryTimeHours,
// int? deliveryTimeMinutes,
  @override
  final String? facebook;
// String? instagram,
  @override
  final String? twitter;
  @override
  final String? whatsapp;
  @override
  final bool? isRewardEnabled;
  @override
  final bool? isLoyaltyEnabled;
  @override
  final bool? isCompetitionEnabled;
  @override
  final String? youtube;
// String? location,
  @override
  final String name;
  @override
  final String referralCode;
  @override
  final String storeUrl;
  @override
  final String? googleMapsUrl;
  @override
  final String? imageFileName;
// String? phone,
// int? userId,
// int? resellerUserId,
// String? subDomain,
// String? logoFileName,
// String? logoContentType,
// int? logoFileSize,
// String? logoUpdatedAt,
// String? deliveryLong,
// String? deliveryLongType,
// bool? nextDayOnly,
// int? orderAheadDaysLimit,
// int? foodPreparationTime,
// bool? taxEnable,
// double? taxValue,
// bool? tipEnable,
// String? tip,
  @override
  final String? lat;
  @override
  final String? lng;
// double? deliveryFee,
// int? deliveryTime,
  @override
  final String address;
  @override
  final String? placeId;
  @override
  @JsonKey()
  final int visitsRewardTreshold;
  @override
  final String? visitsRewardDescription;
  @override
  final String? visitsRewardEarnedDescription;
  final List<String> _adminUserIds;
  @override
  @JsonKey()
  List<String> get adminUserIds {
    if (_adminUserIds is EqualUnmodifiableListView) return _adminUserIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_adminUserIds);
  }

  @override
  String toString() {
    return 'StoreModel(id: $id, kachparaEnabled: $kachparaEnabled, orderEnabled: $orderEnabled, currency: $currency, currencySymbol: $currencySymbol, firstPurchaseReward: $firstPurchaseReward, addStoreReward: $addStoreReward, facebook: $facebook, twitter: $twitter, whatsapp: $whatsapp, isRewardEnabled: $isRewardEnabled, isLoyaltyEnabled: $isLoyaltyEnabled, isCompetitionEnabled: $isCompetitionEnabled, youtube: $youtube, name: $name, referralCode: $referralCode, storeUrl: $storeUrl, googleMapsUrl: $googleMapsUrl, imageFileName: $imageFileName, lat: $lat, lng: $lng, address: $address, placeId: $placeId, visitsRewardTreshold: $visitsRewardTreshold, visitsRewardDescription: $visitsRewardDescription, visitsRewardEarnedDescription: $visitsRewardEarnedDescription, adminUserIds: $adminUserIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoreImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.kachparaEnabled, kachparaEnabled) ||
                other.kachparaEnabled == kachparaEnabled) &&
            (identical(other.orderEnabled, orderEnabled) ||
                other.orderEnabled == orderEnabled) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.currencySymbol, currencySymbol) ||
                other.currencySymbol == currencySymbol) &&
            (identical(other.firstPurchaseReward, firstPurchaseReward) ||
                other.firstPurchaseReward == firstPurchaseReward) &&
            (identical(other.addStoreReward, addStoreReward) ||
                other.addStoreReward == addStoreReward) &&
            (identical(other.facebook, facebook) ||
                other.facebook == facebook) &&
            (identical(other.twitter, twitter) || other.twitter == twitter) &&
            (identical(other.whatsapp, whatsapp) ||
                other.whatsapp == whatsapp) &&
            (identical(other.isRewardEnabled, isRewardEnabled) ||
                other.isRewardEnabled == isRewardEnabled) &&
            (identical(other.isLoyaltyEnabled, isLoyaltyEnabled) ||
                other.isLoyaltyEnabled == isLoyaltyEnabled) &&
            (identical(other.isCompetitionEnabled, isCompetitionEnabled) ||
                other.isCompetitionEnabled == isCompetitionEnabled) &&
            (identical(other.youtube, youtube) || other.youtube == youtube) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.referralCode, referralCode) ||
                other.referralCode == referralCode) &&
            (identical(other.storeUrl, storeUrl) ||
                other.storeUrl == storeUrl) &&
            (identical(other.googleMapsUrl, googleMapsUrl) ||
                other.googleMapsUrl == googleMapsUrl) &&
            (identical(other.imageFileName, imageFileName) ||
                other.imageFileName == imageFileName) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            (identical(other.visitsRewardTreshold, visitsRewardTreshold) ||
                other.visitsRewardTreshold == visitsRewardTreshold) &&
            (identical(
                    other.visitsRewardDescription, visitsRewardDescription) ||
                other.visitsRewardDescription == visitsRewardDescription) &&
            (identical(other.visitsRewardEarnedDescription,
                    visitsRewardEarnedDescription) ||
                other.visitsRewardEarnedDescription ==
                    visitsRewardEarnedDescription) &&
            const DeepCollectionEquality()
                .equals(other._adminUserIds, _adminUserIds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        kachparaEnabled,
        orderEnabled,
        currency,
        currencySymbol,
        firstPurchaseReward,
        addStoreReward,
        facebook,
        twitter,
        whatsapp,
        isRewardEnabled,
        isLoyaltyEnabled,
        isCompetitionEnabled,
        youtube,
        name,
        referralCode,
        storeUrl,
        googleMapsUrl,
        imageFileName,
        lat,
        lng,
        address,
        placeId,
        visitsRewardTreshold,
        visitsRewardDescription,
        visitsRewardEarnedDescription,
        const DeepCollectionEquality().hash(_adminUserIds)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StoreImplCopyWith<_$StoreImpl> get copyWith =>
      __$$StoreImplCopyWithImpl<_$StoreImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoreImplToJson(
      this,
    );
  }
}

abstract class _Store extends StoreModel {
  factory _Store(
      {required final String id,
      final bool? kachparaEnabled,
      final bool? orderEnabled,
      required final String currency,
      required final String currencySymbol,
      final int? firstPurchaseReward,
      final int? addStoreReward,
      final String? facebook,
      final String? twitter,
      final String? whatsapp,
      final bool? isRewardEnabled,
      final bool? isLoyaltyEnabled,
      final bool? isCompetitionEnabled,
      final String? youtube,
      required final String name,
      required final String referralCode,
      required final String storeUrl,
      final String? googleMapsUrl,
      final String? imageFileName,
      final String? lat,
      final String? lng,
      required final String address,
      final String? placeId,
      final int visitsRewardTreshold,
      final String? visitsRewardDescription,
      final String? visitsRewardEarnedDescription,
      final List<String> adminUserIds}) = _$StoreImpl;
  _Store._() : super._();

  factory _Store.fromJson(Map<String, dynamic> json) = _$StoreImpl.fromJson;

  @override
  String get id;
  @override
  bool? get kachparaEnabled;
  @override
  bool? get orderEnabled;
  @override // int? businessTypeId,
// int? marketplaceId,
// String? createdAt,
// String? updatedAt,
  String get currency;
  @override
  String get currencySymbol;
  @override
  int? get firstPurchaseReward;
  @override
  int? get addStoreReward;
  @override // int? deliveryTimeHours,
// int? deliveryTimeMinutes,
  String? get facebook;
  @override // String? instagram,
  String? get twitter;
  @override
  String? get whatsapp;
  @override
  bool? get isRewardEnabled;
  @override
  bool? get isLoyaltyEnabled;
  @override
  bool? get isCompetitionEnabled;
  @override
  String? get youtube;
  @override // String? location,
  String get name;
  @override
  String get referralCode;
  @override
  String get storeUrl;
  @override
  String? get googleMapsUrl;
  @override
  String? get imageFileName;
  @override // String? phone,
// int? userId,
// int? resellerUserId,
// String? subDomain,
// String? logoFileName,
// String? logoContentType,
// int? logoFileSize,
// String? logoUpdatedAt,
// String? deliveryLong,
// String? deliveryLongType,
// bool? nextDayOnly,
// int? orderAheadDaysLimit,
// int? foodPreparationTime,
// bool? taxEnable,
// double? taxValue,
// bool? tipEnable,
// String? tip,
  String? get lat;
  @override
  String? get lng;
  @override // double? deliveryFee,
// int? deliveryTime,
  String get address;
  @override
  String? get placeId;
  @override
  int get visitsRewardTreshold;
  @override
  String? get visitsRewardDescription;
  @override
  String? get visitsRewardEarnedDescription;
  @override
  List<String> get adminUserIds;
  @override
  @JsonKey(ignore: true)
  _$$StoreImplCopyWith<_$StoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
