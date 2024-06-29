// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reward_share_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RewardSharePageState {
  Store? get store => throw _privateConstructorUsedError;
  UserStore? get userStore => throw _privateConstructorUsedError;
  Status get getRewardStatus => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RewardSharePageStateCopyWith<RewardSharePageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RewardSharePageStateCopyWith<$Res> {
  factory $RewardSharePageStateCopyWith(RewardSharePageState value,
          $Res Function(RewardSharePageState) then) =
      _$RewardSharePageStateCopyWithImpl<$Res, RewardSharePageState>;
  @useResult
  $Res call(
      {Store? store,
      UserStore? userStore,
      Status getRewardStatus,
      String? error});
}

/// @nodoc
class _$RewardSharePageStateCopyWithImpl<$Res,
        $Val extends RewardSharePageState>
    implements $RewardSharePageStateCopyWith<$Res> {
  _$RewardSharePageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? store = freezed,
    Object? userStore = freezed,
    Object? getRewardStatus = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      store: freezed == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as Store?,
      userStore: freezed == userStore
          ? _value.userStore
          : userStore // ignore: cast_nullable_to_non_nullable
              as UserStore?,
      getRewardStatus: null == getRewardStatus
          ? _value.getRewardStatus
          : getRewardStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RewardSharePageStateImplCopyWith<$Res>
    implements $RewardSharePageStateCopyWith<$Res> {
  factory _$$RewardSharePageStateImplCopyWith(_$RewardSharePageStateImpl value,
          $Res Function(_$RewardSharePageStateImpl) then) =
      __$$RewardSharePageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Store? store,
      UserStore? userStore,
      Status getRewardStatus,
      String? error});
}

/// @nodoc
class __$$RewardSharePageStateImplCopyWithImpl<$Res>
    extends _$RewardSharePageStateCopyWithImpl<$Res, _$RewardSharePageStateImpl>
    implements _$$RewardSharePageStateImplCopyWith<$Res> {
  __$$RewardSharePageStateImplCopyWithImpl(_$RewardSharePageStateImpl _value,
      $Res Function(_$RewardSharePageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? store = freezed,
    Object? userStore = freezed,
    Object? getRewardStatus = null,
    Object? error = freezed,
  }) {
    return _then(_$RewardSharePageStateImpl(
      store: freezed == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as Store?,
      userStore: freezed == userStore
          ? _value.userStore
          : userStore // ignore: cast_nullable_to_non_nullable
              as UserStore?,
      getRewardStatus: null == getRewardStatus
          ? _value.getRewardStatus
          : getRewardStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$RewardSharePageStateImpl implements _RewardSharePageState {
  const _$RewardSharePageStateImpl(
      {this.store,
      this.userStore,
      this.getRewardStatus = Status.init,
      this.error});

  @override
  final Store? store;
  @override
  final UserStore? userStore;
  @override
  @JsonKey()
  final Status getRewardStatus;
  @override
  final String? error;

  @override
  String toString() {
    return 'RewardSharePageState(store: $store, userStore: $userStore, getRewardStatus: $getRewardStatus, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RewardSharePageStateImpl &&
            (identical(other.store, store) || other.store == store) &&
            (identical(other.userStore, userStore) ||
                other.userStore == userStore) &&
            (identical(other.getRewardStatus, getRewardStatus) ||
                other.getRewardStatus == getRewardStatus) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, store, userStore, getRewardStatus, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RewardSharePageStateImplCopyWith<_$RewardSharePageStateImpl>
      get copyWith =>
          __$$RewardSharePageStateImplCopyWithImpl<_$RewardSharePageStateImpl>(
              this, _$identity);
}

abstract class _RewardSharePageState implements RewardSharePageState {
  const factory _RewardSharePageState(
      {final Store? store,
      final UserStore? userStore,
      final Status getRewardStatus,
      final String? error}) = _$RewardSharePageStateImpl;

  @override
  Store? get store;
  @override
  UserStore? get userStore;
  @override
  Status get getRewardStatus;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$RewardSharePageStateImplCopyWith<_$RewardSharePageStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
