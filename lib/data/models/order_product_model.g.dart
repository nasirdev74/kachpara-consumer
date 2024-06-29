// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderProductModelImpl _$$OrderProductModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderProductModelImpl(
      id: json['id'] as int,
      quantity: json['quantity'] as int,
      name: json['name'] as String,
      description: json['description'] as String?,
      measure: json['measure'] as String?,
      image: json['image'] as String?,
      priceWithSign: json['priceWithSign'] as String?,
      currency: json['currency'] as String?,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$$OrderProductModelImplToJson(
        _$OrderProductModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'name': instance.name,
      'description': instance.description,
      'measure': instance.measure,
      'image': instance.image,
      'priceWithSign': instance.priceWithSign,
      'currency': instance.currency,
      'price': instance.price,
    };
