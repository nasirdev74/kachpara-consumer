// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_user_stores_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ViewUserStoresPageState {
  List<Store>? get stores => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  Status get fetchUserStoresStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ViewUserStoresPageStateCopyWith<ViewUserStoresPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewUserStoresPageStateCopyWith<$Res> {
  factory $ViewUserStoresPageStateCopyWith(ViewUserStoresPageState value,
          $Res Function(ViewUserStoresPageState) then) =
      _$ViewUserStoresPageStateCopyWithImpl<$Res, ViewUserStoresPageState>;
  @useResult
  $Res call({List<Store>? stores, User? user, Status fetchUserStoresStatus});
}

/// @nodoc
class _$ViewUserStoresPageStateCopyWithImpl<$Res,
        $Val extends ViewUserStoresPageState>
    implements $ViewUserStoresPageStateCopyWith<$Res> {
  _$ViewUserStoresPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stores = freezed,
    Object? user = freezed,
    Object? fetchUserStoresStatus = null,
  }) {
    return _then(_value.copyWith(
      stores: freezed == stores
          ? _value.stores
          : stores // ignore: cast_nullable_to_non_nullable
              as List<Store>?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      fetchUserStoresStatus: null == fetchUserStoresStatus
          ? _value.fetchUserStoresStatus
          : fetchUserStoresStatus // ignore: cast_nullable_to_non_nullable
              as Status,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ViewUserStoresPageStateImplCopyWith<$Res>
    implements $ViewUserStoresPageStateCopyWith<$Res> {
  factory _$$ViewUserStoresPageStateImplCopyWith(
          _$ViewUserStoresPageStateImpl value,
          $Res Function(_$ViewUserStoresPageStateImpl) then) =
      __$$ViewUserStoresPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Store>? stores, User? user, Status fetchUserStoresStatus});
}

/// @nodoc
class __$$ViewUserStoresPageStateImplCopyWithImpl<$Res>
    extends _$ViewUserStoresPageStateCopyWithImpl<$Res,
        _$ViewUserStoresPageStateImpl>
    implements _$$ViewUserStoresPageStateImplCopyWith<$Res> {
  __$$ViewUserStoresPageStateImplCopyWithImpl(
      _$ViewUserStoresPageStateImpl _value,
      $Res Function(_$ViewUserStoresPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stores = freezed,
    Object? user = freezed,
    Object? fetchUserStoresStatus = null,
  }) {
    return _then(_$ViewUserStoresPageStateImpl(
      stores: freezed == stores
          ? _value._stores
          : stores // ignore: cast_nullable_to_non_nullable
              as List<Store>?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      fetchUserStoresStatus: null == fetchUserStoresStatus
          ? _value.fetchUserStoresStatus
          : fetchUserStoresStatus // ignore: cast_nullable_to_non_nullable
              as Status,
    ));
  }
}

/// @nodoc

class _$ViewUserStoresPageStateImpl implements _ViewUserStoresPageState {
  const _$ViewUserStoresPageStateImpl(
      {final List<Store>? stores,
      this.user,
      this.fetchUserStoresStatus = Status.init})
      : _stores = stores;

  final List<Store>? _stores;
  @override
  List<Store>? get stores {
    final value = _stores;
    if (value == null) return null;
    if (_stores is EqualUnmodifiableListView) return _stores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final User? user;
  @override
  @JsonKey()
  final Status fetchUserStoresStatus;

  @override
  String toString() {
    return 'ViewUserStoresPageState(stores: $stores, user: $user, fetchUserStoresStatus: $fetchUserStoresStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViewUserStoresPageStateImpl &&
            const DeepCollectionEquality().equals(other._stores, _stores) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.fetchUserStoresStatus, fetchUserStoresStatus) ||
                other.fetchUserStoresStatus == fetchUserStoresStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_stores),
      user,
      fetchUserStoresStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ViewUserStoresPageStateImplCopyWith<_$ViewUserStoresPageStateImpl>
      get copyWith => __$$ViewUserStoresPageStateImplCopyWithImpl<
          _$ViewUserStoresPageStateImpl>(this, _$identity);
}

abstract class _ViewUserStoresPageState implements ViewUserStoresPageState {
  const factory _ViewUserStoresPageState(
      {final List<Store>? stores,
      final User? user,
      final Status fetchUserStoresStatus}) = _$ViewUserStoresPageStateImpl;

  @override
  List<Store>? get stores;
  @override
  User? get user;
  @override
  Status get fetchUserStoresStatus;
  @override
  @JsonKey(ignore: true)
  _$$ViewUserStoresPageStateImplCopyWith<_$ViewUserStoresPageStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
