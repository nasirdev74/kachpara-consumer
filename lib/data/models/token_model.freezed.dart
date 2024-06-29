// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TokenModel _$TokenModelFromJson(Map<String, dynamic> json) {
  return _TokenModel.fromJson(json);
}

/// @nodoc
mixin _$TokenModel {
  String get id => throw _privateConstructorUsedError;
  String get blockchain => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;
  int get decimals => throw _privateConstructorUsedError;
  bool get isNative => throw _privateConstructorUsedError;
  DateTime? get updateDate => throw _privateConstructorUsedError;
  DateTime? get createDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TokenModelCopyWith<TokenModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenModelCopyWith<$Res> {
  factory $TokenModelCopyWith(
          TokenModel value, $Res Function(TokenModel) then) =
      _$TokenModelCopyWithImpl<$Res, TokenModel>;
  @useResult
  $Res call(
      {String id,
      String blockchain,
      String name,
      String symbol,
      int decimals,
      bool isNative,
      DateTime? updateDate,
      DateTime? createDate});
}

/// @nodoc
class _$TokenModelCopyWithImpl<$Res, $Val extends TokenModel>
    implements $TokenModelCopyWith<$Res> {
  _$TokenModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? blockchain = null,
    Object? name = null,
    Object? symbol = null,
    Object? decimals = null,
    Object? isNative = null,
    Object? updateDate = freezed,
    Object? createDate = freezed,
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      decimals: null == decimals
          ? _value.decimals
          : decimals // ignore: cast_nullable_to_non_nullable
              as int,
      isNative: null == isNative
          ? _value.isNative
          : isNative // ignore: cast_nullable_to_non_nullable
              as bool,
      updateDate: freezed == updateDate
          ? _value.updateDate
          : updateDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createDate: freezed == createDate
          ? _value.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TokenModelImplCopyWith<$Res>
    implements $TokenModelCopyWith<$Res> {
  factory _$$TokenModelImplCopyWith(
          _$TokenModelImpl value, $Res Function(_$TokenModelImpl) then) =
      __$$TokenModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String blockchain,
      String name,
      String symbol,
      int decimals,
      bool isNative,
      DateTime? updateDate,
      DateTime? createDate});
}

/// @nodoc
class __$$TokenModelImplCopyWithImpl<$Res>
    extends _$TokenModelCopyWithImpl<$Res, _$TokenModelImpl>
    implements _$$TokenModelImplCopyWith<$Res> {
  __$$TokenModelImplCopyWithImpl(
      _$TokenModelImpl _value, $Res Function(_$TokenModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? blockchain = null,
    Object? name = null,
    Object? symbol = null,
    Object? decimals = null,
    Object? isNative = null,
    Object? updateDate = freezed,
    Object? createDate = freezed,
  }) {
    return _then(_$TokenModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      blockchain: null == blockchain
          ? _value.blockchain
          : blockchain // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      decimals: null == decimals
          ? _value.decimals
          : decimals // ignore: cast_nullable_to_non_nullable
              as int,
      isNative: null == isNative
          ? _value.isNative
          : isNative // ignore: cast_nullable_to_non_nullable
              as bool,
      updateDate: freezed == updateDate
          ? _value.updateDate
          : updateDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createDate: freezed == createDate
          ? _value.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TokenModelImpl extends _TokenModel {
  const _$TokenModelImpl(
      {this.id = "",
      this.blockchain = "",
      this.name = "",
      this.symbol = "",
      this.decimals = 0,
      this.isNative = false,
      this.updateDate,
      this.createDate})
      : super._();

  factory _$TokenModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TokenModelImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String blockchain;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String symbol;
  @override
  @JsonKey()
  final int decimals;
  @override
  @JsonKey()
  final bool isNative;
  @override
  final DateTime? updateDate;
  @override
  final DateTime? createDate;

  @override
  String toString() {
    return 'TokenModel(id: $id, blockchain: $blockchain, name: $name, symbol: $symbol, decimals: $decimals, isNative: $isNative, updateDate: $updateDate, createDate: $createDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.blockchain, blockchain) ||
                other.blockchain == blockchain) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.decimals, decimals) ||
                other.decimals == decimals) &&
            (identical(other.isNative, isNative) ||
                other.isNative == isNative) &&
            (identical(other.updateDate, updateDate) ||
                other.updateDate == updateDate) &&
            (identical(other.createDate, createDate) ||
                other.createDate == createDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, blockchain, name, symbol,
      decimals, isNative, updateDate, createDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenModelImplCopyWith<_$TokenModelImpl> get copyWith =>
      __$$TokenModelImplCopyWithImpl<_$TokenModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TokenModelImplToJson(
      this,
    );
  }
}

abstract class _TokenModel extends TokenModel {
  const factory _TokenModel(
      {final String id,
      final String blockchain,
      final String name,
      final String symbol,
      final int decimals,
      final bool isNative,
      final DateTime? updateDate,
      final DateTime? createDate}) = _$TokenModelImpl;
  const _TokenModel._() : super._();

  factory _TokenModel.fromJson(Map<String, dynamic> json) =
      _$TokenModelImpl.fromJson;

  @override
  String get id;
  @override
  String get blockchain;
  @override
  String get name;
  @override
  String get symbol;
  @override
  int get decimals;
  @override
  bool get isNative;
  @override
  DateTime? get updateDate;
  @override
  DateTime? get createDate;
  @override
  @JsonKey(ignore: true)
  _$$TokenModelImplCopyWith<_$TokenModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
