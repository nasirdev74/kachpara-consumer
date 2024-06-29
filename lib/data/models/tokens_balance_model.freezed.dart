// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tokens_balance_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TokensBalanceModel _$TokensBalanceModelFromJson(Map<String, dynamic> json) {
  return _TokensBalanceModel.fromJson(json);
}

/// @nodoc
mixin _$TokensBalanceModel {
  List<TokenBalance> get tokens => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TokensBalanceModelCopyWith<TokensBalanceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokensBalanceModelCopyWith<$Res> {
  factory $TokensBalanceModelCopyWith(
          TokensBalanceModel value, $Res Function(TokensBalanceModel) then) =
      _$TokensBalanceModelCopyWithImpl<$Res, TokensBalanceModel>;
  @useResult
  $Res call({List<TokenBalance> tokens});
}

/// @nodoc
class _$TokensBalanceModelCopyWithImpl<$Res, $Val extends TokensBalanceModel>
    implements $TokensBalanceModelCopyWith<$Res> {
  _$TokensBalanceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tokens = null,
  }) {
    return _then(_value.copyWith(
      tokens: null == tokens
          ? _value.tokens
          : tokens // ignore: cast_nullable_to_non_nullable
              as List<TokenBalance>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TokensBalanceModelImplCopyWith<$Res>
    implements $TokensBalanceModelCopyWith<$Res> {
  factory _$$TokensBalanceModelImplCopyWith(_$TokensBalanceModelImpl value,
          $Res Function(_$TokensBalanceModelImpl) then) =
      __$$TokensBalanceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TokenBalance> tokens});
}

/// @nodoc
class __$$TokensBalanceModelImplCopyWithImpl<$Res>
    extends _$TokensBalanceModelCopyWithImpl<$Res, _$TokensBalanceModelImpl>
    implements _$$TokensBalanceModelImplCopyWith<$Res> {
  __$$TokensBalanceModelImplCopyWithImpl(_$TokensBalanceModelImpl _value,
      $Res Function(_$TokensBalanceModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tokens = null,
  }) {
    return _then(_$TokensBalanceModelImpl(
      tokens: null == tokens
          ? _value._tokens
          : tokens // ignore: cast_nullable_to_non_nullable
              as List<TokenBalance>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TokensBalanceModelImpl extends _TokensBalanceModel {
  const _$TokensBalanceModelImpl({final List<TokenBalance> tokens = const []})
      : _tokens = tokens,
        super._();

  factory _$TokensBalanceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TokensBalanceModelImplFromJson(json);

  final List<TokenBalance> _tokens;
  @override
  @JsonKey()
  List<TokenBalance> get tokens {
    if (_tokens is EqualUnmodifiableListView) return _tokens;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tokens);
  }

  @override
  String toString() {
    return 'TokensBalanceModel(tokens: $tokens)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokensBalanceModelImpl &&
            const DeepCollectionEquality().equals(other._tokens, _tokens));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tokens));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TokensBalanceModelImplCopyWith<_$TokensBalanceModelImpl> get copyWith =>
      __$$TokensBalanceModelImplCopyWithImpl<_$TokensBalanceModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TokensBalanceModelImplToJson(
      this,
    );
  }
}

abstract class _TokensBalanceModel extends TokensBalanceModel {
  const factory _TokensBalanceModel({final List<TokenBalance> tokens}) =
      _$TokensBalanceModelImpl;
  const _TokensBalanceModel._() : super._();

  factory _TokensBalanceModel.fromJson(Map<String, dynamic> json) =
      _$TokensBalanceModelImpl.fromJson;

  @override
  List<TokenBalance> get tokens;
  @override
  @JsonKey(ignore: true)
  _$$TokensBalanceModelImplCopyWith<_$TokensBalanceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
