// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TransactionState {
  TransactionModel? get transaction => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TransactionStateCopyWith<TransactionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionStateCopyWith<$Res> {
  factory $TransactionStateCopyWith(
          TransactionState value, $Res Function(TransactionState) then) =
      _$TransactionStateCopyWithImpl<$Res, TransactionState>;
  @useResult
  $Res call({TransactionModel? transaction, Status status, String? error});

  $TransactionModelCopyWith<$Res>? get transaction;
}

/// @nodoc
class _$TransactionStateCopyWithImpl<$Res, $Val extends TransactionState>
    implements $TransactionStateCopyWith<$Res> {
  _$TransactionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transaction = freezed,
    Object? status = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      transaction: freezed == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as TransactionModel?,
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
  $TransactionModelCopyWith<$Res>? get transaction {
    if (_value.transaction == null) {
      return null;
    }

    return $TransactionModelCopyWith<$Res>(_value.transaction!, (value) {
      return _then(_value.copyWith(transaction: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TransactionStateImplCopyWith<$Res>
    implements $TransactionStateCopyWith<$Res> {
  factory _$$TransactionStateImplCopyWith(_$TransactionStateImpl value,
          $Res Function(_$TransactionStateImpl) then) =
      __$$TransactionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TransactionModel? transaction, Status status, String? error});

  @override
  $TransactionModelCopyWith<$Res>? get transaction;
}

/// @nodoc
class __$$TransactionStateImplCopyWithImpl<$Res>
    extends _$TransactionStateCopyWithImpl<$Res, _$TransactionStateImpl>
    implements _$$TransactionStateImplCopyWith<$Res> {
  __$$TransactionStateImplCopyWithImpl(_$TransactionStateImpl _value,
      $Res Function(_$TransactionStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transaction = freezed,
    Object? status = null,
    Object? error = freezed,
  }) {
    return _then(_$TransactionStateImpl(
      transaction: freezed == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as TransactionModel?,
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

class _$TransactionStateImpl implements _TransactionState {
  _$TransactionStateImpl(
      {this.transaction, this.status = Status.init, this.error});

  @override
  final TransactionModel? transaction;
  @override
  @JsonKey()
  final Status status;
  @override
  final String? error;

  @override
  String toString() {
    return 'TransactionState(transaction: $transaction, status: $status, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionStateImpl &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, transaction, status, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionStateImplCopyWith<_$TransactionStateImpl> get copyWith =>
      __$$TransactionStateImplCopyWithImpl<_$TransactionStateImpl>(
          this, _$identity);
}

abstract class _TransactionState implements TransactionState {
  factory _TransactionState(
      {final TransactionModel? transaction,
      final Status status,
      final String? error}) = _$TransactionStateImpl;

  @override
  TransactionModel? get transaction;
  @override
  Status get status;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$TransactionStateImplCopyWith<_$TransactionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
