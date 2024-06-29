// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'created_transaction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreatedTransactionModel _$CreatedTransactionModelFromJson(
    Map<String, dynamic> json) {
  return _CreatedTransactionModel.fromJson(json);
}

/// @nodoc
mixin _$CreatedTransactionModel {
  String get id => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreatedTransactionModelCopyWith<CreatedTransactionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatedTransactionModelCopyWith<$Res> {
  factory $CreatedTransactionModelCopyWith(CreatedTransactionModel value,
          $Res Function(CreatedTransactionModel) then) =
      _$CreatedTransactionModelCopyWithImpl<$Res, CreatedTransactionModel>;
  @useResult
  $Res call({String id, String state});
}

/// @nodoc
class _$CreatedTransactionModelCopyWithImpl<$Res,
        $Val extends CreatedTransactionModel>
    implements $CreatedTransactionModelCopyWith<$Res> {
  _$CreatedTransactionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? state = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreatedTransactionModelImplCopyWith<$Res>
    implements $CreatedTransactionModelCopyWith<$Res> {
  factory _$$CreatedTransactionModelImplCopyWith(
          _$CreatedTransactionModelImpl value,
          $Res Function(_$CreatedTransactionModelImpl) then) =
      __$$CreatedTransactionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String state});
}

/// @nodoc
class __$$CreatedTransactionModelImplCopyWithImpl<$Res>
    extends _$CreatedTransactionModelCopyWithImpl<$Res,
        _$CreatedTransactionModelImpl>
    implements _$$CreatedTransactionModelImplCopyWith<$Res> {
  __$$CreatedTransactionModelImplCopyWithImpl(
      _$CreatedTransactionModelImpl _value,
      $Res Function(_$CreatedTransactionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? state = null,
  }) {
    return _then(_$CreatedTransactionModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreatedTransactionModelImpl extends _CreatedTransactionModel {
  const _$CreatedTransactionModelImpl({this.id = "", this.state = ""})
      : super._();

  factory _$CreatedTransactionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreatedTransactionModelImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String state;

  @override
  String toString() {
    return 'CreatedTransactionModel(id: $id, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatedTransactionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, state);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatedTransactionModelImplCopyWith<_$CreatedTransactionModelImpl>
      get copyWith => __$$CreatedTransactionModelImplCopyWithImpl<
          _$CreatedTransactionModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreatedTransactionModelImplToJson(
      this,
    );
  }
}

abstract class _CreatedTransactionModel extends CreatedTransactionModel {
  const factory _CreatedTransactionModel(
      {final String id, final String state}) = _$CreatedTransactionModelImpl;
  const _CreatedTransactionModel._() : super._();

  factory _CreatedTransactionModel.fromJson(Map<String, dynamic> json) =
      _$CreatedTransactionModelImpl.fromJson;

  @override
  String get id;
  @override
  String get state;
  @override
  @JsonKey(ignore: true)
  _$$CreatedTransactionModelImplCopyWith<_$CreatedTransactionModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
