// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'competition_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CompetitionModelImpl _$$CompetitionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CompetitionModelImpl(
      prize: json['prize'] as String,
      outreach: Map<String, num>.from(json['outreach'] as Map),
      directreach: Map<String, num>.from(json['directreach'] as Map),
      orders: Map<String, num>.from(json['orders'] as Map),
      startDate:
          const DateTimeConverter().fromJson(json['startDate'] as Timestamp?),
      endDate:
          const DateTimeConverter().fromJson(json['endDate'] as Timestamp?),
    );

Map<String, dynamic> _$$CompetitionModelImplToJson(
        _$CompetitionModelImpl instance) =>
    <String, dynamic>{
      'prize': instance.prize,
      'outreach': instance.outreach,
      'directreach': instance.directreach,
      'orders': instance.orders,
      'startDate': const DateTimeConverter().toJson(instance.startDate),
      'endDate': const DateTimeConverter().toJson(instance.endDate),
    };
