import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String? name;
  final String? phoneNo;
  final String? photoUrl;
  final double rewardPoints;
  final double balance;
  final int totalRefOrders;
  final int totalRefStores;
  final String? selectedAddressId;
  final String? selectedPaymentMethodId;
  final String? studentEmail;
  final bool? isStudentVerified;
  final List<String>? contactUserIds;
  final bool isAdmin;

  const User({
    required this.id,
    this.name,
    this.phoneNo,
    this.photoUrl,
    this.rewardPoints = 0,
    this.balance = 0,
    this.totalRefOrders = 0,
    this.totalRefStores = 0,
    this.selectedAddressId,
    this.selectedPaymentMethodId,
    this.studentEmail,
    this.isStudentVerified,
    this.contactUserIds,
    this.isAdmin = false,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        phoneNo,
        photoUrl,
        rewardPoints,
        balance,
        totalRefStores,
        totalRefOrders,
        selectedAddressId,
        selectedPaymentMethodId,
        studentEmail,
        isStudentVerified,
        contactUserIds,
        isAdmin,
      ];

  User copyWith({
    String? id,
    String? name,
    String? phoneNo,
    String? photoUrl,
    double? rewardPoints,
    double? balance,
    int? totalRefStores,
    int? totalRefOrders,
    String? selectedAddressId,
    String? selectedPaymentMethodId,
    String? studentEmail,
    bool? isStudentVerified,
    List<String>? contactUserIds,
    bool? isAdmin,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      phoneNo: phoneNo ?? this.phoneNo,
      photoUrl: photoUrl ?? this.photoUrl,
      rewardPoints: rewardPoints ?? this.rewardPoints,
      selectedAddressId: selectedAddressId ?? this.selectedAddressId,
      selectedPaymentMethodId: selectedPaymentMethodId ?? this.selectedPaymentMethodId,
      studentEmail: studentEmail ?? this.studentEmail,
      isStudentVerified: isStudentVerified ?? this.isStudentVerified,
      contactUserIds: contactUserIds ?? this.contactUserIds,
      isAdmin: isAdmin ?? this.isAdmin,
    );
  }
}
