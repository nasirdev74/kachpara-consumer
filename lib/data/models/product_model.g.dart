// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      price: json['price'] as String,
      imageFileName: json['image_file_name'] as String?,
      description: json['description'] as String?,
      measure: json['measure'] as String?,
      currency: json['currency'] as String?,
      promotionId: json['promotionId'] as String?,
      priceWithSign: json['price_with_sign'] as String?,
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'image_file_name': instance.imageFileName,
      'description': instance.description,
      'measure': instance.measure,
      'currency': instance.currency,
      'promotionId': instance.promotionId,
      'price_with_sign': instance.priceWithSign,
    };
