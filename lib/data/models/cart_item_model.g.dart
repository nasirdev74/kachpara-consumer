// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartItemModelImpl _$$CartItemModelImplFromJson(Map<String, dynamic> json) =>
    _$CartItemModelImpl(
      id: json['id'] as int,
      quantity: json['quantity'] as int,
      product: const CartItemConverter()
          .fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CartItemModelImplToJson(_$CartItemModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'product': const CartItemConverter().toJson(instance.product),
    };
