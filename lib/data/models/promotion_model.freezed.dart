// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'promotion_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PromotionModel _$PromotionModelFromJson(Map<String, dynamic> json) {
  return _PromotionModel.fromJson(json);
}

/// @nodoc
mixin _$PromotionModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  double get discountAmount => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  int get orderLimit => throw _privateConstructorUsedError;
  double? get minimumPurchaseAmount => throw _privateConstructorUsedError;
  List<ProductModel> get products => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get startDate => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get endDate => throw _privateConstructorUsedError;
  String get storeName => throw _privateConstructorUsedError;
  String? get currentSponsor => throw _privateConstructorUsedError;
  String? get currentSponsorURL =>
      throw _privateConstructorUsedError; // dynamic because we support legacy storeIds in firestore with int type
  dynamic get storeId => throw _privateConstructorUsedError;
  bool get isEnabled => throw _privateConstructorUsedError;
  int? get claimBeginTime => throw _privateConstructorUsedError;
  int? get claimEndTime => throw _privateConstructorUsedError;
  bool? get isClaimAnytime => throw _privateConstructorUsedError;
  List<String>? get beneficiaryList => throw _privateConstructorUsedError;
  int? get totalDonations => throw _privateConstructorUsedError;
  int? get claimedDonations => throw _privateConstructorUsedError;
  int? get waitPeriodInMinutes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PromotionModelCopyWith<PromotionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromotionModelCopyWith<$Res> {
  factory $PromotionModelCopyWith(
          PromotionModel value, $Res Function(PromotionModel) then) =
      _$PromotionModelCopyWithImpl<$Res, PromotionModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      String? description,
      double discountAmount,
      String type,
      int orderLimit,
      double? minimumPurchaseAmount,
      List<ProductModel> products,
      @DateTimeConverter() DateTime? startDate,
      @DateTimeConverter() DateTime? endDate,
      String storeName,
      String? currentSponsor,
      String? currentSponsorURL,
      dynamic storeId,
      bool isEnabled,
      int? claimBeginTime,
      int? claimEndTime,
      bool? isClaimAnytime,
      List<String>? beneficiaryList,
      int? totalDonations,
      int? claimedDonations,
      int? waitPeriodInMinutes});
}

