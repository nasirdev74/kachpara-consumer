import 'package:equatable/equatable.dart';

class RewardBalance extends Equatable {
  final String storeId;
  final double balance;

  const RewardBalance({required this.storeId, required this.balance});

  @override
  List<Object?> get props => [
        storeId,
        balance,
      ];
}
