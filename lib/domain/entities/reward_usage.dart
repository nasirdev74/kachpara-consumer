import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class RewardUsage extends Equatable {
  final String id;
  final double amount;
  final DateTime createdAt;
  final String orderId;
  final String storeName;

  const RewardUsage({required this.id, required this.amount, required this.createdAt, required this.orderId, required this.storeName});
  @override
  List<Object?> get props => [
        id,
        amount,
        createdAt,
        orderId,
        storeName,
      ];

  factory RewardUsage.fromJson(Map<String, dynamic> json) {
    return RewardUsage(
      id: json['id'] as String,
      amount: json['amount'] as double,
      createdAt: (json['createdAt'] as Timestamp).toDate(),
      orderId: json['orderId'] as String,
      storeName: json['storeName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'amount': amount,
      'createdAt': createdAt,
      'orderId': orderId,
      'storeName': storeName,
    };
  }

  RewardUsage copyWith({
    String? id,
    double? amount,
    DateTime? createdAt,
    String? orderId,
    String? storeName,
  }) {
    return RewardUsage(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      createdAt: createdAt ?? this.createdAt,
      orderId: orderId ?? this.orderId,
      storeName: storeName ?? this.storeName,
    );
  }
}
