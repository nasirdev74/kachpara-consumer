import 'package:equatable/equatable.dart';

class CardDetails extends Equatable {
  final String expMonth;
  final String expYear;
  final String cvc;
  final String number;

  const CardDetails({required this.expMonth, required this.expYear, required this.cvc, required this.number});

  @override
  List<Object?> get props => [expMonth, expYear, cvc, number];
}
