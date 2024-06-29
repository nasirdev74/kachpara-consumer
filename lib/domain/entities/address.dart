import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final String id;
  final String name;
  final String address;
  final String? direction;

  const Address({
    required this.id,
    required this.name,
    required this.address,
    this.direction,
  });

  Address copyWith({
    String? id,
    String? name,
    String? address,
    String? direction,
  }) {
    return Address(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      direction: direction ?? this.direction,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        address,
        direction,
      ];
}
