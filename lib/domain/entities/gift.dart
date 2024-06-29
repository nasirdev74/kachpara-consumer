import 'package:equatable/equatable.dart';

class Gift extends Equatable {
  final String type;
  final String? senderUserId;
  final String? senderName;
  final String? giftDescription;
  final String orderId;
  final String status;

  const Gift({
    required this.type,
    required this.orderId,
    required this.status,
    this.senderUserId,
    this.senderName,
    this.giftDescription,
  });

  @override
  List<Object?> get props => [type, orderId, senderUserId, status, giftDescription, senderName];

  Gift copyWith({
    String? id,
    String? type,
    String? senderUserId,
    String? orderId,
    String? status,
    String? senderName,
    String? giftDescription,
  }) {
    return Gift(
      type: type ?? this.type,
      senderUserId: senderUserId ?? this.senderUserId,
      orderId: orderId ?? this.orderId,
      status: status ?? this.status,
      giftDescription: giftDescription ?? this.giftDescription,
      senderName: senderName ?? this.senderName,
    );
  }
}
