import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kachpara/domain/entities/user_store.dart';

part 'user_store_model.freezed.dart';
part 'user_store_model.g.dart';

@freezed
class UserStoreModel with _$UserStoreModel {
  const UserStoreModel._();
  const factory UserStoreModel({
    required String id,
    String? shareableReferralCode,
    String? shareableReferralLink,
    String? shareablefreeProductLink,
    required String sourceReferralCode,
    @Default(0) double? totalRewards,
    @Default(0) int? totalOrders,
    @Default(0) int? totalStoreAdditions,
    @Default(0) int? currentVisits,
    @Default(0) int? totalVisits,
    @Default([]) List<String> outreach, // Make it mandatory with an empty array
    @Default([]) List<int> visits,
  }) = _UserModel;

  factory UserStoreModel.fromJson(Map<String, dynamic> json) => _$UserStoreModelFromJson(json);

  UserStore toDomain() {
    return UserStore(
      id: id,
      shareableReferralCode: shareableReferralCode,
      shareableReferralLink: shareableReferralLink,
      shareablefreeProductLink: shareablefreeProductLink,
      sourceReferralCode: sourceReferralCode,
      totalRewards: totalRewards,
      totalOrders: totalOrders,
      totalStoreAdditions: totalStoreAdditions,
      currentVisits: currentVisits,
      totalVisits: totalVisits,
      outreach: outreach,
      visits: visits,
    );
  }

  factory UserStoreModel.fromDomain(UserStore user) {
    return UserStoreModel(
      id: user.id,
      shareableReferralCode: user.shareableReferralCode,
      shareableReferralLink: user.shareableReferralLink,
      shareablefreeProductLink: user.shareablefreeProductLink,
      sourceReferralCode: user.sourceReferralCode,
      totalRewards: user.totalRewards,
      totalOrders: user.totalOrders,
      totalStoreAdditions: user.totalStoreAdditions,
      currentVisits: user.currentVisits,
      totalVisits: user.totalVisits,
      outreach: user.outreach,
      visits: user.visits,
    );
  }
}
