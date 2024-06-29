import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/user.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const UserModel._();
  const factory UserModel({
    required String id,
    String? name,
    String? photoUrl,
    String? phoneNo,
    String? selectedAddressId,
    String? selectedPaymentMethodId,
    String? studentEmail,
    List<String>? contactUserIds,
    @Default(false) bool? isStudentVerified,
    @Default(0) double rewardPoints,
    @Default(0) double balance,
    @Default(0) int totalRefOrders,
    @Default(0) int totalRefStores,
    @Default(0) int? cartCount,
    @Default(false) bool isAdmin,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  User toDomain() {
    return User(
      id: id,
      name: name,
      photoUrl: photoUrl,
      phoneNo: phoneNo,
      rewardPoints: rewardPoints,
      balance: balance,
      totalRefOrders: totalRefOrders,
      totalRefStores: totalRefStores,
      selectedAddressId: selectedAddressId,
      selectedPaymentMethodId: selectedPaymentMethodId,
      studentEmail: studentEmail,
      isStudentVerified: isStudentVerified,
      contactUserIds: contactUserIds,
      isAdmin: isAdmin,
    );
  }

  factory UserModel.fromDomain(User user) {
    return UserModel(
      id: user.id,
      name: user.name,
      phoneNo: user.phoneNo,
      photoUrl: user.photoUrl,
      rewardPoints: user.rewardPoints,
      balance: user.balance,
      totalRefStores: user.totalRefStores,
      totalRefOrders: user.totalRefOrders,
      selectedAddressId: user.selectedAddressId,
      selectedPaymentMethodId: user.selectedPaymentMethodId,
      studentEmail: user.studentEmail,
      isStudentVerified: user.isStudentVerified,
      contactUserIds: user.contactUserIds,
      isAdmin: user.isAdmin,
    );
  }
}
