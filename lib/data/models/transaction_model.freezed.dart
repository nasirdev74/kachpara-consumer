// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) {
  return _TransactionModel.fromJson(json);
}

/// @nodoc
mixin _$TransactionModel {
  String get id => throw _privateConstructorUsedError;
  String get blockchain => throw _privateConstructorUsedError;
  String get tokenId => throw _privateConstructorUsedError;
  String get walletId => throw _privateConstructorUsedError;
  String get sourceAddress => throw _privateConstructorUsedError;
  String get destinationAddress => throw _privateConstructorUsedError;
  TransactionType get transactionType => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  List<String> get amounts => throw _privateConstructorUsedError;
  DateTime? get createDate => throw _privateConstructorUsedError;
  DateTime? get updateDate => throw _privateConstructorUsedError;
  String get txHash => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionModelCopyWith<TransactionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionModelCopyWith<$Res> {
  factory $TransactionModelCopyWith(
          TransactionModel value, $Res Function(TransactionModel) then) =
      _$TransactionModelCopyWithImpl<$Res, TransactionModel>;
  @useResult
  $Res call(
      {String id,
      String blockchain,
      String tokenId,
      String walletId,
      String sourceAddress,
      String destinationAddress,
      TransactionType transactionType,
      String state,
      List<String> amounts,
      DateTime? createDate,
      DateTime? updateDate,
      String txHash});
}

/// @nodoc
class _$TransactionModelCopyWithImpl<$Res, $Val extends TransactionModel>
    implements $TransactionModelCopyWith<$Res> {
  _$TransactionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? blockchain = null,
    Object? tokenId = null,
    Object? walletId = null,
    Object? sourceAddress = null,
    Object? destinationAddress = null,
    Object? transactionType = null,
    Object? state = null,
    Object? amounts = null,
    Object? createDate = freezed,
    Object? updateDate = freezed,
    Object? txHash = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      blockchain: null == blockchain
          ? _value.blockchain
          : blockchain // ignore: cast_nullable_to_non_nullable
              as String,
      tokenId: null == tokenId
          ? _value.tokenId
          : tokenId // ignore: cast_nullable_to_non_nullable
              as String,
      walletId: null == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as String,
      sourceAddress: null == sourceAddress
          ? _value.sourceAddress
          : sourceAddress // ignore: cast_nullable_to_non_nullable
              as String,
      destinationAddress: null == destinationAddress
          ? _value.destinationAddress
          : destinationAddress // ignore: cast_nullable_to_non_nullable
              as String,
      transactionType: null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      amounts: null == amounts
          ? _value.amounts
          : amounts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createDate: freezed == createDate
          ? _value.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updateDate: freezed == updateDate
          ? _value.updateDate
          : updateDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      txHash: null == txHash
          ? _value.txHash
          : txHash // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionModelImplCopyWith<$Res>
    implements $TransactionModelCopyWith<$Res> {
  factory _$$TransactionModelImplCopyWith(_$TransactionModelImpl value,
          $Res Function(_$TransactionModelImpl) then) =
      __$$TransactionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String blockchain,
      String tokenId,
      String walletId,
      String sourceAddress,
      String destinationAddress,
      TransactionType transactionType,
      String state,
      List<String> amounts,
      DateTime? createDate,
      DateTime? updateDate,
      String txHash});
}

