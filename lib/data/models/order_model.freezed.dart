// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) {
  return _OrderModel.fromJson(json);
}

/// @nodoc
mixin _$OrderModel {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  String? get currencySymbol => throw _privateConstructorUsedError;
  String get storeId => throw _privateConstructorUsedError;
  String get storeName => throw _privateConstructorUsedError;
  String get orderStatus => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String? get curationId => throw _privateConstructorUsedError;
  String? get giftTo => throw _privateConstructorUsedError;
  @JsonKey(toJson: productsToJson)
  List<OrderProductModel> get product => throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;
  String? get paymentIntentId => throw _privateConstructorUsedError;
  String? get pickupAddress => throw _privateConstructorUsedError;
  bool get isDelivery => throw _privateConstructorUsedError;
  bool get isPickup => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get deliveryTime => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get pickupTime => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get orderPlacementTime => throw _privateConstructorUsedError;
  bool get useRewardPoints => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderModelCopyWith<OrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderModelCopyWith<$Res> {
  factory $OrderModelCopyWith(
          OrderModel value, $Res Function(OrderModel) then) =
      _$OrderModelCopyWithImpl<$Res, OrderModel>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String userName,
      String? currency,
      String? currencySymbol,
      String storeId,
      String storeName,
      String orderStatus,
      String address,
      String? notes,
      String? curationId,
      String? giftTo,
      @JsonKey(toJson: productsToJson) List<OrderProductModel> product,
      double totalAmount,
      String? paymentIntentId,
      String? pickupAddress,
      bool isDelivery,
      bool isPickup,
      @TimestampConverter() Timestamp deliveryTime,
      @TimestampConverter() Timestamp pickupTime,
      @TimestampConverter() Timestamp orderPlacementTime,
      bool useRewardPoints});
}

/// @nodoc
class _$OrderModelCopyWithImpl<$Res, $Val extends OrderModel>
    implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? userName = null,
    Object? currency = freezed,
    Object? currencySymbol = freezed,
    Object? storeId = null,
    Object? storeName = null,
    Object? orderStatus = null,
    Object? address = null,
    Object? notes = freezed,
    Object? curationId = freezed,
    Object? giftTo = freezed,
    Object? product = null,
    Object? totalAmount = null,
    Object? paymentIntentId = freezed,
    Object? pickupAddress = freezed,
    Object? isDelivery = null,
    Object? isPickup = null,
    Object? deliveryTime = null,
    Object? pickupTime = null,
    Object? orderPlacementTime = null,
    Object? useRewardPoints = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      currencySymbol: freezed == currencySymbol
          ? _value.currencySymbol
          : currencySymbol // ignore: cast_nullable_to_non_nullable
              as String?,
      storeId: null == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as String,
      storeName: null == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      orderStatus: null == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      curationId: freezed == curationId
          ? _value.curationId
          : curationId // ignore: cast_nullable_to_non_nullable
              as String?,
      giftTo: freezed == giftTo
          ? _value.giftTo
          : giftTo // ignore: cast_nullable_to_non_nullable
              as String?,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as List<OrderProductModel>,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      paymentIntentId: freezed == paymentIntentId
          ? _value.paymentIntentId
          : paymentIntentId // ignore: cast_nullable_to_non_nullable
              as String?,
      pickupAddress: freezed == pickupAddress
          ? _value.pickupAddress
          : pickupAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      isDelivery: null == isDelivery
          ? _value.isDelivery
          : isDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      isPickup: null == isPickup
          ? _value.isPickup
          : isPickup // ignore: cast_nullable_to_non_nullable
              as bool,
      deliveryTime: null == deliveryTime
          ? _value.deliveryTime
          : deliveryTime // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      pickupTime: null == pickupTime
          ? _value.pickupTime
          : pickupTime // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      orderPlacementTime: null == orderPlacementTime
          ? _value.orderPlacementTime
          : orderPlacementTime // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      useRewardPoints: null == useRewardPoints
          ? _value.useRewardPoints
          : useRewardPoints // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderModelImplCopyWith<$Res>
    implements $OrderModelCopyWith<$Res> {
  factory _$$OrderModelImplCopyWith(
          _$OrderModelImpl value, $Res Function(_$OrderModelImpl) then) =
      __$$OrderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String userName,
      String? currency,
      String? currencySymbol,
      String storeId,
      String storeName,
      String orderStatus,
      String address,
      String? notes,
      String? curationId,
      String? giftTo,
      @JsonKey(toJson: productsToJson) List<OrderProductModel> product,
      double totalAmount,
      String? paymentIntentId,
      String? pickupAddress,
      bool isDelivery,
      bool isPickup,
      @TimestampConverter() Timestamp deliveryTime,
      @TimestampConverter() Timestamp pickupTime,
      @TimestampConverter() Timestamp orderPlacementTime,
      bool useRewardPoints});
}

