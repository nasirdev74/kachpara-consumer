// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_balance_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TokenBalance _$TokenBalanceFromJson(Map<String, dynamic> json) {
  return _TokenBalance.fromJson(json);
}

/// @nodoc
mixin _$TokenBalance {
  dynamic get amount => throw _privateConstructorUsedError;
  DateTime? get updateDate => throw _privateConstructorUsedError;
  dynamic get token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TokenBalanceCopyWith<TokenBalance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenBalanceCopyWith<$Res> {
  factory $TokenBalanceCopyWith(
          TokenBalance value, $Res Function(TokenBalance) then) =
      _$TokenBalanceCopyWithImpl<$Res, TokenBalance>;
  @useResult
  $Res call({dynamic amount, DateTime? updateDate, dynamic token});
}

/// @nodoc
class _$TokenBalanceCopyWithImpl<$Res, $Val extends TokenBalance>
    implements $TokenBalanceCopyWith<$Res> {
  _$TokenBalanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? updateDate = freezed,
    Object? token = freezed,
  }) {
    return _then(_value.copyWith(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as dynamic,
      updateDate: freezed == updateDate
          ? _value.updateDate
          : updateDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TokenBalanceImplCopyWith<$Res>
    implements $TokenBalanceCopyWith<$Res> {
  factory _$$TokenBalanceImplCopyWith(
          _$TokenBalanceImpl value, $Res Function(_$TokenBalanceImpl) then) =
      __$$TokenBalanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic amount, DateTime? updateDate, dynamic token});
}

/// @nodoc
class __$$TokenBalanceImplCopyWithImpl<$Res>
    extends _$TokenBalanceCopyWithImpl<$Res, _$TokenBalanceImpl>
    implements _$$TokenBalanceImplCopyWith<$Res> {
  __$$TokenBalanceImplCopyWithImpl(
      _$TokenBalanceImpl _value, $Res Function(_$TokenBalanceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? updateDate = freezed,
    Object? token = freezed,
  }) {
    return _then(_$TokenBalanceImpl(
      amount: freezed == amount ? _value.amount! : amount,
      updateDate: freezed == updateDate
          ? _value.updateDate
          : updateDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      token: freezed == token ? _value.token! : token,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TokenBalanceImpl extends _TokenBalance {
  const _$TokenBalanceImpl(
      {this.amount = '0', this.updateDate, this.token = const TokenModel()})
      : super._();

  factory _$TokenBalanceImpl.fromJson(Map<String, dynamic> json) =>
      _$$TokenBalanceImplFromJson(json);

  @override
  @JsonKey()
  final dynamic amount;
  @override
  final DateTime? updateDate;
  @override
  @JsonKey()
  final dynamic token;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenBalanceImplCopyWith<_$TokenBalanceImpl> get copyWith =>
      __$$TokenBalanceImplCopyWithImpl<_$TokenBalanceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TokenBalanceImplToJson(
      this,
    );
  }
}

abstract class _TokenBalance extends TokenBalance {
  const factory _TokenBalance(
      {final dynamic amount,
      final DateTime? updateDate,
      final dynamic token}) = _$TokenBalanceImpl;
  const _TokenBalance._() : super._();

  factory _TokenBalance.fromJson(Map<String, dynamic> json) =
      _$TokenBalanceImpl.fromJson;

  @override
  dynamic get amount;
  @override
  DateTime? get updateDate;
  @override
  dynamic get token;
  @override
  @JsonKey(ignore: true)
  _$$TokenBalanceImplCopyWith<_$TokenBalanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
