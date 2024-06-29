// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderProductModel _$OrderProductModelFromJson(Map<String, dynamic> json) {
  return _OrderProductModel.fromJson(json);
}

/// @nodoc
mixin _$OrderProductModel {
  int get id => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get measure => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get priceWithSign => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderProductModelCopyWith<OrderProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderProductModelCopyWith<$Res> {
  factory $OrderProductModelCopyWith(
          OrderProductModel value, $Res Function(OrderProductModel) then) =
      _$OrderProductModelCopyWithImpl<$Res, OrderProductModel>;
  @useResult
  $Res call(
      {int id,
      int quantity,
      String name,
      String? description,
      String? measure,
      String? image,
      String? priceWithSign,
      String? currency,
      double price});
}

/// @nodoc
class _$OrderProductModelCopyWithImpl<$Res, $Val extends OrderProductModel>
    implements $OrderProductModelCopyWith<$Res> {
  _$OrderProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quantity = null,
    Object? name = null,
    Object? description = freezed,
    Object? measure = freezed,
    Object? image = freezed,
    Object? priceWithSign = freezed,
    Object? currency = freezed,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      measure: freezed == measure
          ? _value.measure
          : measure // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      priceWithSign: freezed == priceWithSign
          ? _value.priceWithSign
          : priceWithSign // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderProductModelImplCopyWith<$Res>
    implements $OrderProductModelCopyWith<$Res> {
  factory _$$OrderProductModelImplCopyWith(_$OrderProductModelImpl value,
          $Res Function(_$OrderProductModelImpl) then) =
      __$$OrderProductModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int quantity,
      String name,
      String? description,
      String? measure,
      String? image,
      String? priceWithSign,
      String? currency,
      double price});
}

/// @nodoc
class __$$OrderProductModelImplCopyWithImpl<$Res>
    extends _$OrderProductModelCopyWithImpl<$Res, _$OrderProductModelImpl>
    implements _$$OrderProductModelImplCopyWith<$Res> {
  __$$OrderProductModelImplCopyWithImpl(_$OrderProductModelImpl _value,
      $Res Function(_$OrderProductModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quantity = null,
    Object? name = null,
    Object? description = freezed,
    Object? measure = freezed,
    Object? image = freezed,
    Object? priceWithSign = freezed,
    Object? currency = freezed,
    Object? price = null,
  }) {
    return _then(_$OrderProductModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      measure: freezed == measure
          ? _value.measure
          : measure // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      priceWithSign: freezed == priceWithSign
          ? _value.priceWithSign
          : priceWithSign // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderProductModelImpl extends _OrderProductModel {
  _$OrderProductModelImpl(
      {required this.id,
      required this.quantity,
      required this.name,
      this.description,
      this.measure,
      this.image,
      this.priceWithSign,
      this.currency,
      required this.price})
      : super._();

  factory _$OrderProductModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderProductModelImplFromJson(json);

  @override
  final int id;
  @override
  final int quantity;
  @override
  final String name;
  @override
  final String? description;
  @override
  final String? measure;
  @override
  final String? image;
  @override
  final String? priceWithSign;
  @override
  final String? currency;
  @override
  final double price;

  @override
  String toString() {
    return 'OrderProductModel(id: $id, quantity: $quantity, name: $name, description: $description, measure: $measure, image: $image, priceWithSign: $priceWithSign, currency: $currency, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderProductModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.measure, measure) || other.measure == measure) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.priceWithSign, priceWithSign) ||
                other.priceWithSign == priceWithSign) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, quantity, name, description,
      measure, image, priceWithSign, currency, price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderProductModelImplCopyWith<_$OrderProductModelImpl> get copyWith =>
      __$$OrderProductModelImplCopyWithImpl<_$OrderProductModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderProductModelImplToJson(
      this,
    );
  }
}

abstract class _OrderProductModel extends OrderProductModel {
  factory _OrderProductModel(
      {required final int id,
      required final int quantity,
      required final String name,
      final String? description,
      final String? measure,
      final String? image,
      final String? priceWithSign,
      final String? currency,
      required final double price}) = _$OrderProductModelImpl;
  _OrderProductModel._() : super._();

  factory _OrderProductModel.fromJson(Map<String, dynamic> json) =
      _$OrderProductModelImpl.fromJson;

  @override
  int get id;
  @override
  int get quantity;
  @override
  String get name;
  @override
  String? get description;
  @override
  String? get measure;
  @override
  String? get image;
  @override
  String? get priceWithSign;
  @override
  String? get currency;
  @override
  double get price;
  @override
  @JsonKey(ignore: true)
  _$$OrderProductModelImplCopyWith<_$OrderProductModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