/// @nodoc
class __$$OrderModelImplCopyWithImpl<$Res>
    extends _$OrderModelCopyWithImpl<$Res, _$OrderModelImpl>
    implements _$$OrderModelImplCopyWith<$Res> {
  __$$OrderModelImplCopyWithImpl(
      _$OrderModelImpl _value, $Res Function(_$OrderModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? userName = null,
    Object? currency = freezed,
    Object? currencySymbol = freezed,
    Object? storeId = null,
    Object? storeName = null,
    Object? orderStatus = null,
    Object? address = null,
    Object? notes = freezed,
    Object? curationId = freezed,
    Object? giftTo = freezed,
    Object? product = null,
    Object? totalAmount = null,
    Object? paymentIntentId = freezed,
    Object? pickupAddress = freezed,
    Object? isDelivery = null,
    Object? isPickup = null,
    Object? deliveryTime = null,
    Object? pickupTime = null,
    Object? orderPlacementTime = null,
    Object? useRewardPoints = null,
  }) {
    return _then(_$OrderModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      currencySymbol: freezed == currencySymbol
          ? _value.currencySymbol
          : currencySymbol // ignore: cast_nullable_to_non_nullable
              as String?,
      storeId: null == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as String,
      storeName: null == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      orderStatus: null == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      curationId: freezed == curationId
          ? _value.curationId
          : curationId // ignore: cast_nullable_to_non_nullable
              as String?,
      giftTo: freezed == giftTo
          ? _value.giftTo
          : giftTo // ignore: cast_nullable_to_non_nullable
              as String?,
      product: null == product
          ? _value._product
          : product // ignore: cast_nullable_to_non_nullable
              as List<OrderProductModel>,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      paymentIntentId: freezed == paymentIntentId
          ? _value.paymentIntentId
          : paymentIntentId // ignore: cast_nullable_to_non_nullable
              as String?,
      pickupAddress: freezed == pickupAddress
          ? _value.pickupAddress
          : pickupAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      isDelivery: null == isDelivery
          ? _value.isDelivery
          : isDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      isPickup: null == isPickup
          ? _value.isPickup
          : isPickup // ignore: cast_nullable_to_non_nullable
              as bool,
      deliveryTime: null == deliveryTime
          ? _value.deliveryTime
          : deliveryTime // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      pickupTime: null == pickupTime
          ? _value.pickupTime
          : pickupTime // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      orderPlacementTime: null == orderPlacementTime
          ? _value.orderPlacementTime
          : orderPlacementTime // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      useRewardPoints: null == useRewardPoints
          ? _value.useRewardPoints
          : useRewardPoints // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderModelImpl extends _OrderModel {
  _$OrderModelImpl(
      {required this.id,
      required this.userId,
      required this.userName,
      required this.currency,
      required this.currencySymbol,
      required this.storeId,
      required this.storeName,
      required this.orderStatus,
      required this.address,
      this.notes,
      this.curationId,
      this.giftTo,
      @JsonKey(toJson: productsToJson)
      required final List<OrderProductModel> product,
      required this.totalAmount,
      this.paymentIntentId,
      this.pickupAddress,
      required this.isDelivery,
      required this.isPickup,
      @TimestampConverter() required this.deliveryTime,
      @TimestampConverter() required this.pickupTime,
      @TimestampConverter() required this.orderPlacementTime,
      this.useRewardPoints = false})
      : _product = product,
        super._();

  factory _$OrderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderModelImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String userName;
  @override
  final String? currency;
  @override
  final String? currencySymbol;
  @override
  final String storeId;
  @override
  final String storeName;
  @override
  final String orderStatus;
  @override
  final String address;
  @override
  final String? notes;
  @override
  final String? curationId;
  @override
  final String? giftTo;
  final List<OrderProductModel> _product;
  @override
  @JsonKey(toJson: productsToJson)
  List<OrderProductModel> get product {
    if (_product is EqualUnmodifiableListView) return _product;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_product);
  }

  @override
  final double totalAmount;
  @override
  final String? paymentIntentId;
  @override
  final String? pickupAddress;
  @override
  final bool isDelivery;
  @override
  final bool isPickup;
  @override
  @TimestampConverter()
  final Timestamp deliveryTime;
  @override
  @TimestampConverter()
  final Timestamp pickupTime;
  @override
  @TimestampConverter()
  final Timestamp orderPlacementTime;
  @override
  @JsonKey()
  final bool useRewardPoints;

  @override
  String toString() {
    return 'OrderModel(id: $id, userId: $userId, userName: $userName, currency: $currency, currencySymbol: $currencySymbol, storeId: $storeId, storeName: $storeName, orderStatus: $orderStatus, address: $address, notes: $notes, curationId: $curationId, giftTo: $giftTo, product: $product, totalAmount: $totalAmount, paymentIntentId: $paymentIntentId, pickupAddress: $pickupAddress, isDelivery: $isDelivery, isPickup: $isPickup, deliveryTime: $deliveryTime, pickupTime: $pickupTime, orderPlacementTime: $orderPlacementTime, useRewardPoints: $useRewardPoints)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.currencySymbol, currencySymbol) ||
                other.currencySymbol == currencySymbol) &&
            (identical(other.storeId, storeId) || other.storeId == storeId) &&
            (identical(other.storeName, storeName) ||
                other.storeName == storeName) &&
            (identical(other.orderStatus, orderStatus) ||
                other.orderStatus == orderStatus) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.curationId, curationId) ||
                other.curationId == curationId) &&
            (identical(other.giftTo, giftTo) || other.giftTo == giftTo) &&
            const DeepCollectionEquality().equals(other._product, _product) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.paymentIntentId, paymentIntentId) ||
                other.paymentIntentId == paymentIntentId) &&
            (identical(other.pickupAddress, pickupAddress) ||
                other.pickupAddress == pickupAddress) &&
            (identical(other.isDelivery, isDelivery) ||
                other.isDelivery == isDelivery) &&
            (identical(other.isPickup, isPickup) ||
                other.isPickup == isPickup) &&
            (identical(other.deliveryTime, deliveryTime) ||
                other.deliveryTime == deliveryTime) &&
            (identical(other.pickupTime, pickupTime) ||
                other.pickupTime == pickupTime) &&
            (identical(other.orderPlacementTime, orderPlacementTime) ||
                other.orderPlacementTime == orderPlacementTime) &&
            (identical(other.useRewardPoints, useRewardPoints) ||
                other.useRewardPoints == useRewardPoints));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        userId,
        userName,
        currency,
        currencySymbol,
        storeId,
        storeName,
        orderStatus,
        address,
        notes,
        curationId,
        giftTo,
        const DeepCollectionEquality().hash(_product),
        totalAmount,
        paymentIntentId,
        pickupAddress,
        isDelivery,
        isPickup,
        deliveryTime,
        pickupTime,
        orderPlacementTime,
        useRewardPoints
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      __$$OrderModelImplCopyWithImpl<_$OrderModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderModelImplToJson(
      this,
    );
  }
}