/// @nodoc
class __$$TransactionModelImplCopyWithImpl<$Res>
    extends _$TransactionModelCopyWithImpl<$Res, _$TransactionModelImpl>
    implements _$$TransactionModelImplCopyWith<$Res> {
  __$$TransactionModelImplCopyWithImpl(_$TransactionModelImpl _value,
      $Res Function(_$TransactionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? blockchain = null,
    Object? tokenId = null,
    Object? walletId = null,
    Object? sourceAddress = null,
    Object? destinationAddress = null,
    Object? transactionType = null,
    Object? state = null,
    Object? amounts = null,
    Object? createDate = freezed,
    Object? updateDate = freezed,
    Object? txHash = null,
  }) {
    return _then(_$TransactionModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      blockchain: null == blockchain
          ? _value.blockchain
          : blockchain // ignore: cast_nullable_to_non_nullable
              as String,
      tokenId: null == tokenId
          ? _value.tokenId
          : tokenId // ignore: cast_nullable_to_non_nullable
              as String,
      walletId: null == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as String,
      sourceAddress: null == sourceAddress
          ? _value.sourceAddress
          : sourceAddress // ignore: cast_nullable_to_non_nullable
              as String,
      destinationAddress: null == destinationAddress
          ? _value.destinationAddress
          : destinationAddress // ignore: cast_nullable_to_non_nullable
              as String,
      transactionType: null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      amounts: null == amounts
          ? _value._amounts
          : amounts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createDate: freezed == createDate
          ? _value.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updateDate: freezed == updateDate
          ? _value.updateDate
          : updateDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      txHash: null == txHash
          ? _value.txHash
          : txHash // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionModelImpl extends _TransactionModel {
  const _$TransactionModelImpl(
      {this.id = "",
      this.blockchain = "",
      this.tokenId = "",
      this.walletId = "",
      this.sourceAddress = "",
      this.destinationAddress = "",
      this.transactionType = TransactionType.DUMMY,
      this.state = "Pending",
      final List<String> amounts = const ["0"],
      this.createDate,
      this.updateDate,
      this.txHash = ""})
      : _amounts = amounts,
        super._();

  factory _$TransactionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionModelImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String blockchain;
  @override
  @JsonKey()
  final String tokenId;
  @override
  @JsonKey()
  final String walletId;
  @override
  @JsonKey()
  final String sourceAddress;
  @override
  @JsonKey()
  final String destinationAddress;
  @override
  @JsonKey()
  final TransactionType transactionType;
  @override
  @JsonKey()
  final String state;
  final List<String> _amounts;
  @override
  @JsonKey()
  List<String> get amounts {
    if (_amounts is EqualUnmodifiableListView) return _amounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_amounts);
  }

  @override
  final DateTime? createDate;
  @override
  final DateTime? updateDate;
  @override
  @JsonKey()
  final String txHash;

  @override
  String toString() {
    return 'TransactionModel(id: $id, blockchain: $blockchain, tokenId: $tokenId, walletId: $walletId, sourceAddress: $sourceAddress, destinationAddress: $destinationAddress, transactionType: $transactionType, state: $state, amounts: $amounts, createDate: $createDate, updateDate: $updateDate, txHash: $txHash)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.blockchain, blockchain) ||
                other.blockchain == blockchain) &&
            (identical(other.tokenId, tokenId) || other.tokenId == tokenId) &&
            (identical(other.walletId, walletId) ||
                other.walletId == walletId) &&
            (identical(other.sourceAddress, sourceAddress) ||
                other.sourceAddress == sourceAddress) &&
            (identical(other.destinationAddress, destinationAddress) ||
                other.destinationAddress == destinationAddress) &&
            (identical(other.transactionType, transactionType) ||
                other.transactionType == transactionType) &&
            (identical(other.state, state) || other.state == state) &&
            const DeepCollectionEquality().equals(other._amounts, _amounts) &&
            (identical(other.createDate, createDate) ||
                other.createDate == createDate) &&
            (identical(other.updateDate, updateDate) ||
                other.updateDate == updateDate) &&
            (identical(other.txHash, txHash) || other.txHash == txHash));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      blockchain,
      tokenId,
      walletId,
      sourceAddress,
      destinationAddress,
      transactionType,
      state,
      const DeepCollectionEquality().hash(_amounts),
      createDate,
      updateDate,
      txHash);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionModelImplCopyWith<_$TransactionModelImpl> get copyWith =>
      __$$TransactionModelImplCopyWithImpl<_$TransactionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionModelImplToJson(
      this,
    );
  }
}

abstract class _TransactionModel extends TransactionModel {
  const factory _TransactionModel(
      {final String id,
      final String blockchain,
      final String tokenId,
      final String walletId,
      final String sourceAddress,
      final String destinationAddress,
      final TransactionType transactionType,
      final String state,
      final List<String> amounts,
      final DateTime? createDate,
      final DateTime? updateDate,
      final String txHash}) = _$TransactionModelImpl;
  const _TransactionModel._() : super._();

  factory _TransactionModel.fromJson(Map<String, dynamic> json) =
      _$TransactionModelImpl.fromJson;

  @override
  String get id;
  @override
  String get blockchain;
  @override
  String get tokenId;
  @override
  String get walletId;
  @override
  String get sourceAddress;
  @override
  String get destinationAddress;
  @override
  TransactionType get transactionType;
  @override
  String get state;
  @override
  List<String> get amounts;
  @override
  DateTime? get createDate;
  @override
  DateTime? get updateDate;
  @override
  String get txHash;
  @override
  @JsonKey(ignore: true)
  _$$TransactionModelImplCopyWith<_$TransactionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
