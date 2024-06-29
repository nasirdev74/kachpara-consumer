// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CartPageState {
  Status get getCartStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CartPageStateCopyWith<CartPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartPageStateCopyWith<$Res> {
  factory $CartPageStateCopyWith(
          CartPageState value, $Res Function(CartPageState) then) =
      _$CartPageStateCopyWithImpl<$Res, CartPageState>;
  @useResult
  $Res call({Status getCartStatus});
}

/// @nodoc
class _$CartPageStateCopyWithImpl<$Res, $Val extends CartPageState>
    implements $CartPageStateCopyWith<$Res> {
  _$CartPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getCartStatus = null,
  }) {
    return _then(_value.copyWith(
      getCartStatus: null == getCartStatus
          ? _value.getCartStatus
          : getCartStatus // ignore: cast_nullable_to_non_nullable
              as Status,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartPageStateImplCopyWith<$Res>
    implements $CartPageStateCopyWith<$Res> {
  factory _$$CartPageStateImplCopyWith(
          _$CartPageStateImpl value, $Res Function(_$CartPageStateImpl) then) =
      __$$CartPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status getCartStatus});
}

/// @nodoc
class __$$CartPageStateImplCopyWithImpl<$Res>
    extends _$CartPageStateCopyWithImpl<$Res, _$CartPageStateImpl>
    implements _$$CartPageStateImplCopyWith<$Res> {
  __$$CartPageStateImplCopyWithImpl(
      _$CartPageStateImpl _value, $Res Function(_$CartPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getCartStatus = null,
  }) {
    return _then(_$CartPageStateImpl(
      getCartStatus: null == getCartStatus
          ? _value.getCartStatus
          : getCartStatus // ignore: cast_nullable_to_non_nullable
              as Status,
    ));
  }
}

/// @nodoc

class _$CartPageStateImpl implements _CartPageState {
  const _$CartPageStateImpl({this.getCartStatus = Status.init});

  @override
  @JsonKey()
  final Status getCartStatus;

  @override
  String toString() {
    return 'CartPageState(getCartStatus: $getCartStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartPageStateImpl &&
            (identical(other.getCartStatus, getCartStatus) ||
                other.getCartStatus == getCartStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, getCartStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartPageStateImplCopyWith<_$CartPageStateImpl> get copyWith =>
      __$$CartPageStateImplCopyWithImpl<_$CartPageStateImpl>(this, _$identity);
}

abstract class _CartPageState implements CartPageState {
  const factory _CartPageState({final Status getCartStatus}) =
      _$CartPageStateImpl;

  @override
  Status get getCartStatus;
  @override
  @JsonKey(ignore: true)
  _$$CartPageStateImplCopyWith<_$CartPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
