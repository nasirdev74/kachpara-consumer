// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'claim_gift_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ClaimGiftPageState {
  Status get getOrderState => throw _privateConstructorUsedError;
  Status get claimPageStatus => throw _privateConstructorUsedError;
  bool get isNearStoreStatus => throw _privateConstructorUsedError;
  Store? get store => throw _privateConstructorUsedError;
  Order? get order => throw _privateConstructorUsedError;
  String? get orderId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ClaimGiftPageStateCopyWith<ClaimGiftPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClaimGiftPageStateCopyWith<$Res> {
  factory $ClaimGiftPageStateCopyWith(
          ClaimGiftPageState value, $Res Function(ClaimGiftPageState) then) =
      _$ClaimGiftPageStateCopyWithImpl<$Res, ClaimGiftPageState>;
  @useResult
  $Res call(
      {Status getOrderState,
      Status claimPageStatus,
      bool isNearStoreStatus,
      Store? store,
      Order? order,
      String? orderId});
}

/// @nodoc
class _$ClaimGiftPageStateCopyWithImpl<$Res, $Val extends ClaimGiftPageState>
    implements $ClaimGiftPageStateCopyWith<$Res> {
  _$ClaimGiftPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getOrderState = null,
    Object? claimPageStatus = null,
    Object? isNearStoreStatus = null,
    Object? store = freezed,
    Object? order = freezed,
    Object? orderId = freezed,
  }) {
    return _then(_value.copyWith(
      getOrderState: null == getOrderState
          ? _value.getOrderState
          : getOrderState // ignore: cast_nullable_to_non_nullable
              as Status,
      claimPageStatus: null == claimPageStatus
          ? _value.claimPageStatus
          : claimPageStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      isNearStoreStatus: null == isNearStoreStatus
          ? _value.isNearStoreStatus
          : isNearStoreStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      store: freezed == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as Store?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as Order?,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClaimGiftPageStateImplCopyWith<$Res>
    implements $ClaimGiftPageStateCopyWith<$Res> {
  factory _$$ClaimGiftPageStateImplCopyWith(_$ClaimGiftPageStateImpl value,
          $Res Function(_$ClaimGiftPageStateImpl) then) =
      __$$ClaimGiftPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status getOrderState,
      Status claimPageStatus,
      bool isNearStoreStatus,
      Store? store,
      Order? order,
      String? orderId});
}

/// @nodoc
class __$$ClaimGiftPageStateImplCopyWithImpl<$Res>
    extends _$ClaimGiftPageStateCopyWithImpl<$Res, _$ClaimGiftPageStateImpl>
    implements _$$ClaimGiftPageStateImplCopyWith<$Res> {
  __$$ClaimGiftPageStateImplCopyWithImpl(_$ClaimGiftPageStateImpl _value,
      $Res Function(_$ClaimGiftPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getOrderState = null,
    Object? claimPageStatus = null,
    Object? isNearStoreStatus = null,
    Object? store = freezed,
    Object? order = freezed,
    Object? orderId = freezed,
  }) {
    return _then(_$ClaimGiftPageStateImpl(
      getOrderState: null == getOrderState
          ? _value.getOrderState
          : getOrderState // ignore: cast_nullable_to_non_nullable
              as Status,
      claimPageStatus: null == claimPageStatus
          ? _value.claimPageStatus
          : claimPageStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      isNearStoreStatus: null == isNearStoreStatus
          ? _value.isNearStoreStatus
          : isNearStoreStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      store: freezed == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as Store?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as Order?,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ClaimGiftPageStateImpl implements _ClaimGiftPageState {
  const _$ClaimGiftPageStateImpl(
      {this.getOrderState = Status.init,
      this.claimPageStatus = Status.init,
      this.isNearStoreStatus = false,
      this.store,
      this.order,
      this.orderId});

  @override
  @JsonKey()
  final Status getOrderState;
  @override
  @JsonKey()
  final Status claimPageStatus;
  @override
  @JsonKey()
  final bool isNearStoreStatus;
  @override
  final Store? store;
  @override
  final Order? order;
  @override
  final String? orderId;

  @override
  String toString() {
    return 'ClaimGiftPageState(getOrderState: $getOrderState, claimPageStatus: $claimPageStatus, isNearStoreStatus: $isNearStoreStatus, store: $store, order: $order, orderId: $orderId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClaimGiftPageStateImpl &&
            (identical(other.getOrderState, getOrderState) ||
                other.getOrderState == getOrderState) &&
            (identical(other.claimPageStatus, claimPageStatus) ||
                other.claimPageStatus == claimPageStatus) &&
            (identical(other.isNearStoreStatus, isNearStoreStatus) ||
                other.isNearStoreStatus == isNearStoreStatus) &&
            (identical(other.store, store) || other.store == store) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.orderId, orderId) || other.orderId == orderId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, getOrderState, claimPageStatus,
      isNearStoreStatus, store, order, orderId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClaimGiftPageStateImplCopyWith<_$ClaimGiftPageStateImpl> get copyWith =>
      __$$ClaimGiftPageStateImplCopyWithImpl<_$ClaimGiftPageStateImpl>(
          this, _$identity);
}

abstract class _ClaimGiftPageState implements ClaimGiftPageState {
  const factory _ClaimGiftPageState(
      {final Status getOrderState,
      final Status claimPageStatus,
      final bool isNearStoreStatus,
      final Store? store,
      final Order? order,
      final String? orderId}) = _$ClaimGiftPageStateImpl;

  @override
  Status get getOrderState;
  @override
  Status get claimPageStatus;
  @override
  bool get isNearStoreStatus;
  @override
  Store? get store;
  @override
  Order? get order;
  @override
  String? get orderId;
  @override
  @JsonKey(ignore: true)
  _$$ClaimGiftPageStateImplCopyWith<_$ClaimGiftPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
