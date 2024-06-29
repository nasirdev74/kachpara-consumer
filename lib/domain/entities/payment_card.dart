import 'package:equatable/equatable.dart';

class PaymentCard extends Equatable {
  final String last4;
  final String brand;
  final String id;
  final String expMonth;
  final String expYear;
  final String? cvc;

  const PaymentCard({required this.last4, required this.brand, required this.id, required this.expMonth, required this.expYear, this.cvc});

  @override
  List<Object?> get props => [last4, brand, id, expMonth, expYear, cvc];
}
