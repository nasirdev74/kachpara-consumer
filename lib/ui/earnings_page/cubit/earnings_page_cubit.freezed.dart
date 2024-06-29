// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'earnings_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EarningsPageState {
  Status get getEarningsStatus => throw _privateConstructorUsedError;
  List<Earnings> get earnings => throw _privateConstructorUsedError;
  double get balance => throw _privateConstructorUsedError;
  Status get getRewardUsagesStatus => throw _privateConstructorUsedError;
  List<RewardUsage> get rewardUsages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EarningsPageStateCopyWith<EarningsPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EarningsPageStateCopyWith<$Res> {
  factory $EarningsPageStateCopyWith(
          EarningsPageState value, $Res Function(EarningsPageState) then) =
      _$EarningsPageStateCopyWithImpl<$Res, EarningsPageState>;
  @useResult
  $Res call(
      {Status getEarningsStatus,
      List<Earnings> earnings,
      double balance,
      Status getRewardUsagesStatus,
      List<RewardUsage> rewardUsages});
}

/// @nodoc
class _$EarningsPageStateCopyWithImpl<$Res, $Val extends EarningsPageState>
    implements $EarningsPageStateCopyWith<$Res> {
  _$EarningsPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getEarningsStatus = null,
    Object? earnings = null,
    Object? balance = null,
    Object? getRewardUsagesStatus = null,
    Object? rewardUsages = null,
  }) {
    return _then(_value.copyWith(
      getEarningsStatus: null == getEarningsStatus
          ? _value.getEarningsStatus
          : getEarningsStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      earnings: null == earnings
          ? _value.earnings
          : earnings // ignore: cast_nullable_to_non_nullable
              as List<Earnings>,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      getRewardUsagesStatus: null == getRewardUsagesStatus
          ? _value.getRewardUsagesStatus
          : getRewardUsagesStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      rewardUsages: null == rewardUsages
          ? _value.rewardUsages
          : rewardUsages // ignore: cast_nullable_to_non_nullable
              as List<RewardUsage>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$earningsPageStateImplCopyWith<$Res>
    implements $EarningsPageStateCopyWith<$Res> {
  factory _$$earningsPageStateImplCopyWith(_$earningsPageStateImpl value,
          $Res Function(_$earningsPageStateImpl) then) =
      __$$earningsPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status getEarningsStatus,
      List<Earnings> earnings,
      double balance,
      Status getRewardUsagesStatus,
      List<RewardUsage> rewardUsages});
}

/// @nodoc
class __$$earningsPageStateImplCopyWithImpl<$Res>
    extends _$EarningsPageStateCopyWithImpl<$Res, _$earningsPageStateImpl>
    implements _$$earningsPageStateImplCopyWith<$Res> {
  __$$earningsPageStateImplCopyWithImpl(_$earningsPageStateImpl _value,
      $Res Function(_$earningsPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getEarningsStatus = null,
    Object? earnings = null,
    Object? balance = null,
    Object? getRewardUsagesStatus = null,
    Object? rewardUsages = null,
  }) {
    return _then(_$earningsPageStateImpl(
      getEarningsStatus: null == getEarningsStatus
          ? _value.getEarningsStatus
          : getEarningsStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      earnings: null == earnings
          ? _value._earnings
          : earnings // ignore: cast_nullable_to_non_nullable
              as List<Earnings>,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      getRewardUsagesStatus: null == getRewardUsagesStatus
          ? _value.getRewardUsagesStatus
          : getRewardUsagesStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      rewardUsages: null == rewardUsages
          ? _value._rewardUsages
          : rewardUsages // ignore: cast_nullable_to_non_nullable
              as List<RewardUsage>,
    ));
  }
}

/// @nodoc

class _$earningsPageStateImpl implements _earningsPageState {
  const _$earningsPageStateImpl(
      {this.getEarningsStatus = Status.init,
      final List<Earnings> earnings = const [],
      this.balance = 0,
      this.getRewardUsagesStatus = Status.init,
      final List<RewardUsage> rewardUsages = const []})
      : _earnings = earnings,
        _rewardUsages = rewardUsages;

  @override
  @JsonKey()
  final Status getEarningsStatus;
  final List<Earnings> _earnings;
  @override
  @JsonKey()
  List<Earnings> get earnings {
    if (_earnings is EqualUnmodifiableListView) return _earnings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_earnings);
  }

  @override
  @JsonKey()
  final double balance;
  @override
  @JsonKey()
  final Status getRewardUsagesStatus;
  final List<RewardUsage> _rewardUsages;
  @override
  @JsonKey()
  List<RewardUsage> get rewardUsages {
    if (_rewardUsages is EqualUnmodifiableListView) return _rewardUsages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rewardUsages);
  }

  @override
  String toString() {
    return 'EarningsPageState(getEarningsStatus: $getEarningsStatus, earnings: $earnings, balance: $balance, getRewardUsagesStatus: $getRewardUsagesStatus, rewardUsages: $rewardUsages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$earningsPageStateImpl &&
            (identical(other.getEarningsStatus, getEarningsStatus) ||
                other.getEarningsStatus == getEarningsStatus) &&
            const DeepCollectionEquality().equals(other._earnings, _earnings) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.getRewardUsagesStatus, getRewardUsagesStatus) ||
                other.getRewardUsagesStatus == getRewardUsagesStatus) &&
            const DeepCollectionEquality()
                .equals(other._rewardUsages, _rewardUsages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      getEarningsStatus,
      const DeepCollectionEquality().hash(_earnings),
      balance,
      getRewardUsagesStatus,
      const DeepCollectionEquality().hash(_rewardUsages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$earningsPageStateImplCopyWith<_$earningsPageStateImpl> get copyWith =>
      __$$earningsPageStateImplCopyWithImpl<_$earningsPageStateImpl>(
          this, _$identity);
}

abstract class _earningsPageState implements EarningsPageState {
  const factory _earningsPageState(
      {final Status getEarningsStatus,
      final List<Earnings> earnings,
      final double balance,
      final Status getRewardUsagesStatus,
      final List<RewardUsage> rewardUsages}) = _$earningsPageStateImpl;

  @override
  Status get getEarningsStatus;
  @override
  List<Earnings> get earnings;
  @override
  double get balance;
  @override
  Status get getRewardUsagesStatus;
  @override
  List<RewardUsage> get rewardUsages;
  @override
  @JsonKey(ignore: true)
  _$$earningsPageStateImplCopyWith<_$earningsPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
