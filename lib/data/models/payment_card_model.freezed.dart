// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_card_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentCardModel _$PaymentCardModelFromJson(Map<String, dynamic> json) {
  return _PaymentCardModel.fromJson(json);
}

/// @nodoc
mixin _$PaymentCardModel {
  @JsonKey(readValue: _readId)
  String get id => throw _privateConstructorUsedError;
  @JsonKey(readValue: _readBrand)
  String get brand => throw _privateConstructorUsedError;
  @JsonKey(readValue: _readLast4)
  String get last4 => throw _privateConstructorUsedError;
  @JsonKey(readValue: _readExpMonth)
  int get expMonth => throw _privateConstructorUsedError;
  @JsonKey(readValue: _readExpYear)
  int get expYear => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentCardModelCopyWith<PaymentCardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentCardModelCopyWith<$Res> {
  factory $PaymentCardModelCopyWith(
          PaymentCardModel value, $Res Function(PaymentCardModel) then) =
      _$PaymentCardModelCopyWithImpl<$Res, PaymentCardModel>;
  @useResult
  $Res call(
      {@JsonKey(readValue: _readId) String id,
      @JsonKey(readValue: _readBrand) String brand,
      @JsonKey(readValue: _readLast4) String last4,
      @JsonKey(readValue: _readExpMonth) int expMonth,
      @JsonKey(readValue: _readExpYear) int expYear});
}

/// @nodoc
class _$PaymentCardModelCopyWithImpl<$Res, $Val extends PaymentCardModel>
    implements $PaymentCardModelCopyWith<$Res> {
  _$PaymentCardModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? brand = null,
    Object? last4 = null,
    Object? expMonth = null,
    Object? expYear = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      last4: null == last4
          ? _value.last4
          : last4 // ignore: cast_nullable_to_non_nullable
              as String,
      expMonth: null == expMonth
          ? _value.expMonth
          : expMonth // ignore: cast_nullable_to_non_nullable
              as int,
      expYear: null == expYear
          ? _value.expYear
          : expYear // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentCardModelImplCopyWith<$Res>
    implements $PaymentCardModelCopyWith<$Res> {
  factory _$$PaymentCardModelImplCopyWith(_$PaymentCardModelImpl value,
          $Res Function(_$PaymentCardModelImpl) then) =
      __$$PaymentCardModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(readValue: _readId) String id,
      @JsonKey(readValue: _readBrand) String brand,
      @JsonKey(readValue: _readLast4) String last4,
      @JsonKey(readValue: _readExpMonth) int expMonth,
      @JsonKey(readValue: _readExpYear) int expYear});
}

/// @nodoc
class __$$PaymentCardModelImplCopyWithImpl<$Res>
    extends _$PaymentCardModelCopyWithImpl<$Res, _$PaymentCardModelImpl>
    implements _$$PaymentCardModelImplCopyWith<$Res> {
  __$$PaymentCardModelImplCopyWithImpl(_$PaymentCardModelImpl _value,
      $Res Function(_$PaymentCardModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? brand = null,
    Object? last4 = null,
    Object? expMonth = null,
    Object? expYear = null,
  }) {
    return _then(_$PaymentCardModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      last4: null == last4
          ? _value.last4
          : last4 // ignore: cast_nullable_to_non_nullable
              as String,
      expMonth: null == expMonth
          ? _value.expMonth
          : expMonth // ignore: cast_nullable_to_non_nullable
              as int,
      expYear: null == expYear
          ? _value.expYear
          : expYear // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentCardModelImpl extends _PaymentCardModel {
  _$PaymentCardModelImpl(
      {@JsonKey(readValue: _readId) required this.id,
      @JsonKey(readValue: _readBrand) required this.brand,
      @JsonKey(readValue: _readLast4) required this.last4,
      @JsonKey(readValue: _readExpMonth) required this.expMonth,
      @JsonKey(readValue: _readExpYear) required this.expYear})
      : super._();

  factory _$PaymentCardModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentCardModelImplFromJson(json);

  @override
  @JsonKey(readValue: _readId)
  final String id;
  @override
  @JsonKey(readValue: _readBrand)
  final String brand;
  @override
  @JsonKey(readValue: _readLast4)
  final String last4;
  @override
  @JsonKey(readValue: _readExpMonth)
  final int expMonth;
  @override
  @JsonKey(readValue: _readExpYear)
  final int expYear;

  @override
  String toString() {
    return 'PaymentCardModel(id: $id, brand: $brand, last4: $last4, expMonth: $expMonth, expYear: $expYear)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentCardModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.last4, last4) || other.last4 == last4) &&
            (identical(other.expMonth, expMonth) ||
                other.expMonth == expMonth) &&
            (identical(other.expYear, expYear) || other.expYear == expYear));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, brand, last4, expMonth, expYear);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentCardModelImplCopyWith<_$PaymentCardModelImpl> get copyWith =>
      __$$PaymentCardModelImplCopyWithImpl<_$PaymentCardModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentCardModelImplToJson(
      this,
    );
  }
}

abstract class _PaymentCardModel extends PaymentCardModel {
  factory _PaymentCardModel(
          {@JsonKey(readValue: _readId) required final String id,
          @JsonKey(readValue: _readBrand) required final String brand,
          @JsonKey(readValue: _readLast4) required final String last4,
          @JsonKey(readValue: _readExpMonth) required final int expMonth,
          @JsonKey(readValue: _readExpYear) required final int expYear}) =
      _$PaymentCardModelImpl;
  _PaymentCardModel._() : super._();

  factory _PaymentCardModel.fromJson(Map<String, dynamic> json) =
      _$PaymentCardModelImpl.fromJson;

  @override
  @JsonKey(readValue: _readId)
  String get id;
  @override
  @JsonKey(readValue: _readBrand)
  String get brand;
  @override
  @JsonKey(readValue: _readLast4)
  String get last4;
  @override
  @JsonKey(readValue: _readExpMonth)
  int get expMonth;
  @override
  @JsonKey(readValue: _readExpYear)
  int get expYear;
  @override
  @JsonKey(ignore: true)
  _$$PaymentCardModelImplCopyWith<_$PaymentCardModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
