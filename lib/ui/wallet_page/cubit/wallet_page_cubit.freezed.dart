// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WalletPageState {
  WalletModel get wallet => throw _privateConstructorUsedError;
  List<TransactionModel> get transactions => throw _privateConstructorUsedError;
  TokenBalance get tokenBalance => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WalletPageStateCopyWith<WalletPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletPageStateCopyWith<$Res> {
  factory $WalletPageStateCopyWith(
          WalletPageState value, $Res Function(WalletPageState) then) =
      _$WalletPageStateCopyWithImpl<$Res, WalletPageState>;
  @useResult
  $Res call(
      {WalletModel wallet,
      List<TransactionModel> transactions,
      TokenBalance tokenBalance,
      Status status,
      String? error});

  $WalletModelCopyWith<$Res> get wallet;
  $TokenBalanceCopyWith<$Res> get tokenBalance;
}

/// @nodoc
class _$WalletPageStateCopyWithImpl<$Res, $Val extends WalletPageState>
    implements $WalletPageStateCopyWith<$Res> {
  _$WalletPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wallet = null,
    Object? transactions = null,
    Object? tokenBalance = null,
    Object? status = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      wallet: null == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as WalletModel,
      transactions: null == transactions
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<TransactionModel>,
      tokenBalance: null == tokenBalance
          ? _value.tokenBalance
          : tokenBalance // ignore: cast_nullable_to_non_nullable
              as TokenBalance,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WalletModelCopyWith<$Res> get wallet {
    return $WalletModelCopyWith<$Res>(_value.wallet, (value) {
      return _then(_value.copyWith(wallet: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TokenBalanceCopyWith<$Res> get tokenBalance {
    return $TokenBalanceCopyWith<$Res>(_value.tokenBalance, (value) {
      return _then(_value.copyWith(tokenBalance: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WalletPageStateImplCopyWith<$Res>
    implements $WalletPageStateCopyWith<$Res> {
  factory _$$WalletPageStateImplCopyWith(_$WalletPageStateImpl value,
          $Res Function(_$WalletPageStateImpl) then) =
      __$$WalletPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {WalletModel wallet,
      List<TransactionModel> transactions,
      TokenBalance tokenBalance,
      Status status,
      String? error});

  @override
  $WalletModelCopyWith<$Res> get wallet;
  @override
  $TokenBalanceCopyWith<$Res> get tokenBalance;
}

/// @nodoc
class __$$WalletPageStateImplCopyWithImpl<$Res>
    extends _$WalletPageStateCopyWithImpl<$Res, _$WalletPageStateImpl>
    implements _$$WalletPageStateImplCopyWith<$Res> {
  __$$WalletPageStateImplCopyWithImpl(
      _$WalletPageStateImpl _value, $Res Function(_$WalletPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wallet = null,
    Object? transactions = null,
    Object? tokenBalance = null,
    Object? status = null,
    Object? error = freezed,
  }) {
    return _then(_$WalletPageStateImpl(
      wallet: null == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as WalletModel,
      transactions: null == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<TransactionModel>,
      tokenBalance: null == tokenBalance
          ? _value.tokenBalance
          : tokenBalance // ignore: cast_nullable_to_non_nullable
              as TokenBalance,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$WalletPageStateImpl implements _WalletPageState {
  const _$WalletPageStateImpl(
      {this.wallet = const WalletModel(),
      final List<TransactionModel> transactions = const [],
      this.tokenBalance = const TokenBalance(),
      this.status = Status.init,
      this.error})
      : _transactions = transactions;

  @override
  @JsonKey()
  final WalletModel wallet;
  final List<TransactionModel> _transactions;
  @override
  @JsonKey()
  List<TransactionModel> get transactions {
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  @override
  @JsonKey()
  final TokenBalance tokenBalance;
  @override
  @JsonKey()
  final Status status;
  @override
  final String? error;

  @override
  String toString() {
    return 'WalletPageState(wallet: $wallet, transactions: $transactions, tokenBalance: $tokenBalance, status: $status, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletPageStateImpl &&
            (identical(other.wallet, wallet) || other.wallet == wallet) &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions) &&
            (identical(other.tokenBalance, tokenBalance) ||
                other.tokenBalance == tokenBalance) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      wallet,
      const DeepCollectionEquality().hash(_transactions),
      tokenBalance,
      status,
      error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletPageStateImplCopyWith<_$WalletPageStateImpl> get copyWith =>
      __$$WalletPageStateImplCopyWithImpl<_$WalletPageStateImpl>(
          this, _$identity);
}

abstract class _WalletPageState implements WalletPageState {
  const factory _WalletPageState(
      {final WalletModel wallet,
      final List<TransactionModel> transactions,
      final TokenBalance tokenBalance,
      final Status status,
      final String? error}) = _$WalletPageStateImpl;

  @override
  WalletModel get wallet;
  @override
  List<TransactionModel> get transactions;
  @override
  TokenBalance get tokenBalance;
  @override
  Status get status;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$WalletPageStateImplCopyWith<_$WalletPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
