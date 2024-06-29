// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reward_balance_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RewardBalanceModel _$RewardBalanceModelFromJson(Map<String, dynamic> json) {
  return _RewardBalanceModel.fromJson(json);
}

/// @nodoc
mixin _$RewardBalanceModel {
  String get storeId => throw _privateConstructorUsedError;
  double get balance => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RewardBalanceModelCopyWith<RewardBalanceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RewardBalanceModelCopyWith<$Res> {
  factory $RewardBalanceModelCopyWith(
          RewardBalanceModel value, $Res Function(RewardBalanceModel) then) =
      _$RewardBalanceModelCopyWithImpl<$Res, RewardBalanceModel>;
  @useResult
  $Res call({String storeId, double balance});
}

/// @nodoc
class _$RewardBalanceModelCopyWithImpl<$Res, $Val extends RewardBalanceModel>
    implements $RewardBalanceModelCopyWith<$Res> {
  _$RewardBalanceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeId = null,
    Object? balance = null,
  }) {
    return _then(_value.copyWith(
      storeId: null == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RewardBalanceModelImplCopyWith<$Res>
    implements $RewardBalanceModelCopyWith<$Res> {
  factory _$$RewardBalanceModelImplCopyWith(_$RewardBalanceModelImpl value,
          $Res Function(_$RewardBalanceModelImpl) then) =
      __$$RewardBalanceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String storeId, double balance});
}

/// @nodoc
class __$$RewardBalanceModelImplCopyWithImpl<$Res>
    extends _$RewardBalanceModelCopyWithImpl<$Res, _$RewardBalanceModelImpl>
    implements _$$RewardBalanceModelImplCopyWith<$Res> {
  __$$RewardBalanceModelImplCopyWithImpl(_$RewardBalanceModelImpl _value,
      $Res Function(_$RewardBalanceModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeId = null,
    Object? balance = null,
  }) {
    return _then(_$RewardBalanceModelImpl(
      storeId: null == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RewardBalanceModelImpl extends _RewardBalanceModel {
  const _$RewardBalanceModelImpl({required this.storeId, required this.balance})
      : super._();

  factory _$RewardBalanceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RewardBalanceModelImplFromJson(json);

  @override
  final String storeId;
  @override
  final double balance;

  @override
  String toString() {
    return 'RewardBalanceModel(storeId: $storeId, balance: $balance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RewardBalanceModelImpl &&
            (identical(other.storeId, storeId) || other.storeId == storeId) &&
            (identical(other.balance, balance) || other.balance == balance));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, storeId, balance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RewardBalanceModelImplCopyWith<_$RewardBalanceModelImpl> get copyWith =>
      __$$RewardBalanceModelImplCopyWithImpl<_$RewardBalanceModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RewardBalanceModelImplToJson(
      this,
    );
  }
}

abstract class _RewardBalanceModel extends RewardBalanceModel {
  const factory _RewardBalanceModel(
      {required final String storeId,
      required final double balance}) = _$RewardBalanceModelImpl;
  const _RewardBalanceModel._() : super._();

  factory _RewardBalanceModel.fromJson(Map<String, dynamic> json) =
      _$RewardBalanceModelImpl.fromJson;

  @override
  String get storeId;
  @override
  double get balance;
  @override
  @JsonKey(ignore: true)
  _$$RewardBalanceModelImplCopyWith<_$RewardBalanceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
