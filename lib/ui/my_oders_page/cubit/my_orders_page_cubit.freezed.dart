// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_orders_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MyOrdersPageState {
  dynamic get getOrdersStatus => throw _privateConstructorUsedError;
  List<Order> get activeOrders => throw _privateConstructorUsedError;
  List<Order> get ordersHistory => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyOrdersPageStateCopyWith<MyOrdersPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyOrdersPageStateCopyWith<$Res> {
  factory $MyOrdersPageStateCopyWith(
          MyOrdersPageState value, $Res Function(MyOrdersPageState) then) =
      _$MyOrdersPageStateCopyWithImpl<$Res, MyOrdersPageState>;
  @useResult
  $Res call(
      {dynamic getOrdersStatus,
      List<Order> activeOrders,
      List<Order> ordersHistory});
}

/// @nodoc
class _$MyOrdersPageStateCopyWithImpl<$Res, $Val extends MyOrdersPageState>
    implements $MyOrdersPageStateCopyWith<$Res> {
  _$MyOrdersPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getOrdersStatus = freezed,
    Object? activeOrders = null,
    Object? ordersHistory = null,
  }) {
    return _then(_value.copyWith(
      getOrdersStatus: freezed == getOrdersStatus
          ? _value.getOrdersStatus
          : getOrdersStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
      activeOrders: null == activeOrders
          ? _value.activeOrders
          : activeOrders // ignore: cast_nullable_to_non_nullable
              as List<Order>,
      ordersHistory: null == ordersHistory
          ? _value.ordersHistory
          : ordersHistory // ignore: cast_nullable_to_non_nullable
              as List<Order>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyOrdersPageStateImplCopyWith<$Res>
    implements $MyOrdersPageStateCopyWith<$Res> {
  factory _$$MyOrdersPageStateImplCopyWith(_$MyOrdersPageStateImpl value,
          $Res Function(_$MyOrdersPageStateImpl) then) =
      __$$MyOrdersPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic getOrdersStatus,
      List<Order> activeOrders,
      List<Order> ordersHistory});
}

/// @nodoc
class __$$MyOrdersPageStateImplCopyWithImpl<$Res>
    extends _$MyOrdersPageStateCopyWithImpl<$Res, _$MyOrdersPageStateImpl>
    implements _$$MyOrdersPageStateImplCopyWith<$Res> {
  __$$MyOrdersPageStateImplCopyWithImpl(_$MyOrdersPageStateImpl _value,
      $Res Function(_$MyOrdersPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getOrdersStatus = freezed,
    Object? activeOrders = null,
    Object? ordersHistory = null,
  }) {
    return _then(_$MyOrdersPageStateImpl(
      getOrdersStatus: freezed == getOrdersStatus
          ? _value.getOrdersStatus!
          : getOrdersStatus,
      activeOrders: null == activeOrders
          ? _value._activeOrders
          : activeOrders // ignore: cast_nullable_to_non_nullable
              as List<Order>,
      ordersHistory: null == ordersHistory
          ? _value._ordersHistory
          : ordersHistory // ignore: cast_nullable_to_non_nullable
              as List<Order>,
    ));
  }
}

/// @nodoc

class _$MyOrdersPageStateImpl implements _MyOrdersPageState {
  const _$MyOrdersPageStateImpl(
      {this.getOrdersStatus = Status.init,
      final List<Order> activeOrders = const [],
      final List<Order> ordersHistory = const []})
      : _activeOrders = activeOrders,
        _ordersHistory = ordersHistory;

  @override
  @JsonKey()
  final dynamic getOrdersStatus;
  final List<Order> _activeOrders;
  @override
  @JsonKey()
  List<Order> get activeOrders {
    if (_activeOrders is EqualUnmodifiableListView) return _activeOrders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activeOrders);
  }

  final List<Order> _ordersHistory;
  @override
  @JsonKey()
  List<Order> get ordersHistory {
    if (_ordersHistory is EqualUnmodifiableListView) return _ordersHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ordersHistory);
  }

  @override
  String toString() {
    return 'MyOrdersPageState(getOrdersStatus: $getOrdersStatus, activeOrders: $activeOrders, ordersHistory: $ordersHistory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyOrdersPageStateImpl &&
            const DeepCollectionEquality()
                .equals(other.getOrdersStatus, getOrdersStatus) &&
            const DeepCollectionEquality()
                .equals(other._activeOrders, _activeOrders) &&
            const DeepCollectionEquality()
                .equals(other._ordersHistory, _ordersHistory));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(getOrdersStatus),
      const DeepCollectionEquality().hash(_activeOrders),
      const DeepCollectionEquality().hash(_ordersHistory));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyOrdersPageStateImplCopyWith<_$MyOrdersPageStateImpl> get copyWith =>
      __$$MyOrdersPageStateImplCopyWithImpl<_$MyOrdersPageStateImpl>(
          this, _$identity);
}

abstract class _MyOrdersPageState implements MyOrdersPageState {
  const factory _MyOrdersPageState(
      {final dynamic getOrdersStatus,
      final List<Order> activeOrders,
      final List<Order> ordersHistory}) = _$MyOrdersPageStateImpl;

  @override
  dynamic get getOrdersStatus;
  @override
  List<Order> get activeOrders;
  @override
  List<Order> get ordersHistory;
  @override
  @JsonKey(ignore: true)
  _$$MyOrdersPageStateImplCopyWith<_$MyOrdersPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
