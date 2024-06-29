// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String,
      name: json['name'] as String?,
      photoUrl: json['photoUrl'] as String?,
      phoneNo: json['phoneNo'] as String?,
      selectedAddressId: json['selectedAddressId'] as String?,
      selectedPaymentMethodId: json['selectedPaymentMethodId'] as String?,
      studentEmail: json['studentEmail'] as String?,
      contactUserIds: (json['contactUserIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      isStudentVerified: json['isStudentVerified'] as bool? ?? false,
      rewardPoints: (json['rewardPoints'] as num?)?.toDouble() ?? 0,
      balance: (json['balance'] as num?)?.toDouble() ?? 0,
      totalRefOrders: json['totalRefOrders'] as int? ?? 0,
      totalRefStores: json['totalRefStores'] as int? ?? 0,
      cartCount: json['cartCount'] as int? ?? 0,
      isAdmin: json['isAdmin'] as bool? ?? false,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'photoUrl': instance.photoUrl,
      'phoneNo': instance.phoneNo,
      'selectedAddressId': instance.selectedAddressId,
      'selectedPaymentMethodId': instance.selectedPaymentMethodId,
      'studentEmail': instance.studentEmail,
      'contactUserIds': instance.contactUserIds,
      'isStudentVerified': instance.isStudentVerified,
      'rewardPoints': instance.rewardPoints,
      'balance': instance.balance,
      'totalRefOrders': instance.totalRefOrders,
      'totalRefStores': instance.totalRefStores,
      'cartCount': instance.cartCount,
      'isAdmin': instance.isAdmin,
    };
