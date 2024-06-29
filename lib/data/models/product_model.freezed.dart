// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$ProductModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_file_name')
  String? get imageFileName => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get measure => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  String? get promotionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_with_sign')
  String? get priceWithSign => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductModelCopyWith<ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
          ProductModel value, $Res Function(ProductModel) then) =
      _$ProductModelCopyWithImpl<$Res, ProductModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      String price,
      @JsonKey(name: 'image_file_name') String? imageFileName,
      String? description,
      String? measure,
      String? currency,
      String? promotionId,
      @JsonKey(name: 'price_with_sign') String? priceWithSign});
}

/// @nodoc
class _$ProductModelCopyWithImpl<$Res, $Val extends ProductModel>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? imageFileName = freezed,
    Object? description = freezed,
    Object? measure = freezed,
    Object? currency = freezed,
    Object? promotionId = freezed,
    Object? priceWithSign = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      imageFileName: freezed == imageFileName
          ? _value.imageFileName
          : imageFileName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      measure: freezed == measure
          ? _value.measure
          : measure // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      promotionId: freezed == promotionId
          ? _value.promotionId
          : promotionId // ignore: cast_nullable_to_non_nullable
              as String?,
      priceWithSign: freezed == priceWithSign
          ? _value.priceWithSign
          : priceWithSign // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductImplCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$$ProductImplCopyWith(
          _$ProductImpl value, $Res Function(_$ProductImpl) then) =
      __$$ProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String price,
      @JsonKey(name: 'image_file_name') String? imageFileName,
      String? description,
      String? measure,
      String? currency,
      String? promotionId,
      @JsonKey(name: 'price_with_sign') String? priceWithSign});
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$ProductModelCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
      _$ProductImpl _value, $Res Function(_$ProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? imageFileName = freezed,
    Object? description = freezed,
    Object? measure = freezed,
    Object? currency = freezed,
    Object? promotionId = freezed,
    Object? priceWithSign = freezed,
  }) {
    return _then(_$ProductImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      imageFileName: freezed == imageFileName
          ? _value.imageFileName
          : imageFileName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      measure: freezed == measure
          ? _value.measure
          : measure // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      promotionId: freezed == promotionId
          ? _value.promotionId
          : promotionId // ignore: cast_nullable_to_non_nullable
              as String?,
      priceWithSign: freezed == priceWithSign
          ? _value.priceWithSign
          : priceWithSign // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductImpl extends _Product {
  const _$ProductImpl(
      {required this.id,
      required this.name,
      required this.price,
      @JsonKey(name: 'image_file_name') this.imageFileName,
      this.description,
      this.measure,
      this.currency,
      this.promotionId,
      @JsonKey(name: 'price_with_sign') this.priceWithSign})
      : super._();

  factory _$ProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String price;
  @override
  @JsonKey(name: 'image_file_name')
  final String? imageFileName;
  @override
  final String? description;
  @override
  final String? measure;
  @override
  final String? currency;
  @override
  final String? promotionId;
  @override
  @JsonKey(name: 'price_with_sign')
  final String? priceWithSign;

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, price: $price, imageFileName: $imageFileName, description: $description, measure: $measure, currency: $currency, promotionId: $promotionId, priceWithSign: $priceWithSign)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.imageFileName, imageFileName) ||
                other.imageFileName == imageFileName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.measure, measure) || other.measure == measure) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.promotionId, promotionId) ||
                other.promotionId == promotionId) &&
            (identical(other.priceWithSign, priceWithSign) ||
                other.priceWithSign == priceWithSign));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, price, imageFileName,
      description, measure, currency, promotionId, priceWithSign);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductImplToJson(
      this,
    );
  }
}

abstract class _Product extends ProductModel {
  const factory _Product(
          {required final int id,
          required final String name,
          required final String price,
          @JsonKey(name: 'image_file_name') final String? imageFileName,
          final String? description,
          final String? measure,
          final String? currency,
          final String? promotionId,
          @JsonKey(name: 'price_with_sign') final String? priceWithSign}) =
      _$ProductImpl;
  const _Product._() : super._();

  factory _Product.fromJson(Map<String, dynamic> json) = _$ProductImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get price;
  @override
  @JsonKey(name: 'image_file_name')
  String? get imageFileName;
  @override
  String? get description;
  @override
  String? get measure;
  @override
  String? get currency;
  @override
  String? get promotionId;
  @override
  @JsonKey(name: 'price_with_sign')
  String? get priceWithSign;
  @override
  @JsonKey(ignore: true)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
