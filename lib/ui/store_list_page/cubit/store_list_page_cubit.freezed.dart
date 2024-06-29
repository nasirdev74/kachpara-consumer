// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_list_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StoreListPageState {
  List<Store> get stores => throw _privateConstructorUsedError;
  Status get getStoresStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StoreListPageStateCopyWith<StoreListPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreListPageStateCopyWith<$Res> {
  factory $StoreListPageStateCopyWith(
          StoreListPageState value, $Res Function(StoreListPageState) then) =
      _$StoreListPageStateCopyWithImpl<$Res, StoreListPageState>;
  @useResult
  $Res call({List<Store> stores, Status getStoresStatus});
}

/// @nodoc
class _$StoreListPageStateCopyWithImpl<$Res, $Val extends StoreListPageState>
    implements $StoreListPageStateCopyWith<$Res> {
  _$StoreListPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stores = null,
    Object? getStoresStatus = null,
  }) {
    return _then(_value.copyWith(
      stores: null == stores
          ? _value.stores
          : stores // ignore: cast_nullable_to_non_nullable
              as List<Store>,
      getStoresStatus: null == getStoresStatus
          ? _value.getStoresStatus
          : getStoresStatus // ignore: cast_nullable_to_non_nullable
              as Status,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StoreListPageStateImplCopyWith<$Res>
    implements $StoreListPageStateCopyWith<$Res> {
  factory _$$StoreListPageStateImplCopyWith(_$StoreListPageStateImpl value,
          $Res Function(_$StoreListPageStateImpl) then) =
      __$$StoreListPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Store> stores, Status getStoresStatus});
}

/// @nodoc
class __$$StoreListPageStateImplCopyWithImpl<$Res>
    extends _$StoreListPageStateCopyWithImpl<$Res, _$StoreListPageStateImpl>
    implements _$$StoreListPageStateImplCopyWith<$Res> {
  __$$StoreListPageStateImplCopyWithImpl(_$StoreListPageStateImpl _value,
      $Res Function(_$StoreListPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stores = null,
    Object? getStoresStatus = null,
  }) {
    return _then(_$StoreListPageStateImpl(
      stores: null == stores
          ? _value._stores
          : stores // ignore: cast_nullable_to_non_nullable
              as List<Store>,
      getStoresStatus: null == getStoresStatus
          ? _value.getStoresStatus
          : getStoresStatus // ignore: cast_nullable_to_non_nullable
              as Status,
    ));
  }
}

/// @nodoc

class _$StoreListPageStateImpl implements _StoreListPageState {
  const _$StoreListPageStateImpl(
      {final List<Store> stores = const <Store>[],
      this.getStoresStatus = Status.init})
      : _stores = stores;

  final List<Store> _stores;
  @override
  @JsonKey()
  List<Store> get stores {
    if (_stores is EqualUnmodifiableListView) return _stores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stores);
  }

  @override
  @JsonKey()
  final Status getStoresStatus;

  @override
  String toString() {
    return 'StoreListPageState(stores: $stores, getStoresStatus: $getStoresStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoreListPageStateImpl &&
            const DeepCollectionEquality().equals(other._stores, _stores) &&
            (identical(other.getStoresStatus, getStoresStatus) ||
                other.getStoresStatus == getStoresStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_stores), getStoresStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StoreListPageStateImplCopyWith<_$StoreListPageStateImpl> get copyWith =>
      __$$StoreListPageStateImplCopyWithImpl<_$StoreListPageStateImpl>(
          this, _$identity);
}

abstract class _StoreListPageState implements StoreListPageState {
  const factory _StoreListPageState(
      {final List<Store> stores,
      final Status getStoresStatus}) = _$StoreListPageStateImpl;

  @override
  List<Store> get stores;
  @override
  Status get getStoresStatus;
  @override
  @JsonKey(ignore: true)
  _$$StoreListPageStateImplCopyWith<_$StoreListPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
