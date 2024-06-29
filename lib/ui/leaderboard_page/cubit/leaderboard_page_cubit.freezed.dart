// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leaderboard_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LeaderboardPageState {
  Map<User, UserStore>? get stores => throw _privateConstructorUsedError;
  Status get fetchLeaderboardStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LeaderboardPageStateCopyWith<LeaderboardPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaderboardPageStateCopyWith<$Res> {
  factory $LeaderboardPageStateCopyWith(LeaderboardPageState value,
          $Res Function(LeaderboardPageState) then) =
      _$LeaderboardPageStateCopyWithImpl<$Res, LeaderboardPageState>;
  @useResult
  $Res call({Map<User, UserStore>? stores, Status fetchLeaderboardStatus});
}

/// @nodoc
class _$LeaderboardPageStateCopyWithImpl<$Res,
        $Val extends LeaderboardPageState>
    implements $LeaderboardPageStateCopyWith<$Res> {
  _$LeaderboardPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stores = freezed,
    Object? fetchLeaderboardStatus = null,
  }) {
    return _then(_value.copyWith(
      stores: freezed == stores
          ? _value.stores
          : stores // ignore: cast_nullable_to_non_nullable
              as Map<User, UserStore>?,
      fetchLeaderboardStatus: null == fetchLeaderboardStatus
          ? _value.fetchLeaderboardStatus
          : fetchLeaderboardStatus // ignore: cast_nullable_to_non_nullable
              as Status,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeaderboardPageStateImplCopyWith<$Res>
    implements $LeaderboardPageStateCopyWith<$Res> {
  factory _$$LeaderboardPageStateImplCopyWith(_$LeaderboardPageStateImpl value,
          $Res Function(_$LeaderboardPageStateImpl) then) =
      __$$LeaderboardPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<User, UserStore>? stores, Status fetchLeaderboardStatus});
}

/// @nodoc
class __$$LeaderboardPageStateImplCopyWithImpl<$Res>
    extends _$LeaderboardPageStateCopyWithImpl<$Res, _$LeaderboardPageStateImpl>
    implements _$$LeaderboardPageStateImplCopyWith<$Res> {
  __$$LeaderboardPageStateImplCopyWithImpl(_$LeaderboardPageStateImpl _value,
      $Res Function(_$LeaderboardPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stores = freezed,
    Object? fetchLeaderboardStatus = null,
  }) {
    return _then(_$LeaderboardPageStateImpl(
      stores: freezed == stores
          ? _value._stores
          : stores // ignore: cast_nullable_to_non_nullable
              as Map<User, UserStore>?,
      fetchLeaderboardStatus: null == fetchLeaderboardStatus
          ? _value.fetchLeaderboardStatus
          : fetchLeaderboardStatus // ignore: cast_nullable_to_non_nullable
              as Status,
    ));
  }
}

/// @nodoc

class _$LeaderboardPageStateImpl implements _LeaderboardPageState {
  const _$LeaderboardPageStateImpl(
      {final Map<User, UserStore>? stores,
      this.fetchLeaderboardStatus = Status.init})
      : _stores = stores;

  final Map<User, UserStore>? _stores;
  @override
  Map<User, UserStore>? get stores {
    final value = _stores;
    if (value == null) return null;
    if (_stores is EqualUnmodifiableMapView) return _stores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey()
  final Status fetchLeaderboardStatus;

  @override
  String toString() {
    return 'LeaderboardPageState(stores: $stores, fetchLeaderboardStatus: $fetchLeaderboardStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeaderboardPageStateImpl &&
            const DeepCollectionEquality().equals(other._stores, _stores) &&
            (identical(other.fetchLeaderboardStatus, fetchLeaderboardStatus) ||
                other.fetchLeaderboardStatus == fetchLeaderboardStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_stores), fetchLeaderboardStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeaderboardPageStateImplCopyWith<_$LeaderboardPageStateImpl>
      get copyWith =>
          __$$LeaderboardPageStateImplCopyWithImpl<_$LeaderboardPageStateImpl>(
              this, _$identity);
}

abstract class _LeaderboardPageState implements LeaderboardPageState {
  const factory _LeaderboardPageState(
      {final Map<User, UserStore>? stores,
      final Status fetchLeaderboardStatus}) = _$LeaderboardPageStateImpl;

  @override
  Map<User, UserStore>? get stores;
  @override
  Status get fetchLeaderboardStatus;
  @override
  @JsonKey(ignore: true)
  _$$LeaderboardPageStateImplCopyWith<_$LeaderboardPageStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