/// @nodoc
class _$PromotionModelCopyWithImpl<$Res, $Val extends PromotionModel>
    implements $PromotionModelCopyWith<$Res> {
  _$PromotionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? discountAmount = null,
    Object? type = null,
    Object? orderLimit = null,
    Object? minimumPurchaseAmount = freezed,
    Object? products = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? storeName = null,
    Object? currentSponsor = freezed,
    Object? currentSponsorURL = freezed,
    Object? storeId = freezed,
    Object? isEnabled = null,
    Object? claimBeginTime = freezed,
    Object? claimEndTime = freezed,
    Object? isClaimAnytime = freezed,
    Object? beneficiaryList = freezed,
    Object? totalDonations = freezed,
    Object? claimedDonations = freezed,
    Object? waitPeriodInMinutes = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      discountAmount: null == discountAmount
          ? _value.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      orderLimit: null == orderLimit
          ? _value.orderLimit
          : orderLimit // ignore: cast_nullable_to_non_nullable
              as int,
      minimumPurchaseAmount: freezed == minimumPurchaseAmount
          ? _value.minimumPurchaseAmount
          : minimumPurchaseAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      storeName: null == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      currentSponsor: freezed == currentSponsor
          ? _value.currentSponsor
          : currentSponsor // ignore: cast_nullable_to_non_nullable
              as String?,
      currentSponsorURL: freezed == currentSponsorURL
          ? _value.currentSponsorURL
          : currentSponsorURL // ignore: cast_nullable_to_non_nullable
              as String?,
      storeId: freezed == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isEnabled: null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      claimBeginTime: freezed == claimBeginTime
          ? _value.claimBeginTime
          : claimBeginTime // ignore: cast_nullable_to_non_nullable
              as int?,
      claimEndTime: freezed == claimEndTime
          ? _value.claimEndTime
          : claimEndTime // ignore: cast_nullable_to_non_nullable
              as int?,
      isClaimAnytime: freezed == isClaimAnytime
          ? _value.isClaimAnytime
          : isClaimAnytime // ignore: cast_nullable_to_non_nullable
              as bool?,
      beneficiaryList: freezed == beneficiaryList
          ? _value.beneficiaryList
          : beneficiaryList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      totalDonations: freezed == totalDonations
          ? _value.totalDonations
          : totalDonations // ignore: cast_nullable_to_non_nullable
              as int?,
      claimedDonations: freezed == claimedDonations
          ? _value.claimedDonations
          : claimedDonations // ignore: cast_nullable_to_non_nullable
              as int?,
      waitPeriodInMinutes: freezed == waitPeriodInMinutes
          ? _value.waitPeriodInMinutes
          : waitPeriodInMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PromotionModelImplCopyWith<$Res>
    implements $PromotionModelCopyWith<$Res> {
  factory _$$PromotionModelImplCopyWith(_$PromotionModelImpl value,
          $Res Function(_$PromotionModelImpl) then) =
      __$$PromotionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String? description,
      double discountAmount,
      String type,
      int orderLimit,
      double? minimumPurchaseAmount,
      List<ProductModel> products,
      @DateTimeConverter() DateTime? startDate,
      @DateTimeConverter() DateTime? endDate,
      String storeName,
      String? currentSponsor,
      String? currentSponsorURL,
      dynamic storeId,
      bool isEnabled,
      int? claimBeginTime,
      int? claimEndTime,
      bool? isClaimAnytime,
      List<String>? beneficiaryList,
      int? totalDonations,
      int? claimedDonations,
      int? waitPeriodInMinutes});
}

