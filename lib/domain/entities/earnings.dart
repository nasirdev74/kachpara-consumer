import 'package:equatable/equatable.dart';

class Earnings extends Equatable {
  const Earnings({
    required this.id,
    required this.amount,
    required this.createdAt,
    required this.storeId,
    required this.userId,
    required this.orderId,
    required this.storeName,
    required this.userName,
  });

  final String id;
  final double amount;
  final DateTime createdAt;
  final int storeId;
  final int userId;
  final String orderId;
  final String storeName;
  final String userName;

  @override
  List<Object?> get props => [
        id,
        amount,
        createdAt,
        storeId,
        userId,
        orderId,
        storeName,
        userName,
      ];

  factory Earnings.fromJson(Map<String, dynamic> json) {
    return Earnings(
      id: json['id'] as String,
      amount: json['amount'] as double,
      createdAt: json['createdAt'] as DateTime,
      storeId: json['storeId'] as int,
      userId: json['userId'] as int,
      orderId: json['orderId'] as String,
      storeName: json['storeName'] as String,
      userName: json['userName'] as String,
    );
  }
}
