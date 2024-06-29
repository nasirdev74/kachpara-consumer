// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_detail_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrderDetailPageState {
  Order? get order => throw _privateConstructorUsedError;
  Status get fetchorderStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderDetailPageStateCopyWith<OrderDetailPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDetailPageStateCopyWith<$Res> {
  factory $OrderDetailPageStateCopyWith(OrderDetailPageState value,
          $Res Function(OrderDetailPageState) then) =
      _$OrderDetailPageStateCopyWithImpl<$Res, OrderDetailPageState>;
  @useResult
  $Res call({Order? order, Status fetchorderStatus});
}

/// @nodoc
class _$OrderDetailPageStateCopyWithImpl<$Res,
        $Val extends OrderDetailPageState>
    implements $OrderDetailPageStateCopyWith<$Res> {
  _$OrderDetailPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order = freezed,
    Object? fetchorderStatus = null,
  }) {
    return _then(_value.copyWith(
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as Order?,
      fetchorderStatus: null == fetchorderStatus
          ? _value.fetchorderStatus
          : fetchorderStatus // ignore: cast_nullable_to_non_nullable
              as Status,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderDetailPageStateImplCopyWith<$Res>
    implements $OrderDetailPageStateCopyWith<$Res> {
  factory _$$OrderDetailPageStateImplCopyWith(_$OrderDetailPageStateImpl value,
          $Res Function(_$OrderDetailPageStateImpl) then) =
      __$$OrderDetailPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Order? order, Status fetchorderStatus});
}

/// @nodoc
class __$$OrderDetailPageStateImplCopyWithImpl<$Res>
    extends _$OrderDetailPageStateCopyWithImpl<$Res, _$OrderDetailPageStateImpl>
    implements _$$OrderDetailPageStateImplCopyWith<$Res> {
  __$$OrderDetailPageStateImplCopyWithImpl(_$OrderDetailPageStateImpl _value,
      $Res Function(_$OrderDetailPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order = freezed,
    Object? fetchorderStatus = null,
  }) {
    return _then(_$OrderDetailPageStateImpl(
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as Order?,
      fetchorderStatus: null == fetchorderStatus
          ? _value.fetchorderStatus
          : fetchorderStatus // ignore: cast_nullable_to_non_nullable
              as Status,
    ));
  }
}

/// @nodoc

class _$OrderDetailPageStateImpl implements _OrderDetailPageState {
  const _$OrderDetailPageStateImpl(
      {this.order, this.fetchorderStatus = Status.init});

  @override
  final Order? order;
  @override
  @JsonKey()
  final Status fetchorderStatus;

  @override
  String toString() {
    return 'OrderDetailPageState(order: $order, fetchorderStatus: $fetchorderStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderDetailPageStateImpl &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.fetchorderStatus, fetchorderStatus) ||
                other.fetchorderStatus == fetchorderStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, order, fetchorderStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderDetailPageStateImplCopyWith<_$OrderDetailPageStateImpl>
      get copyWith =>
          __$$OrderDetailPageStateImplCopyWithImpl<_$OrderDetailPageStateImpl>(
              this, _$identity);
}

abstract class _OrderDetailPageState implements OrderDetailPageState {
  const factory _OrderDetailPageState(
      {final Order? order,
      final Status fetchorderStatus}) = _$OrderDetailPageStateImpl;

  @override
  Order? get order;
  @override
  Status get fetchorderStatus;
  @override
  @JsonKey(ignore: true)
  _$$OrderDetailPageStateImplCopyWith<_$OrderDetailPageStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
