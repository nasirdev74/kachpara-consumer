// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_gift_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SendGiftPageState {
  Status get sendGiftPageStatus => throw _privateConstructorUsedError;
  String? get orderId => throw _privateConstructorUsedError;
  String? get sendGiftPageError => throw _privateConstructorUsedError;
  Store? get store => throw _privateConstructorUsedError;
  Promotion? get freePromotion => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SendGiftPageStateCopyWith<SendGiftPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendGiftPageStateCopyWith<$Res> {
  factory $SendGiftPageStateCopyWith(
          SendGiftPageState value, $Res Function(SendGiftPageState) then) =
      _$SendGiftPageStateCopyWithImpl<$Res, SendGiftPageState>;
  @useResult
  $Res call(
      {Status sendGiftPageStatus,
      String? orderId,
      String? sendGiftPageError,
      Store? store,
      Promotion? freePromotion,
      User? user});
}

/// @nodoc
class _$SendGiftPageStateCopyWithImpl<$Res, $Val extends SendGiftPageState>
    implements $SendGiftPageStateCopyWith<$Res> {
  _$SendGiftPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sendGiftPageStatus = null,
    Object? orderId = freezed,
    Object? sendGiftPageError = freezed,
    Object? store = freezed,
    Object? freePromotion = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      sendGiftPageStatus: null == sendGiftPageStatus
          ? _value.sendGiftPageStatus
          : sendGiftPageStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      sendGiftPageError: freezed == sendGiftPageError
          ? _value.sendGiftPageError
          : sendGiftPageError // ignore: cast_nullable_to_non_nullable
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
abstract class _$$SendGiftPageStateImplCopyWith<$Res>
    implements $SendGiftPageStateCopyWith<$Res> {
  factory _$$SendGiftPageStateImplCopyWith(_$SendGiftPageStateImpl value,
          $Res Function(_$SendGiftPageStateImpl) then) =
      __$$SendGiftPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status sendGiftPageStatus,
      String? orderId,
      String? sendGiftPageError,
      Store? store,
      Promotion? freePromotion,
      User? user});
}

/// @nodoc
class __$$SendGiftPageStateImplCopyWithImpl<$Res>
    extends _$SendGiftPageStateCopyWithImpl<$Res, _$SendGiftPageStateImpl>
    implements _$$SendGiftPageStateImplCopyWith<$Res> {
  __$$SendGiftPageStateImplCopyWithImpl(_$SendGiftPageStateImpl _value,
      $Res Function(_$SendGiftPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sendGiftPageStatus = null,
    Object? orderId = freezed,
    Object? sendGiftPageError = freezed,
    Object? store = freezed,
    Object? freePromotion = freezed,
    Object? user = freezed,
  }) {
    return _then(_$SendGiftPageStateImpl(
      sendGiftPageStatus: null == sendGiftPageStatus
          ? _value.sendGiftPageStatus
          : sendGiftPageStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      sendGiftPageError: freezed == sendGiftPageError
          ? _value.sendGiftPageError
          : sendGiftPageError // ignore: cast_nullable_to_non_nullable
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

class _$SendGiftPageStateImpl implements _SendGiftPageState {
  const _$SendGiftPageStateImpl(
      {this.sendGiftPageStatus = Status.init,
      this.orderId,
      this.sendGiftPageError,
      this.store,
      this.freePromotion,
      this.user});

  @override
  @JsonKey()
  final Status sendGiftPageStatus;
  @override
  final String? orderId;
  @override
  final String? sendGiftPageError;
  @override
  final Store? store;
  @override
  final Promotion? freePromotion;
  @override
  final User? user;

  @override
  String toString() {
    return 'SendGiftPageState(sendGiftPageStatus: $sendGiftPageStatus, orderId: $orderId, sendGiftPageError: $sendGiftPageError, store: $store, freePromotion: $freePromotion, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendGiftPageStateImpl &&
            (identical(other.sendGiftPageStatus, sendGiftPageStatus) ||
                other.sendGiftPageStatus == sendGiftPageStatus) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.sendGiftPageError, sendGiftPageError) ||
                other.sendGiftPageError == sendGiftPageError) &&
            (identical(other.store, store) || other.store == store) &&
            (identical(other.freePromotion, freePromotion) ||
                other.freePromotion == freePromotion) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sendGiftPageStatus, orderId,
      sendGiftPageError, store, freePromotion, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendGiftPageStateImplCopyWith<_$SendGiftPageStateImpl> get copyWith =>
      __$$SendGiftPageStateImplCopyWithImpl<_$SendGiftPageStateImpl>(
          this, _$identity);
}

abstract class _SendGiftPageState implements SendGiftPageState {
  const factory _SendGiftPageState(
      {final Status sendGiftPageStatus,
      final String? orderId,
      final String? sendGiftPageError,
      final Store? store,
      final Promotion? freePromotion,
      final User? user}) = _$SendGiftPageStateImpl;

  @override
  Status get sendGiftPageStatus;
  @override
  String? get orderId;
  @override
  String? get sendGiftPageError;
  @override
  Store? get store;
  @override
  Promotion? get freePromotion;
  @override
  User? get user;
  @override
  @JsonKey(ignore: true)
  _$$SendGiftPageStateImplCopyWith<_$SendGiftPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
