import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/address.dart';

part 'address_model.g.dart';
part 'address_model.freezed.dart';

@freezed
class AddressModel with _$AddressModel {
  AddressModel._();
  factory AddressModel({
    required String id,
    required String name,
    required String address,
    String? direction,
  }) = _AddressModel;

  factory AddressModel.fromJson(Map<String, dynamic> json) => _$AddressModelFromJson(json);

  factory AddressModel.fromDomain(Address address) => AddressModel(
        id: address.id,
        name: address.name,
        address: address.address,
        direction: address.direction,
      );

  Address toDomain() => Address(
        id: id,
        name: name,
        address: address,
        direction: direction,
      );
}
