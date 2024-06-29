// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'buy_gift_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BuyGiftPageState {
  Status get buyGiftPageStatus => throw _privateConstructorUsedError;
  String? get orderId => throw _privateConstructorUsedError;
  String? get buyGiftPageError => throw _privateConstructorUsedError;
  Store? get store => throw _privateConstructorUsedError;
  Promotion? get freePromotion => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BuyGiftPageStateCopyWith<BuyGiftPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BuyGiftPageStateCopyWith<$Res> {
  factory $BuyGiftPageStateCopyWith(
          BuyGiftPageState value, $Res Function(BuyGiftPageState) then) =
      _$BuyGiftPageStateCopyWithImpl<$Res, BuyGiftPageState>;
  @useResult
  $Res call(
      {Status buyGiftPageStatus,
      String? orderId,
      String? buyGiftPageError,
      Store? store,
      Promotion? freePromotion,
      User? user});
}

/// @nodoc
class _$BuyGiftPageStateCopyWithImpl<$Res, $Val extends BuyGiftPageState>
    implements $BuyGiftPageStateCopyWith<$Res> {
  _$BuyGiftPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? buyGiftPageStatus = null,
    Object? orderId = freezed,
    Object? buyGiftPageError = freezed,
    Object? store = freezed,
    Object? freePromotion = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      buyGiftPageStatus: null == buyGiftPageStatus
          ? _value.buyGiftPageStatus
          : buyGiftPageStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      buyGiftPageError: freezed == buyGiftPageError
          ? _value.buyGiftPageError
          : buyGiftPageError // ignore: cast_nullable_to_non_nullable
              as String?,
      store: freezed == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as Store?,
      freePromotion: freezed == freePromotion
          ? _value.freePromotion
          : freePromotion // ignore: cast_nullable_to_non_nullable
              as Promotion?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BuyGiftPageStateImplCopyWith<$Res>
    implements $BuyGiftPageStateCopyWith<$Res> {
  factory _$$BuyGiftPageStateImplCopyWith(_$BuyGiftPageStateImpl value,
          $Res Function(_$BuyGiftPageStateImpl) then) =
      __$$BuyGiftPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status buyGiftPageStatus,
      String? orderId,
      String? buyGiftPageError,
      Store? store,
      Promotion? freePromotion,
      User? user});
}

/// @nodoc
class __$$BuyGiftPageStateImplCopyWithImpl<$Res>
    extends _$BuyGiftPageStateCopyWithImpl<$Res, _$BuyGiftPageStateImpl>
    implements _$$BuyGiftPageStateImplCopyWith<$Res> {
  __$$BuyGiftPageStateImplCopyWithImpl(_$BuyGiftPageStateImpl _value,
      $Res Function(_$BuyGiftPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? buyGiftPageStatus = null,
    Object? orderId = freezed,
    Object? buyGiftPageError = freezed,
    Object? store = freezed,
    Object? freePromotion = freezed,
    Object? user = freezed,
  }) {
    return _then(_$BuyGiftPageStateImpl(
      buyGiftPageStatus: null == buyGiftPageStatus
          ? _value.buyGiftPageStatus
          : buyGiftPageStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      buyGiftPageError: freezed == buyGiftPageError
          ? _value.buyGiftPageError
          : buyGiftPageError // ignore: cast_nullable_to_non_nullable
              as String?,
      store: freezed == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as Store?,
      freePromotion: freezed == freePromotion
          ? _value.freePromotion
          : freePromotion // ignore: cast_nullable_to_non_nullable
              as Promotion?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc

class _$BuyGiftPageStateImpl implements _BuyGiftPageState {
  const _$BuyGiftPageStateImpl(
      {this.buyGiftPageStatus = Status.init,
      this.orderId,
      this.buyGiftPageError,
      this.store,
      this.freePromotion,
      this.user});

  @override
  @JsonKey()
  final Status buyGiftPageStatus;
  @override
  final String? orderId;
  @override
  final String? buyGiftPageError;
  @override
  final Store? store;
  @override
  final Promotion? freePromotion;
  @override
  final User? user;

  @override
  String toString() {
    return 'BuyGiftPageState(buyGiftPageStatus: $buyGiftPageStatus, orderId: $orderId, buyGiftPageError: $buyGiftPageError, store: $store, freePromotion: $freePromotion, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BuyGiftPageStateImpl &&
            (identical(other.buyGiftPageStatus, buyGiftPageStatus) ||
                other.buyGiftPageStatus == buyGiftPageStatus) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.buyGiftPageError, buyGiftPageError) ||
                other.buyGiftPageError == buyGiftPageError) &&
            (identical(other.store, store) || other.store == store) &&
            (identical(other.freePromotion, freePromotion) ||
                other.freePromotion == freePromotion) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, buyGiftPageStatus, orderId,
      buyGiftPageError, store, freePromotion, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BuyGiftPageStateImplCopyWith<_$BuyGiftPageStateImpl> get copyWith =>
      __$$BuyGiftPageStateImplCopyWithImpl<_$BuyGiftPageStateImpl>(
          this, _$identity);
}

abstract class _BuyGiftPageState implements BuyGiftPageState {
  const factory _BuyGiftPageState(
      {final Status buyGiftPageStatus,
      final String? orderId,
      final String? buyGiftPageError,
      final Store? store,
      final Promotion? freePromotion,
      final User? user}) = _$BuyGiftPageStateImpl;

  @override
  Status get buyGiftPageStatus;
  @override
  String? get orderId;
  @override
  String? get buyGiftPageError;
  @override
  Store? get store;
  @override
  Promotion? get freePromotion;
  @override
  User? get user;
  @override
  @JsonKey(ignore: true)
  _$$BuyGiftPageStateImplCopyWith<_$BuyGiftPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
