import 'package:equatable/equatable.dart';

class UserStore extends Equatable {
  final String id;
  final String? shareableReferralCode;
  final String? shareableReferralLink;
  final String? shareablefreeProductLink;
  final String sourceReferralCode;
  final double? totalRewards;
  final int? totalOrders;
  final int? totalStoreAdditions;
  final int? currentVisits;
  final int? totalVisits;
  final List<String> outreach; // Make it mandatory with an empty array
  final List<int> visits; // Holds timestamps represented in miliseconds since epoch

  const UserStore({
    required this.id,
    required this.shareableReferralCode,
    required this.shareableReferralLink,
    required this.shareablefreeProductLink,
    required this.sourceReferralCode,
    this.totalRewards,
    this.totalOrders,
    this.totalStoreAdditions,
    this.currentVisits,
    this.totalVisits,
    this.outreach = const [],
    this.visits = const [],
  }); // Initialize with an empty array if not provided

  @override
  List<Object?> get props => [
        id,
        shareableReferralCode,
        shareableReferralLink,
        shareablefreeProductLink,
        sourceReferralCode,
        totalRewards,
        totalOrders,
        totalStoreAdditions,
        currentVisits,
        totalVisits,
        outreach,
        visits,
      ];
}
