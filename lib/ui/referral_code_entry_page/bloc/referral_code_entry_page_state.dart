part of 'referral_code_entry_page_bloc.dart';

@freezed
class ReferralCodeEntryPageState with _$ReferralCodeEntryPageState {
  const factory ReferralCodeEntryPageState({
    @Default(Status.init) Status addStatus,
    Store? store,
    Curation? curation,
    String? errorMessage,
    String? referralCode,
    String? referredBy,
    @Default(Status.init) Status entryStatus,
  }) = _ReferralCodeEntryPageState;
}
