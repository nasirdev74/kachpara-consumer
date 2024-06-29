// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transactions_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionsModel _$TransactionsModelFromJson(Map<String, dynamic> json) {
  return _TransactionsModel.fromJson(json);
}

/// @nodoc
mixin _$TransactionsModel {
  List<TransactionModel> get transactions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionsModelCopyWith<TransactionsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionsModelCopyWith<$Res> {
  factory $TransactionsModelCopyWith(
          TransactionsModel value, $Res Function(TransactionsModel) then) =
      _$TransactionsModelCopyWithImpl<$Res, TransactionsModel>;
  @useResult
  $Res call({List<TransactionModel> transactions});
}

/// @nodoc
class _$TransactionsModelCopyWithImpl<$Res, $Val extends TransactionsModel>
    implements $TransactionsModelCopyWith<$Res> {
  _$TransactionsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactions = null,
  }) {
    return _then(_value.copyWith(
      transactions: null == transactions
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<TransactionModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionsModelImplCopyWith<$Res>
    implements $TransactionsModelCopyWith<$Res> {
  factory _$$TransactionsModelImplCopyWith(_$TransactionsModelImpl value,
          $Res Function(_$TransactionsModelImpl) then) =
      __$$TransactionsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TransactionModel> transactions});
}

/// @nodoc
class __$$TransactionsModelImplCopyWithImpl<$Res>
    extends _$TransactionsModelCopyWithImpl<$Res, _$TransactionsModelImpl>
    implements _$$TransactionsModelImplCopyWith<$Res> {
  __$$TransactionsModelImplCopyWithImpl(_$TransactionsModelImpl _value,
      $Res Function(_$TransactionsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactions = null,
  }) {
    return _then(_$TransactionsModelImpl(
      transactions: null == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<TransactionModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionsModelImpl extends _TransactionsModel
    with DiagnosticableTreeMixin {
  const _$TransactionsModelImpl(
      {final List<TransactionModel> transactions = const []})
      : _transactions = transactions,
        super._();

  factory _$TransactionsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionsModelImplFromJson(json);

  final List<TransactionModel> _transactions;
  @override
  @JsonKey()
  List<TransactionModel> get transactions {
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TransactionsModel(transactions: $transactions)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TransactionsModel'))
      ..add(DiagnosticsProperty('transactions', transactions));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionsModelImpl &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_transactions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionsModelImplCopyWith<_$TransactionsModelImpl> get copyWith =>
      __$$TransactionsModelImplCopyWithImpl<_$TransactionsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionsModelImplToJson(
      this,
    );
  }
}

abstract class _TransactionsModel extends TransactionsModel {
  const factory _TransactionsModel(
      {final List<TransactionModel> transactions}) = _$TransactionsModelImpl;
  const _TransactionsModel._() : super._();

  factory _TransactionsModel.fromJson(Map<String, dynamic> json) =
      _$TransactionsModelImpl.fromJson;

  @override
  List<TransactionModel> get transactions;
  @override
  @JsonKey(ignore: true)
  _$$TransactionsModelImplCopyWith<_$TransactionsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