/// @nodoc
class __$$PromotionModelImplCopyWithImpl<$Res>
    extends _$PromotionModelCopyWithImpl<$Res, _$PromotionModelImpl>
    implements _$$PromotionModelImplCopyWith<$Res> {
  __$$PromotionModelImplCopyWithImpl(
      _$PromotionModelImpl _value, $Res Function(_$PromotionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? discountAmount = null,
    Object? type = null,
    Object? orderLimit = null,
    Object? minimumPurchaseAmount = freezed,
    Object? products = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? storeName = null,
    Object? currentSponsor = freezed,
    Object? currentSponsorURL = freezed,
    Object? storeId = freezed,
    Object? isEnabled = null,
    Object? claimBeginTime = freezed,
    Object? claimEndTime = freezed,
    Object? isClaimAnytime = freezed,
    Object? beneficiaryList = freezed,
    Object? totalDonations = freezed,
    Object? claimedDonations = freezed,
    Object? waitPeriodInMinutes = freezed,
  }) {
    return _then(_$PromotionModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      discountAmount: null == discountAmount
          ? _value.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      orderLimit: null == orderLimit
          ? _value.orderLimit
          : orderLimit // ignore: cast_nullable_to_non_nullable
              as int,
      minimumPurchaseAmount: freezed == minimumPurchaseAmount
          ? _value.minimumPurchaseAmount
          : minimumPurchaseAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      storeName: null == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      currentSponsor: freezed == currentSponsor
          ? _value.currentSponsor
          : currentSponsor // ignore: cast_nullable_to_non_nullable
              as String?,
      currentSponsorURL: freezed == currentSponsorURL
          ? _value.currentSponsorURL
          : currentSponsorURL // ignore: cast_nullable_to_non_nullable
              as String?,
      storeId: freezed == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isEnabled: null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      claimBeginTime: freezed == claimBeginTime
          ? _value.claimBeginTime
          : claimBeginTime // ignore: cast_nullable_to_non_nullable
              as int?,
      claimEndTime: freezed == claimEndTime
          ? _value.claimEndTime
          : claimEndTime // ignore: cast_nullable_to_non_nullable
              as int?,
      isClaimAnytime: freezed == isClaimAnytime
          ? _value.isClaimAnytime
          : isClaimAnytime // ignore: cast_nullable_to_non_nullable
              as bool?,
      beneficiaryList: freezed == beneficiaryList
          ? _value._beneficiaryList
          : beneficiaryList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      totalDonations: freezed == totalDonations
          ? _value.totalDonations
          : totalDonations // ignore: cast_nullable_to_non_nullable
              as int?,
      claimedDonations: freezed == claimedDonations
          ? _value.claimedDonations
          : claimedDonations // ignore: cast_nullable_to_non_nullable
              as int?,
      waitPeriodInMinutes: freezed == waitPeriodInMinutes
          ? _value.waitPeriodInMinutes
          : waitPeriodInMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PromotionModelImpl extends _PromotionModel {
  _$PromotionModelImpl(
      {required this.id,
      required this.title,
      this.description,
      required this.discountAmount,
      required this.type,
      required this.orderLimit,
      this.minimumPurchaseAmount,
      required final List<ProductModel> products,
      @DateTimeConverter() this.startDate,
      @DateTimeConverter() this.endDate,
      required this.storeName,
      this.currentSponsor,
      this.currentSponsorURL,
      required this.storeId,
      required this.isEnabled,
      this.claimBeginTime,
      this.claimEndTime,
      this.isClaimAnytime,
      final List<String>? beneficiaryList,
      this.totalDonations,
      this.claimedDonations,
      this.waitPeriodInMinutes})
      : _products = products,
        _beneficiaryList = beneficiaryList,
        super._();

  factory _$PromotionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PromotionModelImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String? description;
  @override
  final double discountAmount;
  @override
  final String type;
  @override
  final int orderLimit;
  @override
  final double? minimumPurchaseAmount;
  final List<ProductModel> _products;
  @override
  List<ProductModel> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  @DateTimeConverter()
  final DateTime? startDate;
  @override
  @DateTimeConverter()
  final DateTime? endDate;
  @override
  final String storeName;
  @override
  final String? currentSponsor;
  @override
  final String? currentSponsorURL;
// dynamic because we support legacy storeIds in firestore with int type
  @override
  final dynamic storeId;
  @override
  final bool isEnabled;
  @override
  final int? claimBeginTime;
  @override
  final int? claimEndTime;
  @override
  final bool? isClaimAnytime;
  final List<String>? _beneficiaryList;
  @override
  List<String>? get beneficiaryList {
    final value = _beneficiaryList;
    if (value == null) return null;
    if (_beneficiaryList is EqualUnmodifiableListView) return _beneficiaryList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? totalDonations;
  @override
  final int? claimedDonations;
  @override
  final int? waitPeriodInMinutes;

  @override
  String toString() {
    return 'PromotionModel(id: $id, title: $title, description: $description, discountAmount: $discountAmount, type: $type, orderLimit: $orderLimit, minimumPurchaseAmount: $minimumPurchaseAmount, products: $products, startDate: $startDate, endDate: $endDate, storeName: $storeName, currentSponsor: $currentSponsor, currentSponsorURL: $currentSponsorURL, storeId: $storeId, isEnabled: $isEnabled, claimBeginTime: $claimBeginTime, claimEndTime: $claimEndTime, isClaimAnytime: $isClaimAnytime, beneficiaryList: $beneficiaryList, totalDonations: $totalDonations, claimedDonations: $claimedDonations, waitPeriodInMinutes: $waitPeriodInMinutes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PromotionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.orderLimit, orderLimit) ||
                other.orderLimit == orderLimit) &&
            (identical(other.minimumPurchaseAmount, minimumPurchaseAmount) ||
                other.minimumPurchaseAmount == minimumPurchaseAmount) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.storeName, storeName) ||
                other.storeName == storeName) &&
            (identical(other.currentSponsor, currentSponsor) ||
                other.currentSponsor == currentSponsor) &&
            (identical(other.currentSponsorURL, currentSponsorURL) ||
                other.currentSponsorURL == currentSponsorURL) &&
            const DeepCollectionEquality().equals(other.storeId, storeId) &&
            (identical(other.isEnabled, isEnabled) ||
                other.isEnabled == isEnabled) &&
            (identical(other.claimBeginTime, claimBeginTime) ||
                other.claimBeginTime == claimBeginTime) &&
            (identical(other.claimEndTime, claimEndTime) ||
                other.claimEndTime == claimEndTime) &&
            (identical(other.isClaimAnytime, isClaimAnytime) ||
                other.isClaimAnytime == isClaimAnytime) &&
            const DeepCollectionEquality()
                .equals(other._beneficiaryList, _beneficiaryList) &&
            (identical(other.totalDonations, totalDonations) ||
                other.totalDonations == totalDonations) &&
            (identical(other.claimedDonations, claimedDonations) ||
                other.claimedDonations == claimedDonations) &&
            (identical(other.waitPeriodInMinutes, waitPeriodInMinutes) ||
                other.waitPeriodInMinutes == waitPeriodInMinutes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        title,
        description,
        discountAmount,
        type,
        orderLimit,
        minimumPurchaseAmount,
        const DeepCollectionEquality().hash(_products),
        startDate,
        endDate,
        storeName,
        currentSponsor,
        currentSponsorURL,
        const DeepCollectionEquality().hash(storeId),
        isEnabled,
        claimBeginTime,
        claimEndTime,
        isClaimAnytime,
        const DeepCollectionEquality().hash(_beneficiaryList),
        totalDonations,
        claimedDonations,
        waitPeriodInMinutes
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PromotionModelImplCopyWith<_$PromotionModelImpl> get copyWith =>
      __$$PromotionModelImplCopyWithImpl<_$PromotionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PromotionModelImplToJson(
      this,
    );
  }
}

abstract class _PromotionModel extends PromotionModel {
  factory _PromotionModel(
      {required final String id,
      required final String title,
      final String? description,
      required final double discountAmount,
      required final String type,
      required final int orderLimit,
      final double? minimumPurchaseAmount,
      required final List<ProductModel> products,
      @DateTimeConverter() final DateTime? startDate,
      @DateTimeConverter() final DateTime? endDate,
      required final String storeName,
      final String? currentSponsor,
      final String? currentSponsorURL,
      required final dynamic storeId,
      required final bool isEnabled,
      final int? claimBeginTime,
      final int? claimEndTime,
      final bool? isClaimAnytime,
      final List<String>? beneficiaryList,
      final int? totalDonations,
      final int? claimedDonations,
      final int? waitPeriodInMinutes}) = _$PromotionModelImpl;
  _PromotionModel._() : super._();

  factory _PromotionModel.fromJson(Map<String, dynamic> json) =
      _$PromotionModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String? get description;
  @override
  double get discountAmount;
  @override
  String get type;
  @override
  int get orderLimit;
  @override
  double? get minimumPurchaseAmount;
  @override
  List<ProductModel> get products;
  @override
  @DateTimeConverter()
  DateTime? get startDate;
  @override
  @DateTimeConverter()
  DateTime? get endDate;
  @override
  String get storeName;
  @override
  String? get currentSponsor;
  @override
  String? get currentSponsorURL;
  @override // dynamic because we support legacy storeIds in firestore with int type
  dynamic get storeId;
  @override
  bool get isEnabled;
  @override
  int? get claimBeginTime;
  @override
  int? get claimEndTime;
  @override
  bool? get isClaimAnytime;
  @override
  List<String>? get beneficiaryList;
  @override
  int? get totalDonations;
  @override
  int? get claimedDonations;
  @override
  int? get waitPeriodInMinutes;
  @override
  @JsonKey(ignore: true)
  _$$PromotionModelImplCopyWith<_$PromotionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