abstract class _OrderModel extends OrderModel {
  factory _OrderModel(
      {required final String id,
      required final String userId,
      required final String userName,
      required final String? currency,
      required final String? currencySymbol,
      required final String storeId,
      required final String storeName,
      required final String orderStatus,
      required final String address,
      final String? notes,
      final String? curationId,
      final String? giftTo,
      @JsonKey(toJson: productsToJson)
      required final List<OrderProductModel> product,
      required final double totalAmount,
      final String? paymentIntentId,
      final String? pickupAddress,
      required final bool isDelivery,
      required final bool isPickup,
      @TimestampConverter() required final Timestamp deliveryTime,
      @TimestampConverter() required final Timestamp pickupTime,
      @TimestampConverter() required final Timestamp orderPlacementTime,
      final bool useRewardPoints}) = _$OrderModelImpl;
  _OrderModel._() : super._();

  factory _OrderModel.fromJson(Map<String, dynamic> json) =
      _$OrderModelImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get userName;
  @override
  String? get currency;
  @override
  String? get currencySymbol;
  @override
  String get storeId;
  @override
  String get storeName;
  @override
  String get orderStatus;
  @override
  String get address;
  @override
  String? get notes;
  @override
  String? get curationId;
  @override
  String? get giftTo;
  @override
  @JsonKey(toJson: productsToJson)
  List<OrderProductModel> get product;
  @override
  double get totalAmount;
  @override
  String? get paymentIntentId;
  @override
  String? get pickupAddress;
  @override
  bool get isDelivery;
  @override
  bool get isPickup;
  @override
  @TimestampConverter()
  Timestamp get deliveryTime;
  @override
  @TimestampConverter()
  Timestamp get pickupTime;
  @override
  @TimestampConverter()
  Timestamp get orderPlacementTime;
  @override
  bool get useRewardPoints;
  @override
  @JsonKey(ignore: true)
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
