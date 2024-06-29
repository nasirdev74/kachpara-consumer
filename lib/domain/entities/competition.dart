import 'package:equatable/equatable.dart';

class Competition extends Equatable {
  final DateTime? startDate;
  final DateTime? endDate;
  final String prize;
  final Map<String, num> outreach;
  final Map<String, num> directreach;
  final Map<String, num> orders;

  const Competition({
    required this.outreach,
    required this.directreach,
    required this.orders,
    required this.startDate,
    required this.endDate,
    required this.prize,
  });

  Competition copyWith({
    Map<String, num>? outreach,
    Map<String, num>? directreach,
    Map<String, num>? orders,
    DateTime? startDate,
    DateTime? endDate,
    String? prize,
  }) {
    return Competition(
      outreach: outreach ?? this.outreach,
      directreach: directreach ?? this.directreach,
      orders: orders ?? this.orders,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      prize: prize ?? this.prize,
    );
  }

  @override
  List<Object?> get props => [outreach, directreach, orders, startDate, endDate, prize];
}
