import 'package:equatable/equatable.dart';

class ReferralCode extends Equatable {
  final String code;
  final String? storeId;
  final String? curationId;
  final String ownerUserId;

  const ReferralCode({required this.code, this.storeId, this.curationId, required this.ownerUserId});

  @override
  List<Object?> get props => [
        code,
        storeId,
        curationId,
        ownerUserId,
      ];
}
